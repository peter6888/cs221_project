export STOCK_HOME=/root/stock/
cd /root/cs221_project/baselines
python -m baselines.run --alg=ddpg --env=Stock-v0 --network=mlp --num_timesteps=1e4 --play
python ../extract_results.py $STOCK_HOME/results
cat $STOCK_HOME/results/final_result.json
