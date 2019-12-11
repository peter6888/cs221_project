export STOCK_HOME=/root/stock/
p=$(pwd)
echo $p /root/cs221_project/baselines
python -m baselines.run --alg=ddpg --env=Stock-v0 --network=mlp --num_timesteps=1e4 --play
cd /root/cs221_project/baselines
python -m baselines.run --alg=ddpg --env=Stock-v0 --network=mlp --num_timesteps=1e4 --play
ls /root/cs221_project/baselines
python extract_results.py $STOCK_HOME/results
cat $STOCK_HOME/results/final_result.json
