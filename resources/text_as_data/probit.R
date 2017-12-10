##this implements code for lecture 2, particularly the probit model
##generating synthetic data 



true.beta<- c(-0.75, 1)
xs<- cbind(1, rnorm(1000))
y.star<- xs%*%true.beta
y.obs<- c()
for(z in 1:1000){
  y.obs[z]<- rbinom(1, prob = pnorm(y.star[z]), size = 1)
  
}

####writing the probit function




log.prob<- function(pars, X, Y){
  beta<- pars[1:ncol(X)]
  probs<- pnorm(X%*%beta)
  part1<- Y*log(probs)
  part2<- (1-Y)*log( 1- probs) 
  total<- sum(part1,  part2)
  return(total)
}

max.output<- optim(c(0, 0), log.prob, control = list(trace = 100, fnscale = -1 ), method = 'BFGS', hessian=T, X = xs, Y = y.obs)
par.est<- max.output$par
sqrt(diag(solve(-max.output$hessian)))

glm.output<- glm(y.obs~xs[,-1], family=binomial(link = 'probit'))
sqrt(diag(vcov(glm.output)))

##probability of observing an event, given xs = c(1, 0.5)

new.xs<- seq(-2, 2, len = 1000)
probs<- c()
for(z in 1:1000){
  probs[z]<- pnorm(c(1, new.xs[z] )%*%par.est)
}

plot(probs~new.xs, xlab = 'Ideology', ylab = 'Probability', type='l', lwd = 4)




  
  
  
  
  







