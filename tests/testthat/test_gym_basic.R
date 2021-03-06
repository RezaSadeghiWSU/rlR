context("gym_basic")

test_that("test Cart-Pole works for each Agent", {
  skip_on_cran()
  rlR.conf.AC()
  agent.names = c("AgentDQN", "AgentFDQN", "AgentDDQN", "AgentPG", "AgentPGBaseline", "AgentActorCritic")
  lapply(agent.names, function(agent.name) {
    conf = getDefaultConf(agent.name)
    env = makeGymEnv("CartPole-v0")
    agent = initAgent(agent.name, env, conf)
    agent$learn(2)
  })
  expect_true(TRUE)
})

test_that("test Cart-Pole and rescue works each Policy based Agent", {
  skip_on_cran()
  agent.names = c("AgentPG", "AgentPGBaseline", "AgentActorCritic")
  lapply(agent.names, function(agent.name) {
    conf = getDefaultConf(agent.name)
    conf$set(agent.flag.reset.net = TRUE)
    env = makeGymEnv("CartPole-v0")
    agent = initAgent(agent.name, env, conf)
    agent$learn(2)
  })
  expect_true(TRUE) 
})


# test_that("test Cart-Pole works for each Agent", {
#   skip_on_cran()
#   testEnv()  # test Base Environment class works
#   agent.names = c("AgentDQN", "AgentFDQN", "AgentDDQN", "AgentPG", "AgentPGBaseline", "AgentActorCritic")
#   lapply(agent.names, function(agent.name) {
#     tex = paste0(agent.name, sprintf("$test(iter = 3, sname = '%s', render = FALSE)", "CartPole-v0"))
#     perf = eval(parse(text = tex))
#   })
#   expect_true(TRUE)
# })

context("agent")
test_that("test initAgent works", {
  agent.names = c("AgentDQN", "AgentFDQN", "AgentDDQN", "AgentPG", "AgentPGBaseline", "AgentActorCritic")
  env = makeGymEnv("CartPole-v0")
  lapply(agent.names, function(name) initAgent(name, env, conf = getDefaultConf(name)))
  expect_true(TRUE)
})

context("conf")
test_that("test conf", {
  conf = RLConf$new()
  expect_class(conf, "RLConf")
  RLLog$new(conf)
})
