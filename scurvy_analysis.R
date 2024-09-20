library(readr)
library(tidyverse)

scurvy <- read_csv("scurvy.csv")
summary(scurvy)

# Changing each column discrete column in scurvy to just the numerical value and removing the _'word'
scurvy$gum_rot_d6 <- gsub("_.*", "", scurvy$gum_rot_d6)
scurvy$weakness_of_the_knees_d6 <- gsub("_.*", "", scurvy$weakness_of_the_knees_d6)
scurvy$skin_sores_d6 <- gsub("_.*", "", scurvy$skin_sores_d6)

# Changing each column discrete column in scurvy as above using a loop instead of repeating it for each column name
columns_to_change <- c("lassitude_d6", "fit_for_duty_d6")
for (i in columns_to_change) { scurvy[[i]] <- gsub("_.*", "", scurvy[[i]])
}

ggplot(data = scurvy, aes(x = study_id, y = gum_rot_d6)) +
  geom_col()
# Note: that geom_bar y-axis is always count and this cannot be changed, if you want to plot two variables against eachother (not just counts against one variable) you will need to use geom_col