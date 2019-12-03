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

div_dir = '{}/{}'.format(environ['STOCK_HOME'], 'div')
stock_home = environ['STOCK_HOME']
all_tics = []
all_prices = {}

def get_2018_div(data_list):
    div_2018 = 0.0
    cnt = 0
    for l in data_list:
        dt = datetime.fromtimestamp(l['date']/1000)
        if dt.year==2018 and l['type']==1:
            div_2018 += l['value']
            cnt += 1
    return (div_2018, cnt)

def get_tickers():
    with open('{}/dow_jones_30_ticker.txt'.format(stock_home)) as f:
        tickers = f.readlines()
    tickers = [x.strip() for x in tickers]
    return tickers

def get_batch_quote(tic_lst):
    ts = TimeSeries(key=environ['AlphaVantageKey'], output_format='pandas')
    data, meta_data = ts.get_batch_stock_quotes(symbols=tic_lst)
    data.describe()
    return data

def get_all_price():
    global all_prices
    if all_prices and len(all_prices) > 0:
        return all_prices
    prices_file = join(stock_home, "all.prices.json")
    if isfile(prices_file):
        with open(prices_file, "r") as f:
            print("loading price from file {}".format(prices_file))
            all_prices = json.load(f)
            return all_prices

    lst = get_list_has_div()
    y = get_batch_quote(lst[:30])
    print(y)
    all_prices.update(dict(zip(y['1. symbol'], y['2. price'])))
    for i in range(30, len(lst), 30):
        print("Getting price for:{}".format(lst[i:i+30]))
        y = get_batch_quote(lst[i:i+30])
        all_prices.update(dict(zip(y['1. symbol'], y['2. price'])))
        print(y)
        time.sleep(20)
    #all_prices = dict(zip(y['1. symbol'], y['2. price']))
    print("write to file--")
    with open(join(stock_home, "all.prices.json"), "w") as f:
        json.dump(all_prices, f)
    return all_prices

def get_single_quote(quote_data_file):
    with open(quote_data_file) as f:
        data = json.load(f)
        return [data['data']['quote']['symbol'], \
                data['data']['quote']['turnover_rate'], \
                data['data']['quote']['pe_lyr'], \
                data['data']['quote']['market_capital']]

def get_quote_xueqiu():
    quote_list = []
    quote_dir = join(stock_home, "quote")
    for f in listdir(quote_dir):
        if f[-11:]=="_quote.json":
                quote_list.append(get_single_quote(join(quote_dir,f)))
    return quote_list


def get_list_has_div():
    global all_tics
    if all_tics and len(all_tics) > 0:
        return all_tics
    tics = set()
    for f in listdir(div_dir):
        if f[-5:]==".json":
            if os.path.getsize(join(div_dir, f)) > 11:
                tic = f.split(".")[0]
                tics.add(tic)
    all_tics = list(tics)
    #all_tics = all_tics[:60]
    return all_tics

if __name__ == "__main__":
    #get_batch_quote([])
    tics = get_list_has_div()
    quotes_pd = pd.DataFrame.from_records(get_quote_xueqiu())
    turnover_dct = dict(zip(quotes_pd[0], quotes_pd[1]))
    pe_dct = dict(zip(quotes_pd[0], quotes_pd[2]))
    cap_dct = dict(zip(quotes_pd[0], quotes_pd[3]))
    #data_1 = pd.read_csv('{0}/30.csv'.format(stock_home))
    #data_2 = data_1[data_1.date.isin(['2019-03-06'])][['4. close','tic']]
    tic_price = get_all_price() #
    result_list = []
    print(tic_price)
    for tic in quotes_pd[0]:
        div_file = join(div_dir, "{}.json".format(tic))
        if not isfile(div_file) or tic not in tic_price or float(tic_price[tic]) <0.00001:
            print("skip for {}".format(tic))
            continue
        with open(div_file) as json_file:
            tic_data = json.load(json_file)
            div, cnt = get_2018_div(tic_data['list'])
            print("{}:Price:{}, Div:{}".format(tic, tic_price[tic], div))
            result_list.append((tic, tic_price[tic], div, div/float(tic_price[tic]), cnt, turnover_dct[tic], pe_dct[tic], cap_dct[tic]))
    result_list.sort(key=lambda v:v[3])   
    print(len(result_list))
    with open(join(stock_home, "div_list_selected.json"), "w") as write_file:
        json.dump(result_list, write_file) 
