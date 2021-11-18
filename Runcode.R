dget(fake.dat, "fakedat.txt")
library(runjags)

sim_test <- run.jags("model.txt", data = fake.dat$jags.data, 
                     monitor = fake.dat$jags.pars, adapt = 100, n.chains = 2, sample = 200, burnin = 0, 
                     inits =  fake.dat$jags.inits, method = "parallel")

#this runs fine when line 61 is commented out. The minute it is included, the error "SimpleRange:leftoffset" appears. 

tt <- as.matrix(sim_test$mcmc)
min(tt); max(tt)
