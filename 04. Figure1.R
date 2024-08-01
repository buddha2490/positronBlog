library(ggplot2)
library(dplyr)
library(ggpubr)

df <- readRDS("data/finalData.rds")


one <- df |>
  filter(sex == "Male") |>
  ggplot(aes(x = allCancer, y = age)) +
  geom_boxplot(fill='#A4A4A4', color="black") +
  ggtitle("Men") +
  xlab("") +
  ylab("Age at interview") +
  theme(plot.title = element_text(hjust = 0.5))


two <- df |>
  filter(sex == "Female") |>
  ggplot(aes(x = allCancer, y = age)) +
  geom_boxplot(fill='#A4A4A4', color="black") +
  ggtitle("Women") +
  xlab("") +
  ylab(label = "Age at interview") +
  theme(plot.title = element_text(hjust = 0.5))


png(filename = "output/Figure1.png")
ggarrange(one, two, nrow = 1)
dev.off()

rm(df, one, two)


