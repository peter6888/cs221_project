## Introduction

Stock trading plays a crucial role in the growth of industry, commerce and the overall economy. However, it is extremely challenging to obtain optimal strategy in such a dynamic market and it is often considered a high-risk investment financial activity. Reinforcement Learning  provides mechanisms to navigate this large and complex space. In this project, we measure the asset-management performance of various deep reinforcement learning algorithms in different market trends.

## Bandwagon vs Risk-Averse Baselines

[dataset data]{0x0fcf13538cda45f5a89d264157e53d22}
[dataset code]{0x9d7e57e6e9fb4b0f879bda3ebe20cba4}

__Bandwagon Result__
[run run-python -- :data,:code : python code/baseline.py data/1_1_to_10_18_2019.csv -d=15 -g]{0x0cb30b3caddb43638a71d889eb381d36}
[run run-python -- :data,:code : python code/baseline.py data/1_1_to_10_18_2019.csv -d=25 -g]{0x45e5564b655e46aa94906d024ca786d4}
[run run-python -- :data,:code : python code/baseline.py data/1_1_to_10_18_2019.csv -d=35 -g]{0xfab14cbc36e14d6481f18403f15c2551}
[run run-python -- :data,:code : python code/baseline.py data/1_1_to_10_18_2019.csv -d=45 -g]{0x3186ad79dc9846ffb5fb71c19219fa40}
[run run-python -- :data,:code : python code/baseline.py data/1_1_to_10_18_2019.csv -d=55 -g]{0x0a959eb4b8f745b2a7cca091d74c8ec9}

__Risk-averse Result__
[run run-python -- :data,:code : python code/baseline.py data/1_1_to_10_18_2019.csv -d=15]{0x6bb88acdf1ac434885c0af0713e046f4}
[run run-python -- :data,:code : python code/baseline.py data/1_1_to_10_18_2019.csv -d=25]{0x732112fe291c481cbc60739d2618aa75}
[run run-python -- :data,:code : python code/baseline.py data/1_1_to_10_18_2019.csv -d=35]{0xa8d29be09a99490b80b1a8092b3d7f85}
[run run-python -- :data,:code : python code/baseline.py data/1_1_to_10_18_2019.csv -d=45]{0xbcc1ae76547547afa6bf88eddfbc4d18}
[run run-python -- :data,:code : python code/baseline.py data/1_1_to_10_18_2019.csv -d=55]{0x60a200e68130487d82b0604fe504de70}

## A Lucrative Oracle

The oracle for our project has complete knowledge of the future prices of the Dow index, but with the following two limitations:

* The oracle can trade once per day and can only sell after purchasing stocks.
* The oracle can purchase stocks based on the Dow average alone (i.e. cannot make granular purchases on individual stocks).

We implemented an iterative solution where the oracle keeps the stocks if the Dow Index increases the following day and shorts if the price falls the next day.

### Oracle Results

% display image / width=500 height=300
[dataset oracle_baseline_comparison.png]{0xe6ffc4883ab046cb8ebcb525a185d999}

## Reinforcement Learning for Stock Trading

We modeled the stock trading process as a Markov decision process (MDP), considering the stochastic and interactive nature of the trading market:

* State $s = [p, h, b]$: A set that includes the information of the prices of stocks $p \in R^D_*$ , the amount of holdings of stocks $h \in Z^D_*$, and the remaining balance $b \in R_*$, where $D$ is the number of stocks that we consider in the market and $Z_*$ denotes non-negative integer numbers, and $R_*$ denotes non-negative real numbers.
* Action \textit{a}: A set of actions on all $D$ stocks. The available actions of each stock include selling, buying, and holding, which result in decreasing, increasing and no change of the holdings $h$, respectively.
* Reward $r(s, a, s')$: The change of the portfolio value when action $a$ is taken at state s and arriving at the new state $s′$. The portfolio value is the sum of the equities in all held stocks $p^T h$ and balance $b$.
* Policy $\pi(s)$: The trading strategy of stocks at state \textit{s}. It is essentially the probability distribution of \textit{a} at state \textit{s}.
* Action-value function $Q_{\pi} (s, a)$: The expected reward achieved by action $a$ at state $s$ following policy $\pi$.

### Some State-of-the-Art, Model Free Algorithms

#### Deep Deterministic Policy Gradient (DDPG):
* Off-policy algorithm that learns Q-function and policy
* Allows agent to perform actions in continuous space with good performance
* Same problem as gradient descent – Need to find a good step size!

#### Trust Region Policy Optimization (TRPO)
* On-policy algorithm that trains a stochastic policy with KL-Divergence based constraint
* Samples action from the current policy with some randomness
* High-performant algorithm but can get stuck in local optima

#### Proximal Policy Optimization (PPO)
* On-policy algorithm that takes largest possible steps without overstepping
* Similar to TRPO, but uses only first-order optimization for easier implementation


### Experiments and Results

#### Training + Validation

The following is an enumeration of what how what experiments we ran over multiple epochs.

**With Training Range = 1/2001 - 4/2008**

*Wave Trending Validation Range = 5/2008 - 8/2008*

python -m baselines.run --alg=ddpg     --env=Stock-v0 --network=mlp --num_timesteps=1e4 --play --train_start=20010101  --train_end=20080500 --test_start=20080501 --test_end=20080831

python -m baselines.run --alg=ppo2     --env=Stock-v0 --network=mlp --num_timesteps=1e4 --play --train_start=20010101  --train_end=20080500 --test_start=20080501 --test_end=20080831

python -m baselines.run --alg=trpo_mpi --env=Stock-v0 --network=mlp --num_timesteps=1e4 --play --train_start=20010101  --train_end=20080500 --test_start=20080501 --test_end=20080831


*Down Trending Validation Range = 9/2008 - 12/2008*

python -m baselines.run --alg=ddpg     --env=Stock-v0 --network=mlp --num_timesteps=1e4 --play --train_start=20010101  --train_end=20080500 --test_start=20080901 --test_end=20081231

python -m baselines.run --alg=ppo2     --env=Stock-v0 --network=mlp --num_timesteps=1e4 --play --train_start=20010101  --train_end=20080500 --test_start=20080901 --test_end=20081231

python -m baselines.run --alg=trpo_mpi --env=Stock-v0 --network=mlp --num_timesteps=1e4 --play --train_start=20010101  --train_end=20080500 --test_start=20080901 --test_end=20081231


*Up Trending Validation Range = 3/2009 - 6/2009*

python -m baselines.run --alg=ddpg     --env=Stock-v0 --network=mlp --num_timesteps=1e4 --play --train_start=20010101  --train_end=20080500 --test_start=20090301 --test_end=20090630

python -m baselines.run --alg=ppo2     --env=Stock-v0 --network=mlp --num_timesteps=1e4 --play --train_start=20010101  --train_end=20080500 --test_start=20090301 --test_end=20090630

python -m baselines.run --alg=trpo_mpi --env=Stock-v0 --network=mlp --num_timesteps=1e4 --play --train_start=20010101  --train_end=20080500 --test_start=20090301 --test_end=20090630


**With Training range = 1/2001 - 8/2018**

*Wave Trending Validation range = 5/2019 - 8/2019*

python -m baselines.run --alg=ddpg     --env=Stock-v0 --network=mlp --num_timesteps=1e4 --play --train_start=20010101  --train_end=20180900 --test_start=20190501 --test_end=20190831

python -m baselines.run --alg=ppo2     --env=Stock-v0 --network=mlp --num_timesteps=1e4 --play --train_start=20010101  --train_end=20180900 --test_start=20190501 --test_end=20190831

python -m baselines.run --alg=trpo_mpi --env=Stock-v0 --network=mlp --num_timesteps=1e4 --play --train_start=20010101  --train_end=20180900 --test_start=20190501 --test_end=20190831


*Down Trending Validation range = 9/2018 - 12/2018*

python -m baselines.run --alg=ddpg     --env=Stock-v0 --network=mlp --num_timesteps=1e4 --play --train_start=20010101  --train_end=20180900 --test_start=20180901 --test_end=20181231

python -m baselines.run --alg=ppo2     --env=Stock-v0 --network=mlp --num_timesteps=1e4 --play --train_start=20010101  --train_end=20180900 --test_start=20180901 --test_end=20181231

python -m baselines.run --alg=trpo_mpi --env=Stock-v0 --network=mlp --num_timesteps=1e4 --play --train_start=20010101  --train_end=20180900 --test_start=20180901 --test_end=20181231


*Up Trending Validation range = 1/2019 - 4/2019*

python -m baselines.run --alg=ddpg     --env=Stock-v0 --network=mlp --num_timesteps=1e4 --play --train_start=20010101  --train_end=20180900 --test_start=20190101 --test_end=20190430

python -m baselines.run --alg=ppo2     --env=Stock-v0 --network=mlp --num_timesteps=1e4 --play --train_start=20010101  --train_end=20180900 --test_start=20190101 --test_end=20190430

python -m baselines.run --alg=trpo_mpi --env=Stock-v0 --network=mlp --num_timesteps=1e4 --play --train_start=20010101  --train_end=20180900 --test_start=20190101 --test_end=20190430


[dataset codalab_sh]{0x573093fb0b0545b38b016e841e23913f}
[run economic_validation_50 -- :codalab_sh : codalab_sh/run_full_in_container.sh]{0x0d60e4d516d549818902eb4af9ade1ca}
[dataset codalab_sh]{0x5efe6cf6a67c45f28b641d22a7a7f8b4}
[run economic_validation_20 -- :codalab_sh : codalab_sh/run_full_in_container.sh]{0x49e94ca650424ef18cd681ebb7ddf579}


#### Test



#### Additional Experiments

**Train: stable GDP growth rate & Validate: stable gdp growth rate**

python -m baselines.run --alg=ddpg     --env=Stock-v0 --network=mlp --num_timesteps=1e4 --play --train_start=20100101  --train_end=20180000 --test_start=20180101 --test_end=20190000

python -m baselines.run --alg=ppo2     --env=Stock-v0 --network=mlp --num_timesteps=1e4 --play --train_start=20100101  --train_end=20180000 --test_start=20180101 --test_end=20190000

python -m baselines.run --alg=trpo_mpi --env=Stock-v0 --network=mlp --num_timesteps=1e4 --play --train_start=20100101  --train_end=20180000 --test_start=20180101 --test_end=20190000

**Train: on upward-downward trend & Validate: economic crash**

python -m baselines.run --alg=ddpg     --env=Stock-v0 --network=mlp --num_timesteps=1e4 --play --train_start=20030101  --train_end=20080000 --test_start=20080101 --test_end=20100000

python -m baselines.run --alg=ppo2     --env=Stock-v0 --network=mlp --num_timesteps=1e4 --play --train_start=20030101  --train_end=20080000 --test_start=20080101 --test_end=20100000

python -m baselines.run --alg=trpo_mpi --env=Stock-v0 --network=mlp --num_timesteps=1e4 --play --train_start=20030101  --train_end=20080000 --test_start=20080101 --test_end=20100000

**Train: on downward trend & Validate: on upward trend**

python -m baselines.run --alg=ddpg     --env=Stock-v0 --network=mlp --num_timesteps=1e4 --play --train_start=20050101  --train_end=20080000 --test_start=20130101 --test_end=20160000

python -m baselines.run --alg=ppo2     --env=Stock-v0 --network=mlp --num_timesteps=1e4 --play --train_start=20050101  --train_end=20080000 --test_start=20130101 --test_end=20160000

python -m baselines.run --alg=trpo_mpi --env=Stock-v0 --network=mlp --num_timesteps=1e4 --play --train_start=20050101  --train_end=20080000 --test_start=20130101 --test_end=20160000

**Train: on upward trend & Validate: on downward trend**

python -m baselines.run --alg=ddpg     --env=Stock-v0 --network=mlp --num_timesteps=1e4 --play --train_start=20020101  --train_end=20050000 --test_start=20050101 --test_end=20080000

python -m baselines.run --alg=ppo2     --env=Stock-v0 --network=mlp --num_timesteps=1e4 --play --train_start=20020101  --train_end=20050000 --test_start=20050101 --test_end=20080000

python -m baselines.run --alg=trpo_mpi --env=Stock-v0 --network=mlp --num_timesteps=1e4 --play --train_start=20020101  --train_end=20050000 --test_start=20050101 --test_end=20080000

[dataset codalab_sh]{0xf1cd716c22e2494aa051ca4e62e74f8d}
[run economic_trends_100 -- :codalab_sh : codalab_sh/run_full_in_container.sh]{0x327169c14a1b4ff48b797d2d8c617a83}
