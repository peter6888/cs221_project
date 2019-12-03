from os import listdir, environ, mkdir
from os.path import isfile, isdir, join
from alpha_vantage.timeseries import TimeSeries
from alpha_vantage.techindicators import TechIndicators
import pandas as pd
import time
import os
from pathlib import Path
from datetime import datetime
import json
from selectolax.parser import HTMLParser

ab_html_dir = '{}/{}'.format(environ['STOCK_HOME'], 'ab_data')
stock_home = environ['STOCK_HOME']
all_tics = []
all_prices = {}

def get_tickers():
    with open('{}/dow_jones_30_ticker.txt'.format(stock_home)) as f:
        tickers = f.readlines()
    tickers = [x.strip() for x in tickers]
    return tickers

def get_single_quote(quote_data_file):
    with open(quote_data_file) as f:
        data = json.load(f)
        return [data['data']['quote']['symbol'], \
                data['data']['quote']['turnover_rate'], \
                data['data']['quote']['pe_lyr'], \
                data['data']['quote']['market_capital']]

def get_list_has_ab():
    global all_tics
    if all_tics and len(all_tics) > 0:
        return all_tics
    tics = set()
    for f in listdir(ab_html_dir):
        if f[-5:]==".html":
            if os.path.getsize(join(ab_html_dir, f)) > 200:
                tic = f.split(".")[0]
                tics.add(tic)
    all_tics = list(tics)
    #all_tics = all_tics[:60]
    return all_tics

def get_last_signal(ab_parser):
    return ab_parser.css_first("#MainContent_LastSignal").text()

def get_last_pattern(ab_parser):
    return ab_parser.css_first("#MainContent_LastPattern").text()

def get_stars(ab_parser):
    return [ab_parser.css_first("#MainContent_star{}".format(m)).text()[:1] for m in [6,12,24]]

def get_star_6m(ab_parser):
    return get_stars(ab_parser)[0]

def get_star_12m(ab_parser):
    return get_stars(ab_parser)[1]

def get_pattern_history(ab_parser):
    return get_history(ab_parser, "#MainContent_PatternHistory_DXDataRow")

def get_signal_history_24(ab_parser):
    return get_history(ab_parser, "#MainContent_signalpagehistory_PatternHistory24_DXDataRow")

def get_performance_history(ab_parser):
    history = []
    table_css_by_id = "#MainContent_PatternPageGrid1_DXMainTable"
    table = ab_parser.css_first(table_css_by_id)
    tr_by_class = table.css(".dxgvDataRow")
    history = []
    for i, row in enumerate(tr_by_class):
        row_list = [v.text(strip=True) for v in row.css(".dxgv")]
        if row_list[1].startswith("BULLISH"):
            row_list[0] = "BULLISH"
        elif row_list[1].startswith("BEARISH"):
            row_list[0] = "BEARISH"
        history.append(row_list)
    return history

def get_history(ab_parser, css_prefix):
    history = []
    i = 0
    while True:
        row = ab_parser.css_first('{}{}'.format(css_prefix, i))
        if not row or not row.css_first('.dxgv'):
            break
        row_list = [v.text(strip=True) for v in row.css(".dxgv")]
        history.append(row_list)
        #print(row_list)
        i = i + 1
    return history

if __name__ == "__main__":
    tics_all = get_list_has_ab()
    df_all_patterns = pd.DataFrame()
    for tic in tics_all:
        html_file = join(ab_html_dir, "{}.html".format(tic))
        print("====for tic {}=======".format(tic))
        if not isfile(html_file):
            print("Not found {}.html".format(tic))
            continue
        with open(html_file, "r") as html_read:
            html_content = html_read.read()
        ab_parser = HTMLParser(html_content)
        print("===={}=====\nLast Signal: {}, Last Pattern: {}, Star Value (6m): {}, Star Value (12m): {}, Star Value (24m): {}".format(tic, \
            get_last_signal(ab_parser), \
            get_last_pattern(ab_parser), \
            get_star_6m(ab_parser), \
            get_star_12m(ab_parser), \
            get_stars(ab_parser)[-1]))

        patterns = get_pattern_history(ab_parser)
        if len(patterns)==0:
            continue

        df_patterns = pd.DataFrame.from_records(patterns)
        print("Length of Pattern:{}, Signal:{}, Performance:{}".format(\
            len(patterns), \
            len(get_signal_history_24(ab_parser)), \
            len(get_performance_history(ab_parser))))
        df_patterns.columns = ['date', 'pattern', 'buy_level', 'stop_loss', 'sell_level', 'confirmation_level', 'confirmation_date', 'signal']
        df_patterns['symbol'] = tic
        df_all_patterns = df_all_patterns.append(df_patterns)
        #print(df_patterns.tail(10))
    df_all_patterns.to_csv(join(stock_home, "ab_patterns.csv"), index=False)