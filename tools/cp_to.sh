baselines=$(python get_baselines_path.py)
echo cp /home/peter/git/stock/baselines/run.py $baselines/run.py
gym=$(python get_gym_path.py)
echo cp /home/peter/git/stock/gym/envs/__init__.py /home/peter/git/.env/lib/python3.6/site-packages/gym/envs/__init__.py
echo cp -r /home/peter/git/stock/gym/envs/stock/ /home/peter/git/.env/lib/python3.6/site-packages/gym/envs
echo $gym