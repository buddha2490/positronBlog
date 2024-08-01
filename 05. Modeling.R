library(dplyr)
library(gt)

df <- readRDS(file = "data/finalData.rds") |>
  mutate(allCancer = ifelse(allCancer == "No cancer", 0, 1))


myModels <- function(dat, outcome, outcomeLab, exposure) {
  form <- glue::glue("{outcome} ~ {exposure} + age + racenew") |> formula()
  fit <- glm(form, family = "binomial", data = dat)

  out <- data.frame(Outcome = c(outcomeLab, ""),
                    Level = c("", levels(df[[exposure]])[1]),
                    Estimate = c("", "1.00"))

  OR <- fit |> coef() |> exp() |> round(2) |> format(nsmall = 2) |> data.frame()
  CI <- fit |> confint.default() |> exp()  |> data.frame()
  estimates <- data.frame(OR = OR, CI)
  colnames(estimates) <- c("OR", "LL", "UL")
  estimates <- estimates[substr(rownames(estimates),1 ,nchar(exposure)) == exposure,]
  estimates$LL <- estimates$LL |> round(2) |> format(nsmall = 2, scientific = FALSE)
  estimates$UL <- estimates$UL |> round(2) |> format(nsmall = 2, scientific = FALSE)
  estimates$Level <- sub(exposure, "", rownames(estimates))
  estimates$Estimate <-  paste0(estimates$OR, " (",
                                estimates$LL, ", ",
                                estimates$UL, ")")
  final <- bind_rows(out, estimates) |>
    select(Outcome, Level, Estimate)

  rownames(final) <- NULL

return(final)

}


allcancer <- myModels(df, "allCancer", "All Cancer Combined", "smokestatus")
breast <- myModels(df, "breast", "Breast cancer (women only)", "smokestatus")
lung <- myModels(df, "lung", "Lung cancer", "smokestatus")

rbind(allcancer, breast, lung) |>
  mutate(Outcome = tidyr::replace_na(Outcome, "")) |>
  gt() |>
  tab_header(
    title = "Association between smoking status and cancer",
    subtitle = "NHIS Data 2023") |>
  tab_footnote("Models adjust for age and race") |>
  opt_align_table_header(align = "left") |>
  opt_vertical_padding(scale = 0.5) |>
  gtsave(filename = "output/Table2.docx")


rm(df, allcancer, breast, lung)


