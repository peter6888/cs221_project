cp __init__.py %env%/lib/python3.6/site-packages/gym/__init__.py
cp -r stock_env %env%/lib/python3.6/site-packages/gym/envs/zxstock
```update gym enviornment
~/git/.env/lib/python3.6/site-packages/gym/envs$ cp /home/peter/git/rl_project/gym/envs/__init__.py .
~/git/.env/lib/python3.6/site-packages/gym/envs$ cp -r /home/peter/git/rl_project/gym/envs/stock .
```
```
/Users/pe.li/.local/lib/python3.7/site-packages/gym/envs/stock/
```
```update baselines run.py
~/git/baselines/baselines$ cp /home/peter/git/rl_project/baselines/run.py .
```

==within Docker container======
Found out library installed location
```
root@d5039be03953:~/cs221_project/baselines# python
Python 3.7.5 (default, Nov 23 2019, 05:59:34) 
[GCC 8.3.0] on linux
Type "help", "copyright", "credits" or "license" for more information.
>>> import baselines
>>> print(baselines.__file__)
/root/cs221_project/src/baselines/baselines/__init__.py
>>> import gym
>>> print(gym.__file__)
/usr/local/lib/python3.7/site-packages/gym/__init__.py
```
copy run.py
```
root@d5039be03953:~/cs221_project/src/baselines/baselines# cp ~/cs221_project/baselines/run.py .
```
update gym
```
root@d5039be03953:~/cs221_project/src/baselines/baselines# cd /usr/local/lib/python3.7/site-packages/gym/envs
root@d5039be03953:/usr/local/lib/python3.7/site-packages/gym/envs# cp ~/cs221_project/gym/envs/__init__.py .
root@d5039be03953:/usr/local/lib/python3.7/site-packages/gym/envs# cp -r ~/cs221_project/gym/envs/stock .
root@d5039be03953:/usr/local/lib/python3.7/site-packages/gym/envs# 
```

