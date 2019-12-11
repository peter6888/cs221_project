export STOCK_HOME=/root/stock/
cd /root/cs221_project/baselines
for (( c=1; c<=50; c++ ))
do
   echo "Run $c times"

   ## Training range 1/2001 - 4/2008 ##
   # Wave Trending Test range 5/2008 - 8/2008
   python -m baselines.run --alg=ddpg     --env=Stock-v0 --network=mlp --num_timesteps=1e4 --play --train_start=20010101  --train_end=20080500 --test_start=20080501 --test_end=20080831
   python -m baselines.run --alg=ppo2     --env=Stock-v0 --network=mlp --num_timesteps=1e4 --play --train_start=20010101  --train_end=20080500 --test_start=20080501 --test_end=20080831
   python -m baselines.run --alg=trpo_mpi --env=Stock-v0 --network=mlp --num_timesteps=1e4 --play --train_start=20010101  --train_end=20080500 --test_start=20080501 --test_end=20080831

   # Down Trending Test range 9/2008 - 12/2008
   python -m baselines.run --alg=ddpg     --env=Stock-v0 --network=mlp --num_timesteps=1e4 --play --train_start=20010101  --train_end=20080500 --test_start=20080901 --test_end=20081231
   python -m baselines.run --alg=ppo2     --env=Stock-v0 --network=mlp --num_timesteps=1e4 --play --train_start=20010101  --train_end=20080500 --test_start=20080901 --test_end=20081231
   python -m baselines.run --alg=trpo_mpi --env=Stock-v0 --network=mlp --num_timesteps=1e4 --play --train_start=20010101  --train_end=20080500 --test_start=20080901 --test_end=20081231

   # Up Trending Test range 3/2009 - 6/2009
   python -m baselines.run --alg=ddpg     --env=Stock-v0 --network=mlp --num_timesteps=1e4 --play --train_start=20010101  --train_end=20080500 --test_start=20090301 --test_end=20090630
   python -m baselines.run --alg=ppo2     --env=Stock-v0 --network=mlp --num_timesteps=1e4 --play --train_start=20010101  --train_end=20080500 --test_start=20090301 --test_end=20090630
   python -m baselines.run --alg=trpo_mpi --env=Stock-v0 --network=mlp --num_timesteps=1e4 --play --train_start=20010101  --train_end=20080500 --test_start=20090301 --test_end=20090630

   ## Training range 1/2001 - 8/2018 ##
   # Wave Trending Test range 5/2019 - 8/2019
   python -m baselines.run --alg=ddpg     --env=Stock-v0 --network=mlp --num_timesteps=1e4 --play --train_start=20010101  --train_end=20180900 --test_start=20190501 --test_end=20190831
   python -m baselines.run --alg=ppo2     --env=Stock-v0 --network=mlp --num_timesteps=1e4 --play --train_start=20010101  --train_end=20180900 --test_start=20190501 --test_end=20190831
   python -m baselines.run --alg=trpo_mpi --env=Stock-v0 --network=mlp --num_timesteps=1e4 --play --train_start=20010101  --train_end=20180900 --test_start=20190501 --test_end=20190831

   # Down Trending Test range 9/2018 - 12/2018
   python -m baselines.run --alg=ddpg     --env=Stock-v0 --network=mlp --num_timesteps=1e4 --play --train_start=20010101  --train_end=20180900 --test_start=20180901 --test_end=20181231
   python -m baselines.run --alg=ppo2     --env=Stock-v0 --network=mlp --num_timesteps=1e4 --play --train_start=20010101  --train_end=20180900 --test_start=20180901 --test_end=20181231
   python -m baselines.run --alg=trpo_mpi --env=Stock-v0 --network=mlp --num_timesteps=1e4 --play --train_start=20010101  --train_end=20180900 --test_start=20180901 --test_end=20181231

   # Up Trending Test range 1/2019 - 4/2019
   python -m baselines.run --alg=ddpg     --env=Stock-v0 --network=mlp --num_timesteps=1e4 --play --train_start=20010101  --train_end=20180900 --test_start=20190101 --test_end=20190430
   python -m baselines.run --alg=ppo2     --env=Stock-v0 --network=mlp --num_timesteps=1e4 --play --train_start=20010101  --train_end=20180900 --test_start=20190101 --test_end=20190430
   python -m baselines.run --alg=trpo_mpi --env=Stock-v0 --network=mlp --num_timesteps=1e4 --play --train_start=20010101  --train_end=20180900 --test_start=20190101 --test_end=20190430
done
ls /root/cs221_project/baselines
python extract_results.py $STOCK_HOME/results
cat $STOCK_HOME/results/final_result.json
