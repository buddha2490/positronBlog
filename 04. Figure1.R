library(ggplot2)
library(dplyr)
library(ggpubr)

df <- readRDS("data/finalData.rds")


one <- df |>
  filter(sex == "Male") |>
  ggplot(aes(x = allCancer, y = age, fill = allCancer)) +
  geom_boxplot() +
  scale_fill_manual(values = c("#31726D", "#7EA5B0")) +
  ggtitle("Men") +
  xlab("") +
  ylab("Age at interview")  +
  theme(plot.title = element_text(hjust = 0.5),
        legend.position = "none")

one
two <- df |>
  filter(sex == "Female") |>
  ggplot(aes(x = allCancer, y = age, fill = allCancer)) +
  geom_boxplot() +
  scale_fill_manual(values = c("#31726D", "#7EA5B0")) +
  ggtitle("Men") +
  xlab("") +
  ylab("Age at interview")  +
  theme(plot.title = element_text(hjust = 0.5),
        legend.position = "none")


two

png(filename = "output/Figure1.png")
ggarrange(one, two, nrow = 1)
dev.off()

rm(df, one, two)


