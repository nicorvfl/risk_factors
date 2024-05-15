#DIFFERENCES BETWEEN GROUPS
install.packages("DescTools")
library(DescTools)

#Check distribution
shapiro.test(base$libra_total_score)

#SEX
#Calculation mean differences
MeanDiffCI(base$libra_total_score[base$male_pre==1],
           base$libra_total_score[base$male_pre==0],method = "perc")

#Effect size
if(!require('rstatix')) {
  install.packages('rstatix')
  library('rstatix')
}
base %>% wilcox_effsize(libra_total_score ~ male_pre)
with(data=base,tapply(libra_total_score,male_pre,mean))

#EDUCATION
base$education <- ifelse(base$education_pre < 9,1,0)
with(data=base,tapply(libra_total_score,education,mean))
MeanDiffCI(base$libra_total_score[base$education==1],
           base$libra_total_score[base$education==0], method = "perc")
base %>% wilcox_effsize(libra_total_score ~ education)

#AGE
base$age <- ifelse(base$age_pre >70,1,0)
with(data=base,tapply(libra_total_score,age,mean))
MeanDiffCI(base$libra_total_score[base$age==1],
           base$libra_total_score[base$age==0], method = "perc")
base %>% wilcox_effsize(libra_total_score ~ age)

#LIVING ALONE
base$alone <- ifelse(base$living_alone_pre == 1, 1,0)
with(data=base,tapply(libra_total_score,alone,mean))

MeanDiffCI(base$libra_total_score[base$alone == "1"],
           base$libra_total_score[base$alone == "0"], method="perc")

base %>% wilcox_effsize(libra_total_score ~ alone)


#APOE STATUS
base$apoe <- ifelse(base$apoe4_base >0, 1, 0)
base$apoe <- as.factor(base$apoe)
#I delete NA's
base_apoe <- base[!is.na(base$apoe),]

MeanDiffCI(base_apoe$libra_total_score[base_apoe$apoe ==1],
           base_apoe$libra_total_score[base_apoe$apoe==0],method="basic")

with(data=base_apoe, tapply(libra_total_score,apoe,mean))
base_apoe %>% wilcox_effsize(libra_total_score ~ apoe)





