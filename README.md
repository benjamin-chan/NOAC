# Novel oral anticoagulants network meta-analysis
Benjamin Chan  
`r Sys.time()`  


This network meta-analysis is an update to
[Fu *et al*, 2014](http://www.ncbi.nlm.nih.gov/pmc/articles/PMC4244213/),
*J Cardiovasc Med (Hagerstown).* 2014 Dec; 15(12): 873-879.

# Results

## Mortality

* [Data](mtcMortalityData.csv)
* Treatment [network](mtcMortality_files/figure-html/network-1.png)
* Direct and indirect [odds ratio](mtcMortalityOddsRatios.csv) matrix
* [Full details](mtcMortality.md), including model diagnostics

## Stroke

* [Data](mtcStrokeData.csv)
* Treatment [network](mtcStroke_files/figure-html/network-1.png)
* Direct and indirect [odds ratio](mtcStrokeOddsRatios.csv) matrix
* [Full details](mtcStroke.md), including model diagnostics

## MI

* [Data](mtcMIData.csv)
* Treatment [network](mtcMI_files/figure-html/network-1.png)
* Direct and indirect [odds ratio](mtcMIOddsRatios.csv) matrix
* [Full details](mtcMI.md), including model diagnostics

## Bleeding

* [Data](mtcBleedingData.csv)
* Treatment [network](mtcBleeding_files/figure-html/network-1.png)
* Direct and indirect [odds ratio](mtcBleedingOddsRatios.csv) matrix
* [Full details](mtcBleeding.md), including model diagnostics


# Methods

Use the [`gemtc`](https://drugis.org/software/r-packages/gemtc) package.
Check the link for references.


```r
library(openxlsx)
library(data.table)
```

```
## data.table 1.9.6  For help type ?data.table or https://github.com/Rdatatable/data.table/wiki
## The fastest way to learn (by data.table authors): https://www.datacamp.com/courses/data-analysis-the-data-table-way
```

```r
library(gemtc)
```

```
## Warning: package 'gemtc' was built under R version 3.2.3
```

```
## Loading required package: coda
```

```r
library(xtable)
```



Set `effect` to be used for the `linearModel` parameter in the `mtc.model` function.


```r
effect <- "fixed"
```

Set sampler parameters.


```r
nAdapt <- 5000  # Burn-in
# nChain <- 4  # gemtc defaults to 4 MCMC chains; no need to set
nIter <- 25000
thin <- 10
message(sprintf("Each MCMC chain will have %d samples.\nInferences will be based on a total of %d samples.",
                nIter / thin,
                4 * (nIter / thin)))
```

```
## Each MCMC chain will have 2500 samples.
## Inferences will be based on a total of 10000 samples.
```

Software version information.


```r
sessionInfo()
```

```
## R version 3.2.2 (2015-08-14)
## Platform: x86_64-w64-mingw32/x64 (64-bit)
## Running under: Windows 7 x64 (build 7601) Service Pack 1
## 
## locale:
## [1] LC_COLLATE=English_United States.1252 
## [2] LC_CTYPE=English_United States.1252   
## [3] LC_MONETARY=English_United States.1252
## [4] LC_NUMERIC=C                          
## [5] LC_TIME=English_United States.1252    
## 
## attached base packages:
## [1] stats     graphics  grDevices utils     datasets  methods   base     
## 
## other attached packages:
## [1] xtable_1.7-4        gemtc_0.7-1         coda_0.17-1        
## [4] data.table_1.9.6    openxlsx_3.0.0      RevoUtilsMath_3.2.2
## 
## loaded via a namespace (and not attached):
##  [1] Rcpp_0.12.1     lattice_0.20-33 digest_0.6.8    plyr_1.8.3     
##  [5] grid_3.2.2      chron_2.3-47    meta_4.3-0      formatR_1.2    
##  [9] magrittr_1.5    evaluate_0.7.2  stringi_0.5-5   rmarkdown_0.7  
## [13] tools_3.2.2     stringr_1.0.0   igraph_1.0.1    yaml_2.1.13    
## [17] htmltools_0.2.6 knitr_1.11
```
