Tools for build Docker image, it will do the following three copies
```
cp /home/peter/git/stock/baselines/run.py /home/peter/git/baselines/baselines/run.py
cp /home/peter/git/stock/gym/envs/__init__.py /home/peter/git/.env/lib/python3.6/site-packages/gym/envs/__init__.py
cp -r /home/peter/git/stock/gym/envs/stock/ /home/peter/git/.env/lib/python3.6/site-packages/gym/envs
vi ~/git/.env/bin/activate
```
```
bash cp_to.sh
```
Result
```
/Users/pe.li/.local/lib/python3.7/site-packages/gym/__init__.py
/Users/pe.li/git/rl_project/src/baselines/baselines/__init__.py
```
