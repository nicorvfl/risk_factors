#MIND Score

base$mind_oil <- ifelse(base$pointerfood1_base == 1, 0,1) 
base$mind_fritura <- ifelse(base$pointerfood2_base > 4,0,
                            ifelse(base$pointerfood2_base > 2,0.5,1)) 
base$mind_green <- ifelse(base$pointerfood3_base == 6, 1,
                          ifelse(base$pointerfood3_base >3, 0.5,0)) 
base$mind_sweet <- ifelse(base$pointerfood4_base == 6, 0,
                          ifelse(base$pointerfood4_base == 5,0.5,1)) 
base$mind_vegetales <- ifelse(base$pointerfood5_base == 6,1,
                              ifelse(base$pointerfood5_base == 5, 0.5,0)) 
base$mind_frutos <- ifelse(base$pointerfood6_base < 3,0,
                           ifelse(base$pointerfood6_base == 3, 0.5,1)) 
base$mind_fish <- ifelse(base$pointerfood7_base == 1, 0,
                         ifelse(base$pointerfood7_base == 2, 0.5,1)) 
base$mind_bird <- ifelse(base$pointerfood8_base < 3, 0,
                         ifelse(base$pointerfood8_base == 3, 0.5,1)) 
base$mind_cheese <- ifelse(base$pointerfood9_base == 6, 0,
                           ifelse(base$pointerfood9_base > 2, 0.5,1)) 
base$mind_frijol <- ifelse(base$pointerfood10_base < 3,0,
                           ifelse(base$pointerfood10_base < 5, 0.5,1)) 
base$mind_wine <- ifelse(base$ifa19_base == 1 | base$ifa19_base > 6, 0,
                         ifelse(base$ifa19_base > 1, 0.5, 1)) 
base$mind_nuts <- ifelse(base$pointerfood11_base >4, 1, 
                         ifelse(base$pointerfood11_base >2, 0.5,0)) 
base$mind_meat <- ifelse(base$pointerfood12_base == 6, 0,
                         ifelse(base$pointerfood12_base == 5, 0.5,1)) 
base$whole <- ifelse(base$pointerfood13_base == 6, 1,0) 
base$mind_margarine <- ifelse(base$pointerfood14_base > 4, 0,
                              ifelse(base$pointerfood14_base > 2, 0.5,1)) 
base$mind_score <- base$mind_oil+base$mind_fritura+base$mind_green+base$mind_sweet+base$mind_vegetales+
  base$mind_frutos+base$mind_fish+base$mind_bird+base$mind_cheese+base$mind_frijol+
  base$mind_wine+base$mind_nuts+base$mind_meat+base$whole+base$mind_margarine

#CUTOFF
base$mediana_mind_score <- median(base$mind_score, na.rm = TRUE)
mediana_mind_score
base <- base %>%
  mutate(mind_score_class = ifelse(mind_score <= mediana_mind_score, "unhealthy", "healthy"))

length(base$mediana_mind_score)

