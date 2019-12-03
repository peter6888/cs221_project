import matplotlib.pyplot as plt
from os import environ, mkdir, listdir
from os.path import isfile, isdir, join
from datetime import datetime

stock_home = environ['STOCK_HOME']
import pandas as pd
import time
from pathlib import Path

csv_dir = '{}/{}'.format(stock_home, 'csv')
dow_jones = pd.read_csv("{}/{}".format(stock_home, '^DJI.csv'))
print(dow_jones.tail())

dow_jones['_dd_'] = pd.to_datetime(dow_jones.date)
dow_jones['datadate'] = dow_jones['_dd_'].dt.strftime('%Y%m%d')
dow_jones['datadate'] = pd.to_numeric(dow_jones['datadate'])

# adj_closes = dow_jones[dow_jones.datadate > 20190000]['5. adjusted close']
# dates = dow_jones[dow_jones.datadate > 20190000]['datadate']
adj_closes = dow_jones['5. adjusted close']
dates = dow_jones['datadate']
# print(adj_closes.tail())
# print(dates.tail())
'''
4996    27691.4902
4997    27691.4902
4998    27783.5898
4999    27781.9609
5000    28004.8906
Name: 5. adjusted close, dtype: float64
4996    20191111
4997    20191112
4998    20191113
4999    20191114
5000    20191115
Name: datadate, dtype: int64
'''
def dp_get_profit_by_shares(prices, start_fund=100000):
    '''
    Use Dynmaic Programming to get the max profit based on price history.
    Note that the allowed action are (buy, sell, short), and have limitations
        a) basiclly trading once per day
        b) and sell can only happens after buy
    '''
    current_value = start_fund
    market_values = [current_value]
    changes = []
    for i in range(len(prices) - 1):
        if prices[i+1] > prices[i]: # buy i-th day sell (i+1)-th day  
            increased = prices[i+1] / prices[i] # > 1.0
            changes.append(increased)
            market_values.append(market_values[-1] * increased)
        elif prices[i+1] < prices[i]: # short i-th day and sell-short (i+1)-th day
            decreased = prices[i+1] / prices[i] # < 1.0
            market_values.append(market_values[-1] / decreased)
            changes.append(decreased)
    return changes, market_values

def get_profit_with_range(start_fund=10000, start_date=20190000, end_date=20191019):
    '''
    get profit with range [start_date, end_date) inclusive on start_date, inclusive end_date
    '''
    adj_closes = dow_jones[dow_jones.datadate >= start_date][dow_jones.datadate < end_date]['5. adjusted close']
    dates = dow_jones[dow_jones.datadate >= start_date][dow_jones.datadate < end_date]['datadate']
    return dp_get_profit_by_shares(adj_closes.tolist(), start_fund)


changes, market_values = get_profit_with_range()
print(market_values)
''' Test Range: [20190000, 20191019)
[10000, 10290.934091106677, 10629.76113798206, 
...
33745.26941166532, 33775.138533193145, 34097.72428511024]
'''
'''
2 training range, each training range have 3 test range
-- for training range 2001 Jan<=2008 April
  1. Wave trending 2008 May -   2008 August
  2. Down trending 2008 Sept - 2008 Dec
  3. Up trending 2009 Mar - 2009 June
-- for training range 2001 Jan <= 2018 August
  1. Down trending 2018 Sept - 2018 Dec
  2. Up trending 2019 Jan - 2019 April
  3. Wave trending 2019 May - 2019 August (edited) 
'''
test_ranges = [
    (20080501, 20080901, "wave1"), 
    (20080901, 20090000, "down1"), 
    (20090301, 20090701, "up1"),
    (20180901, 20190000, "down2"), 
    (20190101, 20190501, "up2"), 
    (20190501, 20190901, "wave2")
]
print("===============different Oracles in different trends of market===========")
for start_date, end_date, name in test_ranges:
    _, market_values = get_profit_with_range(start_date=start_date, end_date=end_date)
    print("{} from {} to {}".format(name, start_date, end_date))
    print("Total {} trading days".format(len(market_values)))
    print("Market values:")
    print(market_values)
    return_rate = market_values[-1]/100.0 - 100.0
    print("Return rate:{:.4f}%".format(return_rate))
    print("Annuallized return rate:{:.4f}%".format(return_rate * 365 / len(market_values)))

def get_baseline_dji_growth(start_fund=10000, start_date=20190000, end_date=20191019):
    account_growth = []
    dji_price = dow_jones[dow_jones.datadate >= start_date][dow_jones.datadate < end_date]['5. adjusted close']
    daily_return = dji_price.pct_change(1)
    daily_return = daily_return[1:]
    daily_return.reset_index()
    initial_amount = start_fund
    total_amount = initial_amount
    account_growth.append(initial_amount)
    for i in range(len(daily_return)):
        total_amount = total_amount * daily_return.iloc[i] + total_amount
        account_growth.append(total_amount)
    return account_growth

print("===============different Baseline in different trends of market===========")
for start_date, end_date, name in test_ranges:
    market_values = get_baseline_dji_growth(start_date=start_date, end_date=end_date)
    print("{} from {} to {}".format(name, start_date, end_date))
    print("Total {} trading days".format(len(market_values)))
    print("Market values:")
    print(market_values)
    return_rate = market_values[-1]/100.0 - 100.0
    print("Return rate:{:.4f}%".format(return_rate))
    print("Annuallized return rate:{:.4f}%".format(return_rate * 365 / len(market_values)))
