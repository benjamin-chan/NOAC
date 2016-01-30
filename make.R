setwd("~/GitHub repositories/NOAC")
f <- "make.log"
sink(f)
rmarkdown::render("MASTER.Rmd", output_file="index.html")
file.rename("index.md", "README.md")
file.info(c("index.html", "README.md"))
sink(NULL)