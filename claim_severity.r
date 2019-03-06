#Load readxl
library("readxl")

#Import the claims.xlsx file
claims <- read_xlsx("train/claims.xlsx")

#Perform GLM Calcs Using Gamma Regression
summary(modelG <- glm(claim_sev ~ age + marital + sex + ed + daily_mileage + use + car_value + policy_length + car_age + loc , family = Gamma(link = "log"), data = claims))

#View a model based only on significant values
summary(sig.modelG <- glm(claim_sev ~  daily_mileage, family = Gamma(link = "log"), data = claims))

#Plot Cook's Distance for the final model
plot(cooks.distance(sig.modelG))