cov_data<-read.csv("~/coso_epide.csv")
View(cov_data)

cov_data<-cov_data[,c(1,3,6)]

lm1<-lm(cov_data$new_cases_per_million~cov_data$stringency_index)

summary.lm(lm1)

plot(cov_data$new_cases_per_million, cov_data$stringency_index) +
  abline(a=16.6, b=7.816)

ggplot(cov_data, aes(x=stringency_index, y=new_cases_per_million, group=location, colour=location))+ 
  geom_smooth(method= "lm", se=FALSE,lty=5)+ 
  geom_point()+ theme(   
    panel.border = element_blank(),
    panel.grid.major = element_blank(),
    panel.grid.minor = element_blank(),
    panel.background = element_blank(),
    axis.line = element_line(colour = "black"))

