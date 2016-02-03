# Novel oral anticoagulants network meta-analysis
Benjamin Chan  
`r Sys.time()`  


This network meta-analysis is an update to
[Fu *et al*, 2014](http://www.ncbi.nlm.nih.gov/pmc/articles/PMC4244213/),
*J Cardiovasc Med (Hagerstown).* 2014 Dec; 15(12): 873-879.

> From: Marian McDonagh  
> Sent: Friday, January 29, 2016 4:19 PM  
> To: Benjamin Chan  
> Subject: Re: Network Meta-analysis  
> 
> OK, last email for today!
> I put it all into an excel spreadsheet --- all the outcomes.
> Looks like it might not add up to much since several outcome cells are 0's.
> Let me know what you think.

Use the [`gemtc`](https://drugis.org/software/r-packages/gemtc) package.
Check the link for references.


```r
library(openxlsx)
library(data.table)
library(gemtc)
```


```
##                                  mtime  size
## NOAC NMA Data.xlsx 2016-01-30 06:00:03 48838
```

Set `linearModel`.


```r
effect <- "fixed"
```

Set sampler parameters.


```r
nAdapt <- 5000  # Burn-in
# nChain <- 4  # gemtc defaults to 4 MCMC chains; no need to set
nIter <- 20000
thin <- 10
```

Links to outcomes.

* [Mortality](mtcMortality.md)
* [Stroke](mtcStroke.md)
* [MI](mtcMI.md)
* [Bleeding](mtcBleeding.md)
