export STOCK_HOME=/root/stock/
cd /root/cs221_project/baselines
sh ./test_all_100.sh
python ../extract_results.py $STOCK_HOME/results
cat $STOCK_HOME/results/final_result.json