
table(base$rdz_yn_scr)
#Central tendency measures
#AGE
mean(base$age_pre)
sd(base$age_pre)

#EDUCATION
mean(base$education_pre)
sd(base$education_pre)

#SEX DISTRIBUTION
porcentaje_m <- (sum(base$male_pre == 0, na.rm = TRUE) / 
                   sum(!is.na(base$male_pre))) * 100
porcentaje_m

#LIVING ALONE DISTRIBUTION
porcentaje_solo <- (sum(base$living_alone_pre == 1, na.rm = TRUE) /
                      sum(!is.na(base$male_pre))) * 100
porcentaje_solo

#ETNICITY DISTRIBUTION
porcentaje_etnia <- prop.table(table(base$race_pre)) * 100 
porcentaje_etnia

#LIBRA central measures
mean(base$libra_total_score)
sd(base$libra_total_score)

#Cognition central measures
mean(base$ntb_global, na.rm=T)
sd(base$ntb_global, na.rm=T)

mean(base$ntb_memoria, na.rm=T)
sd(base$ntb_memoria, na.rm=T)

mean(base$ntb_ejecutivo, na.rm=T)
sd(base$ntb_ejecutivo, na.rm=T)

mean(base$ntb_velocidad, na.rm=T)
sd(base$ntb_velocidad, na.rm=T)

