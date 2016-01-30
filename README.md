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


```
##                                  mtime  size
## NOAC NMA Data.xlsx 2016-01-30 06:00:03 48838
```


# Mortality

Clean up the data (do not show the code).


```
## Warning in `[.data.table`(D, , `:=`(study = NA_character_, noac =
## NA_character_)): Invalid .internal.selfref detected and fixed by taking
## a (shallow) copy of the data.table so that := can add this new column by
## reference. At an earlier point, this data.table has been copied by R (or
## been created manually using structure() or similar). Avoid key<-, names<-
## and attr<- which in R currently (and oddly) may copy the whole data.table.
## Use set* syntax instead to avoid copying: ?set, ?setnames and ?setattr.
## Also, in R<=v3.0.2, list(DT1,DT2) copied the entire DT1 and DT2 (R's list()
## used to copy named objects); please upgrade to R>v3.0.2 if that is biting.
## If this message doesn't help, please report to datatable-help so the root
## cause can be fixed.
```

```
##              study         treatment responders sampleSize
##  1:          RE-LY Dabigatran_110_mg        446       6015
##  2:          RE-LY Dabigatran_150_mg        438       6076
##  3:          RE-LY          Warfarin        487       6022
##  4:      ARISTOTLE     Apixaban_5_mg        603       9120
##  5:      ARISTOTLE          Warfarin        669       9081
##  6:      ROCKET-AF Rivaroxaban_20_mg        208       7131
##  7:      ROCKET-AF          Warfarin        250       7133
##  8: ENGAGE AF-TIMI    Edoxaban_30_mg        737       7034
##  9: ENGAGE AF-TIMI    Edoxaban_60_mg        773       7035
## 10: ENGAGE AF-TIMI          Warfarin        839       7036
```

Plot the network.


```r
network <- mtc.network(D1)
plot(network)
```

![](index_files/figure-html/mortalityNetwork-1.png) 

Run the model.


```r
M <- mtc.model(network, type="consistency", linearModel="fixed")
system.time(results <- mtc.run(M, n.adapt=20000, n.iter=20000, thin=20))
```

Sampler diagnostics.


```r
gelman.plot(results)
```

![](index_files/figure-html/mortalityGelman-1.png) 


```r
plot(results)
```

![](index_files/figure-html/mortalityTrace-1.png) ![](index_files/figure-html/mortalityTrace-2.png) 

Summary.


```r
summary(results)
```

```
## $measure
## [1] "Log Odds Ratio"
## 
## $summaries
## 
## Iterations = 20020:40000
## Thinning interval = 20 
## Number of chains = 4 
## Sample size per chain = 1000 
## 
## 1. Empirical mean and standard deviation for each variable,
##    plus standard error of the mean:
## 
##                                  Mean      SD  Naive SE Time-series SE
## d.Warfarin.Apixaban_5_mg     -0.11383 0.05920 0.0009360      0.0009362
## d.Warfarin.Dabigatran_110_mg -0.09460 0.06893 0.0010899      0.0011085
## d.Warfarin.Dabigatran_150_mg -0.12609 0.06999 0.0011066      0.0011058
## d.Warfarin.Edoxaban_30_mg    -0.14491 0.05334 0.0008433      0.0008658
## d.Warfarin.Edoxaban_60_mg    -0.09258 0.05322 0.0008414      0.0008310
## d.Warfarin.Rivaroxaban_20_mg -0.18904 0.09493 0.0015009      0.0014617
## 
## 2. Quantiles for each variable:
## 
##                                 2.5%     25%      50%      75%     97.5%
## d.Warfarin.Apixaban_5_mg     -0.2312 -0.1530 -0.11554 -0.07485  0.003488
## d.Warfarin.Dabigatran_110_mg -0.2308 -0.1410 -0.09385 -0.04754  0.037048
## d.Warfarin.Dabigatran_150_mg -0.2641 -0.1736 -0.12648 -0.07891  0.010357
## d.Warfarin.Edoxaban_30_mg    -0.2486 -0.1814 -0.14474 -0.10854 -0.043614
## d.Warfarin.Edoxaban_60_mg    -0.1992 -0.1275 -0.09199 -0.05706  0.011839
## d.Warfarin.Rivaroxaban_20_mg -0.3798 -0.2515 -0.18865 -0.12717 -0.002554
## 
## 
## $DIC
##     Dbar       pD      DIC 
## 10.05869 10.05448 20.11317 
## 
## attr(,"class")
## [1] "summary.mtc.result"
```

```r
forest(results)
```

![](index_files/figure-html/mortalityForest-1.png) 


# Stroke

Clean up the data (do not show the code).


```
## Warning in `[.data.table`(D, , `:=`(study = NA_character_, noac =
## NA_character_)): Invalid .internal.selfref detected and fixed by taking
## a (shallow) copy of the data.table so that := can add this new column by
## reference. At an earlier point, this data.table has been copied by R (or
## been created manually using structure() or similar). Avoid key<-, names<-
## and attr<- which in R currently (and oddly) may copy the whole data.table.
## Use set* syntax instead to avoid copying: ?set, ?setnames and ?setattr.
## Also, in R<=v3.0.2, list(DT1,DT2) copied the entire DT1 and DT2 (R's list()
## used to copy named objects); please upgrade to R>v3.0.2 if that is biting.
## If this message doesn't help, please report to datatable-help so the root
## cause can be fixed.
```

```
##              study         treatment responders sampleSize
##  1:          RE-LY Dabigatran_110_mg        182       6015
##  2:          RE-LY Dabigatran_150_mg        134       6076
##  3:          RE-LY          Warfarin        199       6022
##  4:      ARISTOTLE     Apixaban_5_mg        212       9120
##  5:      ARISTOTLE          Warfarin        265       9081
##  6:      ROCKET-AF Rivaroxaban_20_mg        188       7131
##  7:      ROCKET-AF          Warfarin        241       7133
##  8: ENGAGE AF-TIMI    Edoxaban_30_mg        182       7034
##  9: ENGAGE AF-TIMI    Edoxaban_60_mg        253       7035
## 10: ENGAGE AF-TIMI          Warfarin        232       7036
```


Plot the network.


```r
network <- mtc.network(D2)
plot(network)
```

![](index_files/figure-html/strokeNetwork-1.png) 

Run the model.


```r
M <- mtc.model(network, type="consistency", linearModel="fixed")
system.time(results <- mtc.run(M, n.adapt=20000, n.iter=20000, thin=20))
```

Sampler diagnostics.


```r
gelman.plot(results)
```

![](index_files/figure-html/strokeGelman-1.png) 


```r
plot(results)
```

![](index_files/figure-html/strokeTrace-1.png) ![](index_files/figure-html/strokeTrace-2.png) 

Summary.


```r
summary(results)
```

```
## $measure
## [1] "Log Odds Ratio"
## 
## $summaries
## 
## Iterations = 20020:40000
## Thinning interval = 20 
## Number of chains = 4 
## Sample size per chain = 1000 
## 
## 1. Empirical mean and standard deviation for each variable,
##    plus standard error of the mean:
## 
##                                  Mean      SD Naive SE Time-series SE
## d.Warfarin.Apixaban_5_mg     -0.23312 0.09446 0.001493       0.001494
## d.Warfarin.Dabigatran_110_mg -0.09258 0.10349 0.001636       0.001664
## d.Warfarin.Dabigatran_150_mg -0.41690 0.11584 0.001832       0.001800
## d.Warfarin.Edoxaban_30_mg    -0.24768 0.10112 0.001599       0.001643
## d.Warfarin.Edoxaban_60_mg     0.09126 0.09190 0.001453       0.001453
## d.Warfarin.Rivaroxaban_20_mg -0.25604 0.09782 0.001547       0.001494
## 
## 2. Quantiles for each variable:
## 
##                                  2.5%      25%      50%      75%    97.5%
## d.Warfarin.Apixaban_5_mg     -0.42697 -0.29546 -0.23272 -0.16896 -0.05083
## d.Warfarin.Dabigatran_110_mg -0.29208 -0.16146 -0.09181 -0.02153  0.11034
## d.Warfarin.Dabigatran_150_mg -0.64192 -0.49574 -0.41570 -0.33888 -0.18455
## d.Warfarin.Edoxaban_30_mg    -0.44529 -0.31485 -0.24936 -0.17795 -0.05018
## d.Warfarin.Edoxaban_60_mg    -0.08689  0.02861  0.09087  0.15146  0.27703
## d.Warfarin.Rivaroxaban_20_mg -0.45058 -0.31998 -0.25653 -0.18755 -0.06827
## 
## 
## $DIC
##     Dbar       pD      DIC 
## 10.02615 10.02419 20.05035 
## 
## attr(,"class")
## [1] "summary.mtc.result"
```

```r
forest(results)
```

![](index_files/figure-html/strokeForest-1.png) 


# MI

Clean up the data (do not show the code).


```
## Warning in `[.data.table`(D, , `:=`(study = NA_character_, noac =
## NA_character_)): Invalid .internal.selfref detected and fixed by taking
## a (shallow) copy of the data.table so that := can add this new column by
## reference. At an earlier point, this data.table has been copied by R (or
## been created manually using structure() or similar). Avoid key<-, names<-
## and attr<- which in R currently (and oddly) may copy the whole data.table.
## Use set* syntax instead to avoid copying: ?set, ?setnames and ?setattr.
## Also, in R<=v3.0.2, list(DT1,DT2) copied the entire DT1 and DT2 (R's list()
## used to copy named objects); please upgrade to R>v3.0.2 if that is biting.
## If this message doesn't help, please report to datatable-help so the root
## cause can be fixed.
```

```
##              study         treatment responders sampleSize
##  1:          RE-LY Dabigatran_110_mg         86       6015
##  2:          RE-LY Dabigatran_150_mg         89       6076
##  3:          RE-LY          Warfarin         63       6022
##  4:      ARISTOTLE     Apixaban_5_mg         90       9120
##  5:      ARISTOTLE          Warfarin        102       9081
##  6:      ROCKET-AF Rivaroxaban_20_mg        101       7131
##  7:      ROCKET-AF          Warfarin        126       7133
##  8: ENGAGE AF-TIMI    Edoxaban_30_mg        133       7034
##  9: ENGAGE AF-TIMI    Edoxaban_60_mg        169       7035
## 10: ENGAGE AF-TIMI          Warfarin        141       7036
```


Plot the network.


```r
network <- mtc.network(D3)
plot(network)
```

![](index_files/figure-html/miNetwork-1.png) 

Run the model.


```r
M <- mtc.model(network, type="consistency", linearModel="fixed")
system.time(results <- mtc.run(M, n.adapt=20000, n.iter=20000, thin=20))
```

Sampler diagnostics.


```r
gelman.plot(results)
```

![](index_files/figure-html/miGelman-1.png) 


```r
plot(results)
```

![](index_files/figure-html/miTrace-1.png) ![](index_files/figure-html/miTrace-2.png) 

Summary.


```r
summary(results)
```

```
## $measure
## [1] "Log Odds Ratio"
## 
## $summaries
## 
## Iterations = 20020:40000
## Thinning interval = 20 
## Number of chains = 4 
## Sample size per chain = 1000 
## 
## 1. Empirical mean and standard deviation for each variable,
##    plus standard error of the mean:
## 
##                                 Mean     SD Naive SE Time-series SE
## d.Warfarin.Apixaban_5_mg     -0.1277 0.1463 0.002314       0.002355
## d.Warfarin.Dabigatran_110_mg  0.3209 0.1645 0.002601       0.002625
## d.Warfarin.Dabigatran_150_mg  0.3399 0.1671 0.002642       0.002660
## d.Warfarin.Edoxaban_30_mg    -0.0614 0.1207 0.001908       0.001887
## d.Warfarin.Edoxaban_60_mg     0.1849 0.1159 0.001833       0.001833
## d.Warfarin.Rivaroxaban_20_mg -0.2182 0.1346 0.002129       0.002157
## 
## 2. Quantiles for each variable:
## 
##                                   2.5%     25%     50%      75%   97.5%
## d.Warfarin.Apixaban_5_mg     -0.404097 -0.2298 -0.1313 -0.02795 0.16669
## d.Warfarin.Dabigatran_110_mg -0.001112  0.2122  0.3245  0.43059 0.63573
## d.Warfarin.Dabigatran_150_mg  0.015328  0.2270  0.3377  0.45583 0.66712
## d.Warfarin.Edoxaban_30_mg    -0.293893 -0.1444 -0.0615  0.02037 0.17476
## d.Warfarin.Edoxaban_60_mg    -0.038121  0.1061  0.1827  0.26253 0.41670
## d.Warfarin.Rivaroxaban_20_mg -0.489784 -0.3091 -0.2148 -0.12791 0.04229
## 
## 
## $DIC
##      Dbar        pD       DIC 
##  9.943814  9.937769 19.881583 
## 
## attr(,"class")
## [1] "summary.mtc.result"
```

```r
forest(results)
```

![](index_files/figure-html/miForest-1.png) 


# Bleeding

Clean up the data (do not show the code).


```
## Warning in `[.data.table`(D, , `:=`(study = NA_character_, noac =
## NA_character_)): Invalid .internal.selfref detected and fixed by taking
## a (shallow) copy of the data.table so that := can add this new column by
## reference. At an earlier point, this data.table has been copied by R (or
## been created manually using structure() or similar). Avoid key<-, names<-
## and attr<- which in R currently (and oddly) may copy the whole data.table.
## Use set* syntax instead to avoid copying: ?set, ?setnames and ?setattr.
## Also, in R<=v3.0.2, list(DT1,DT2) copied the entire DT1 and DT2 (R's list()
## used to copy named objects); please upgrade to R>v3.0.2 if that is biting.
## If this message doesn't help, please report to datatable-help so the root
## cause can be fixed.
```

```
##              study         treatment responders sampleSize
##  1:          RE-LY Dabigatran_110_mg        322       6015
##  2:          RE-LY Dabigatran_150_mg        375       6076
##  3:          RE-LY          Warfarin        397       6022
##  4:      ARISTOTLE     Apixaban_5_mg        148       9120
##  5:      ARISTOTLE          Warfarin        256       9081
##  6:      ROCKET-AF Rivaroxaban_20_mg        395       7131
##  7:      ROCKET-AF          Warfarin        386       7133
##  8: ENGAGE AF-TIMI    Edoxaban_30_mg        418       7034
##  9: ENGAGE AF-TIMI    Edoxaban_60_mg        254       7035
## 10: ENGAGE AF-TIMI          Warfarin        524       7036
```


Plot the network.


```r
network <- mtc.network(D4[!is.na(responders)])
plot(network)
```

![](index_files/figure-html/bleedingNetwork-1.png) 

Run the model.


```r
M <- mtc.model(network, type="consistency", linearModel="fixed")
system.time(results <- mtc.run(M, n.adapt=20000, n.iter=20000, thin=20))
```

Sampler diagnostics.


```r
gelman.plot(results)
```

![](index_files/figure-html/bleedingGelman-1.png) 


```r
plot(results)
```

![](index_files/figure-html/bleedingTrace-1.png) ![](index_files/figure-html/bleedingTrace-2.png) 

Summary.


```r
summary(results)
```

```
## $measure
## [1] "Log Odds Ratio"
## 
## $summaries
## 
## Iterations = 20020:40000
## Thinning interval = 20 
## Number of chains = 4 
## Sample size per chain = 1000 
## 
## 1. Empirical mean and standard deviation for each variable,
##    plus standard error of the mean:
## 
##                                  Mean      SD Naive SE Time-series SE
## d.Warfarin.Apixaban_5_mg     -0.56561 0.10449 0.001652       0.001628
## d.Warfarin.Dabigatran_110_mg -0.22175 0.07942 0.001256       0.001277
## d.Warfarin.Dabigatran_150_mg -0.06958 0.07595 0.001201       0.001201
## d.Warfarin.Edoxaban_30_mg    -0.24168 0.06770 0.001070       0.001104
## d.Warfarin.Edoxaban_60_mg    -0.76707 0.07788 0.001231       0.001235
## d.Warfarin.Rivaroxaban_20_mg  0.02483 0.07450 0.001178       0.001181
## 
## 2. Quantiles for each variable:
## 
##                                 2.5%      25%      50%      75%    97.5%
## d.Warfarin.Apixaban_5_mg     -0.7745 -0.63313 -0.56348 -0.49614 -0.35919
## d.Warfarin.Dabigatran_110_mg -0.3809 -0.27485 -0.22244 -0.16889 -0.06261
## d.Warfarin.Dabigatran_150_mg -0.2173 -0.12126 -0.06944 -0.01823  0.07672
## d.Warfarin.Edoxaban_30_mg    -0.3769 -0.28782 -0.24198 -0.19575 -0.10941
## d.Warfarin.Edoxaban_60_mg    -0.9197 -0.81927 -0.76772 -0.71439 -0.61396
## d.Warfarin.Rivaroxaban_20_mg -0.1184 -0.02587  0.02534  0.07455  0.16970
## 
## 
## $DIC
##     Dbar       pD      DIC 
## 10.08573 10.08383 20.16956 
## 
## attr(,"class")
## [1] "summary.mtc.result"
```

```r
forest(results)
```

![](index_files/figure-html/bleedingForest-1.png) 
