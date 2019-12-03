import gym
result = gym.__file__
result = "/".join(result.split('/')[:-1])
print(result)
