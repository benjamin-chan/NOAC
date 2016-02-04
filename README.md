# Novel oral anticoagulants network meta-analysis
Benjamin Chan  
`r Sys.time()`  


This network meta-analysis is an update to
[Fu *et al*, 2014](http://www.ncbi.nlm.nih.gov/pmc/articles/PMC4244213/),
*J Cardiovasc Med (Hagerstown).* 2014 Dec; 15(12): 873-879.

Use the [`gemtc`](https://drugis.org/software/r-packages/gemtc) package.
Check the link for references.


```r
library(openxlsx)
library(data.table)
library(gemtc)
```



Set `linearModel`.


```r
effect <- "fixed"
```

Set sampler parameters.


```r
nAdapt <- 5000  # Burn-in
# nChain <- 4  # gemtc defaults to 4 MCMC chains; no need to set
nIter <- 2000
thin <- 10
```

Links to outcomes.

* [Mortality](mtcMortality.md)
* [Stroke](mtcStroke.md)
* [MI](mtcMI.md)
* [Bleeding](mtcBleeding.md)

Software information is in [`software.log`](software.log) file.
