library(ggplot2)
library(gridExtra)
A = data.frame(label = rep("A",1000),val = rbeta(1000,50,25))
B = data.frame(label = rep("B",1000),val = rbeta(1000,380,200))
A_q1 = data.frame(label = "A",quantile = quantile(A$val,0.25))
B_q1 = data.frame(label = "B",quantile = quantile(B$val,0.25))
A_m = data.frame(label = "A",mean = mean(A$val))
B_m = data.frame(label = "B",mean = mean(B$val))
comb = rbind(A,B)
comb_q1 = rbind(A_q1,B_q1)
comb_m = rbind(A_m,B_m)

ggplot(comb, aes(x=val, fill=label)) +
  geom_density(alpha = .3)

p1 = ggplot(comb, aes(x=val, fill=label)) +
  geom_density(alpha = .3) +
  geom_vline(data=comb_q1, aes(xintercept=quantile,  colour=label),
             linetype="dashed", size=1)

p2 = ggplot(comb, aes(x=val, fill=label)) +
  geom_density(alpha = .3) +
  geom_vline(data=comb_m, aes(xintercept=mean,  colour=label),
             linetype="dashed", size=1)

grid.arrange(
  p1,
  p2,
  nrow = 1,
  top = "Postrior distributions of the upvote and point estimates evaluated at 1-st quantile (left) and mean (right)"

)