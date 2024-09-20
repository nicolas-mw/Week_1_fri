library(readr)
scurvy <- read_csv("scurvy.csv")
install.packages("tidyverse")
library(tidyverse)
summary(scurvy)

scurvy$gum_rot_d6 <- gsub("_.*", "", scurvy$gum_rot_d6)
scurvy$weakness_of_the_knees_d6 <- gsub("_.*", "", scurvy$weakness_of_the_knees_d6)
scurvy$skin_sores_d6 <- gsub("_.*", "", scurvy$skin_sores_d6)

columns_to_change <- c("lassitude_d6", "fit_for_duty_d6")
for (i in columns_to_change) { scurvy[[i]] <- gsub("_.*", "", scurvy[[i]])
}

#the below is wrong
count <- table(scurvy$gum_rot_d6, scurvy$treatment)
barplot(count)

scurvy2 <- read_csv("scurvy.csv")
ggplot(data = scurvy2, aes(x = gum_rot_d6)) +
  geom_bar()
