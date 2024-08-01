library(dplyr)
library(haven)
library(flextable)


# read_sas does not import the formats
df <- read_sas("data/analytic.sas7bdat") |>
  mutate(agecat = factor(agecat,
                        levels = 1:7,
                        labels = c("<30", "30-30", "40-49",
                      "50-59", "60-69", "70-79", "80+"))) |>
  mutate(racenew = factor(racenew,
                          levels = c(1:5,9),
                          labels = c("White", "Black", "Asian", "AIAN", "Mixed", "Missing"))) |>
  mutate(educ = factor(educ,
                       levels = c(1:5, 9),
                       labels = c("<HS", "HS Grad", "Some College",
                                  "College Graduate", "Graduate/Professional degree",
                                "Missing"))) |>
  mutate(smokestatus = factor(smokestatus,
                      levels = c(1:4,9),
                      labels = c("Never smoker", "Former smoker", "Current smoker",
                                 "Ever smoker", "Missing"))) |>
  mutate(bmicat = factor(bmicat,
                      levels = c(1:4,9),
                      labels = c("Underweight", "Normal weight",
                                 "Overweight", "Obese", "Missing"))) |>
  rowwise() |>
  mutate(allCancer = sum(bladder, blood, bone, brain, breast, cervix, esoph,
                         gallbladder, larynx, leukemia, liver, lung, lymphoma,
                         melanoma, oral, ovary, pancreas, prostate,
                         stomach, throat, thyroid, uterine, hodgkins, crc, other, na.rm = TRUE)) |>
  ungroup() |>
  mutate(allCancer = factor(ifelse(allCancer > 0, 1, 0),
                            levels = 0:1,
                            labels = c("No cancer", "Prevalent Cancer")))

# Relabel all the new factor variables
attr(df$agecat, "label") <- "Age categories"
attr(df$racenew, "label") <- "Self-identified race";
attr(df$educ, "label") <- "Education"
attr(df$smokestatus, "label") <- "Smoking status"
attr(df$bmicat, "label") <- "WHO BMI Categories"
attr(df$bladder, "label") <- "Bladder cancer"
attr(df$blood , "label") <- "Heme cancer"
attr(df$bone, "label") <- "Bone cancer"
attr(df$brain, "label") <- "Brian cancer"
attr(df$breast, "label") <- "Breast cancer"
attr(df$cervix, "label") <- "Cervical cancer"
attr(df$esoph , "label") <- "Esophageal cancer"
attr(df$gallbladder , "label") <- "Gallbladder cnacer"
attr(df$larynx , "label") <- "Laryngeal cancer"
attr(df$leukemia, "label") <- "Leukemia"
attr(df$liver, "label") <- "Liver cancer"
attr(df$lung, "label") <- "Lung cancer"
attr(df$lymphoma, "label") <- "Lymphoma"
attr(df$melanoma, "label") <- "Melanoma"
attr(df$oral, "label") <- "Oral cancer"
attr(df$ovary, "label") <- "Ovarian cancer"
attr(df$pancreas, "label") <- "Pancreatic cancer"
attr(df$prostate, "label") <- "Prostate cancer"
attr(df$stomach , "label") <- "Stomach cancer"
attr(df$throat, "label") <- "Throat cancer"
attr(df$thyroid, "label") <- "Thyroid cancer"
attr(df$uterine , "label") <- "Uterine cancer"
attr(df$hodgkins, "label") <- "Hodgins lymphoma"
attr(df$crc, "label") <- "Colorectal cancer"
attr(df$other, "label") <- "All other cancers"
attr(df$allCancer, "label") <- "All cancers combined"

saveRDS(df, file = "data/finalData.rds")


subset <- df |>
  select(age, bmi, heightcm, weightkg, racenew, educ, smokestatus, allCancer)

labels <- sapply(names(subset), function(x)  attr(subset[[x]], "label"))

subset |>
  summarizor(by = "allCancer") |>
  as_flextable(spread_first_col = TRUE, separate_with = "variable") |>
  bold(i = ~!is.na(variable), j = 1, bold = TRUE) |>
  set_caption("Table 1: Descriptive statistics of the NHIS 2023 data") |>
  labelizor(j = "stat", labels = labels) |>
  save_as_docx(path = "output/Table1.docx")

rm(df, subset, labels)




