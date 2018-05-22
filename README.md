[![Build Status](https://travis-ci.com/compstat-lmu/rlR.svg?branch=master)](https://travis-ci.com/compstat-lmu/rlR)
# rlR: Reinforcement learning in R

## Installation
```{r}
devtools::install_github("compstat-lmu/rlR", dependencies = TRUE)
```
## Usage

```r
library(rlR)
env = makeGymEnv("CartPole-v0")
listAvailAgent()
```

```
## [1] "AgentDQN:deep q learning"                      
## [2] "AgentFDQN:frozen target deep q learning"       
## [3] "AgentDDQN: double deep q learning"             
## [4] "AgentPG: policy gradient basic"                
## [5] "AgentPGBaseline: policy gradient with baseline"
## [6] "AgentActorCritic: actor critic method"
```



```r
agent = makeAgent("AgentDQN", env)
```

```
## parameters: 
## -render: - TRUE-
## -agent.gamma: - 0.99-
## -policy.maxEpsilon: - 1-
## -policy.minEpsilon: - 0.001-
## -policy.decay: - 0.999000499833375-
## -replay.memname: - Uniform-
## -replay.epochs: - 1-
## -interact.maxiter: - 500-
## -console: - FALSE-
## -log: - FALSE-
## -policy.name: - EpsilonGreedy-
## -replay.batchsize: - 64-
## -agent.nn.arch: nhidden- 64-
##  -agent.nn.arch: act1- relu-
##  -agent.nn.arch: act2- linear-
##  -agent.nn.arch: loss- mse-
##  -agent.nn.arch: lr- 0.00025-
##  -agent.nn.arch: kernel_regularizer- regularizer_l2(l=0.0)-
##  -agent.nn.arch: bias_regularizer- regularizer_l2(l=0.0)-
```

```r
system.time({
perf = agent$learn(1000)
})
```

```
##     user   system  elapsed 
## 5592.336   73.720 5595.750
```

```r
perf$plot()
```

```
## `geom_smooth()` using method = 'gam'
```

![plot of chunk unnamed-chunk-2](inst/figure/dqn.png)


