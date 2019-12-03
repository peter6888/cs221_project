#!/bin/bash
for (( c=1; c<=100; c++ ))
do
   echo "Run $c times"

   # https://www.statista.com/statistics/188165/annual-gdp-growth-of-the-united-states-since-1990/
   # https://tradingeconomics.com/united-states/gdp-growth
   # Train: stable GDP growth rate Test: stable gdp growth rate
   python -m baselines.run --alg=ddpg     --env=Stock-v0 --network=mlp --num_timesteps=1e4 --play --train_start=20100101  --train_end=20180000 --test_start=20180101 --test_end=20190000
   python -m baselines.run --alg=ppo2     --env=Stock-v0 --network=mlp --num_timesteps=1e4 --play --train_start=20100101  --train_end=20180000 --test_start=20180101 --test_end=20190000
   python -m baselines.run --alg=trpo_mpi --env=Stock-v0 --network=mlp --num_timesteps=1e4 --play --train_start=20100101  --train_end=20180000 --test_start=20180101 --test_end=20190000

   # Train: on upward-downward trend Test: economic crash
   python -m baselines.run --alg=ddpg     --env=Stock-v0 --network=mlp --num_timesteps=1e4 --play --train_start=20030101  --train_end=20080000 --test_start=20080101 --test_end=20100000
   python -m baselines.run --alg=ppo2     --env=Stock-v0 --network=mlp --num_timesteps=1e4 --play --train_start=20030101  --train_end=20080000 --test_start=20080101 --test_end=20100000
   python -m baselines.run --alg=trpo_mpi --env=Stock-v0 --network=mlp --num_timesteps=1e4 --play --train_start=20030101  --train_end=20080000 --test_start=20080101 --test_end=20100000

   # Train: on downward trend Test: on upward trend
   python -m baselines.run --alg=ddpg     --env=Stock-v0 --network=mlp --num_timesteps=1e4 --play --train_start=20050101  --train_end=20080000 --test_start=20130101 --test_end=20160000
   python -m baselines.run --alg=ppo2     --env=Stock-v0 --network=mlp --num_timesteps=1e4 --play --train_start=20050101  --train_end=20080000 --test_start=20130101 --test_end=20160000
   python -m baselines.run --alg=trpo_mpi --env=Stock-v0 --network=mlp --num_timesteps=1e4 --play --train_start=20050101  --train_end=20080000 --test_start=20130101 --test_end=20160000

   # Train: on upward trend Test: on downward trend
   python -m baselines.run --alg=ddpg     --env=Stock-v0 --network=mlp --num_timesteps=1e4 --play --train_start=20020101  --train_end=20050000 --test_start=20050101 --test_end=20080000
   python -m baselines.run --alg=ppo2     --env=Stock-v0 --network=mlp --num_timesteps=1e4 --play --train_start=20020101  --train_end=20050000 --test_start=20050101 --test_end=20080000
   python -m baselines.run --alg=trpo_mpi --env=Stock-v0 --network=mlp --num_timesteps=1e4 --play --train_start=20020101  --train_end=20050000 --test_start=20050101 --test_end=20080000
done
