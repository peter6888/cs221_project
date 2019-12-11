export STOCK_HOME=/root/stock/
cd /root/cs221_project/baselines
for (( c=1; c<=50; c++ ))
do
   echo "Run $c times"
   python -m baselines.run --alg=trpo_mpi --env=Stock-v0 --network=mlp --num_timesteps=1e4 --play --train_start=20010101  --train_end=20080500 --test_start=20190501 --test_end=20190831
   python -m baselines.run --alg=trpo_mpi --env=Stock-v0 --network=mlp --num_timesteps=1e4 --play --train_start=20010101  --train_end=20080500 --test_start=20180901 --test_end=20181231
   python -m baselines.run --alg=ddpg     --env=Stock-v0 --network=mlp --num_timesteps=1e4 --play --train_start=20010101  --train_end=20080500 --test_start=20190101 --test_end=20190430
done
ls /root/cs221_project/baselines
python extract_results.py $STOCK_HOME/results
cat $STOCK_HOME/results/final_result.json
