# library(googlesheets)
# url <- "https://docs.google.com/spreadsheets/d/1kvJ_KiKfMzA6sUB8Lu2fNCS9ND6mb0b0tfKp1ImhtaA/edit?usp=sharing"
# gs_url(url)
# D <- gs_read(gs_url(url), ws="Mortality")

library(openxlsx)
library(data.table)
list.files(getwd())
D0 <- data.table(read.xlsx("NOAC NMA Data.xlsx",
                           sheet="Mortality",
                           # sheet="Stroke",
                           # sheet="MI",
                           # sheet="Bleeding",
                           startRow=3))
names(D0) <- c("label", "nNOAC", "yNOAC", "nWarfarin", "yWarfarin")
D <- D0[, label := gsub("  ", " ", label)]
D <- D0[, label := gsub("\\s$", "", label)]
D <- D0[, label := gsub("\\sivaroxaban", " Rivaroxaban", label)]
D <- D0[, `:=` (study = NA_character_, noac = NA_character_)]
assignStudy <- function (str) {
  D[grep(str, label), study := str]
}
assignNOAC <- function (str) {
  D[grep(str, label), noac := str]
}
D <- assignStudy("RE-LY")
D <- assignStudy("ENGAGE AF-TIMI")
D <- assignStudy("Yamashita, 2012")
D <- assignStudy("ARISTOTLE")
D <- assignStudy("ARISTOTLE-J")
D <- assignStudy("J-ROCKET")
D <- assignStudy("ROCKET-AF")
D <- assignNOAC("Dabigatran 110 mg")
D <- assignNOAC("Dabigatran 150 mg")
D <- assignNOAC("Edoxaban 30 mg")
D <- assignNOAC("Edoxaban 60 mg")
D <- assignNOAC("Apixaban 5 mg")
D <- assignNOAC("Rivaroxaban 15 mg")
D <- assignNOAC("Rivaroxaban 20 mg")
D <- D[, label := NULL]
D <- melt(D, id.vars=c("study", "noac"))
D <- rbindlist(list(merge(D[variable == "nNOAC"],
                          D[variable == "yNOAC"],
                          by=c("study", "noac")),
                    merge(D[variable == "nWarfarin"],
                          D[variable == "yWarfarin"],
                          by=c("study", "noac"))))
D <- D[grep("NOAC", variable.x), treatment := noac]
D <- D[grep("Warfarin", variable.x), treatment := "Warfarin"]
D <- D[, treatment := gsub(" ", "_", treatment)]
D <- D[, noac := NULL]
D <- D[, `:=` (variable.x = NULL, variable.y = NULL)]
setnames(D, c("value.x", "value.y"), c("sampleSize", "responders"))
setkey(D, study, treatment)
D <- unique(D)
show(D)
