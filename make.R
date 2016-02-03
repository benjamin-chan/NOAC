setwd("~/GitHub repositories/NOAC")
f <- "make.log"
sink(f)
rmarkdown::render("MASTER.Rmd", output_file="index.html")
file.rename("index.md", "README.md")
file.info(c("index.html", "README.md"))
.timeStart <- Sys.time()
rmarkdown::render("mtcMortality.Rmd")
rmarkdown::render("mtcStroke.Rmd")
rmarkdown::render("mtcMI.Rmd")
rmarkdown::render("mtcBleeding.Rmd")
sink(NULL)
f <- "systemInformation.txt"
sink(f)
library(devtools)
source_gist("https://gist.github.com/benjamin-chan/80149dd4cdb16b2760ec",
            print.eval=TRUE,
            quiet=TRUE)
sink(NULL)
