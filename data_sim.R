set.seed(123)
n<-1000

age<-runif(n,18, 75)
gender <- sample(c(0,1), size=n, replace=TRUE, prob =c(0.55, 0.45))

race <-sample(c(-2,-1 ,0, 1, 2, 3), n, replace = TRUE, prob=c(0.1,0.1 ,0.3, 0.2, 0.2, 0.1))

stress<-sample(c(0,1,4), n, replace=TRUE, prob=c(0.5, 0.3, 0.2))

eat_out<-sample(c(0, 1), n, replace = TRUE, prob=c(0.7, 0.3))
grocery_spend<-sample(c(0, 1, 2), n, replace = TRUE, prob=c(0.2, 0.5, 0.3))

wfh<-sample(c(0, 1), n, replace = TRUE, prob=c(0.3, 0.7))

gym<-sample(c(0, 1), n, replace = TRUE, prob=c(0.3, 0.7))

hh_income<-sample(1:4, n, replace = TRUE, prob=c(0.1, 0.3, 0.4, 0.2))

marriage<-sample(c(0, 1), n, replace = TRUE, prob=c(0.3, 0.7))

exercise<-sample(c(0, 1, 3), n, replace = TRUE, prob=c(0.3, 0.4, 0.3))

snacking<-sample(c(0, 1, 3), n, replace = TRUE, prob=c(0.3, 0.4, 0.3))

home_days<-sample(c(0, 1, 3), n, replace = TRUE, prob=c(0.3, 0.4, 0.3))

bmi<-2*race+1.5*stress+3*eat_out-3*grocery_spend+5*wfh-gym-hh_income-3*exercise+6*snacking+8*home_days
obese=bmi>30
sum(bmi>30)
x1<-data.frame(obese, age, gender, race, stress, eat_out, grocery_spend, wfh, gym, hh_income, marriage, exercise, snacking, home_days)

lm_fit<-lm(obese~., data=x1)
summary(lm_fit)

lm_fit<-lm(obese~.-age-gender-hh_income-marriage, data=x1)
summary(lm_fit)

x1$race[x1$race==-2]<-4
x1$race[x1$race==-1]<-5
x1$stress[x1$stress==4]<-2
x1$exercise[x1$exercise==3]<-2
x1$snacking[x1$snacking==3]<-2
x1$home_days[x1$home_days==3]<-2



library(writexl)
write_xlsx(x1, "D:\\Users\\Jack\\Desktop\\Data\\dataset.xlsx")
