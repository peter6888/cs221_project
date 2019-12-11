export STOCK_HOME=/root/stock/
cd /root/cs221_project/baselines
bash ./test_all_100.sh
ls /root/cs221_project/baselines
python extract_results.py $STOCK_HOME/results
cat $STOCK_HOME/results/final_result.json