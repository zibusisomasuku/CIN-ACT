#Load readxl
library("readxl")

#Import the Exposure.xlsx file
exposure <- read_xlsx("train/exposure.xlsx")

#Perform GLM Calcs Using Poisson
#summary(modelP <- glm(claim_freq ~ age + marital + sex + ed + daily_mileage + use + car_value + policy_length + car_age + loc , family = "poisson", data = exposure))

#Perform GLM Calcs Using Quasi-poisson, to allow for overdispersion
summary(modelQ <- glm(claim_freq ~ age + marital + sex + ed + daily_mileage + use + car_value + policy_length + car_age + loc , family = "quasipoisson", data = exposure))

#View a model based only on significant values
summary(sig.modelQ <- glm(claim_freq ~  marital + ed + daily_mileage + use + car_value + policy_length + loc , family = "quasipoisson", data = exposure))

#Plot Cook's Distance for the final model
#plot(cooks.distance(sig.modelQ))
