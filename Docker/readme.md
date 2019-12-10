
Pull Docker Images and Run Experiments
1. Pull docker image
```
docker pull stonepeter/stock:0.4
```
2. Check docker image id
```
docker images
```
3. Launch container bash with image id
```
docker run -i -t 5fc540664523 /bin/bash
```
4. (within container) set $STOCK_HOME
```
export STOCK_HOME=/root/stock/
```
5. change to experiment dir
```
cd /root/cs221_project/baselines
```
6. try experiment
```
python -m baselines.run --alg=ddpg --env=Stock-v0 --network=mlp --num_timesteps=1e4 --play
```
7. run full experiment
```
bash ./test_100.sh
```

Create docker information
```
docker images
docker ps -a
docker run -i -t stock:0.3 /bin/bash
```
Make modifications in dockers
```
docker ps
docker tag 5fc540664523 stonepeter/stock:0.4
docker push stonepeter/stock:0.4
```

