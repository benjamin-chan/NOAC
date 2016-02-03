# NOAC network meta-analysis: Mortality
Benjamin Chan  
`r Sys.time()`  


Clean up the data (do not show the code).


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

Run the model using fixed-effects.


```r
M <- mtc.model(network, type="consistency", linearModel=effect)
plot(M)
```

![](mtcMortality_files/figure-html/mortalityNetwork-1.png) 

```r
results <- mtc.run(M, n.adapt=nAdapt, n.iter=nIter, thin=thin)
```

# Summary

Direct and indirect odds ratios and 95% confidence bounds are stored in
[mtcMortalityOddsRatios.csv](mtcMortalityOddsRatios.csv).


```r
or <- combineResults()
write.csv(or, file="mtcMortalityOddsRatios.csv", row.names=FALSE)
show(or)
```

```
##               treatment     Apixaban 5 mg Dabigatran 110 mg
## 1:     Apixaban 5 mg vs                NA 0.98 (0.82, 1.17)
## 2: Dabigatran 110 mg vs 1.02 (0.86, 1.22)                NA
## 3: Dabigatran 150 mg vs 0.99 (0.83, 1.18) 0.97 (0.85, 1.11)
## 4:    Edoxaban 30 mg vs 0.97 (0.83, 1.13) 0.95 (0.80, 1.13)
## 5:    Edoxaban 60 mg vs 1.02 (0.88, 1.20) 1.00 (0.85, 1.18)
## 6: Rivaroxaban 20 mg vs 0.93 (0.75, 1.16) 0.91 (0.72, 1.14)
## 7:          Warfarin vs 1.12 (1.00, 1.26) 1.10 (0.96, 1.25)
##    Dabigatran 150 mg    Edoxaban 30 mg    Edoxaban 60 mg Rivaroxaban 20 mg
## 1: 1.01 (0.84, 1.21) 1.03 (0.88, 1.20) 0.98 (0.84, 1.14) 1.07 (0.86, 1.34)
## 2: 1.03 (0.90, 1.18) 1.05 (0.89, 1.25) 1.00 (0.84, 1.18) 1.10 (0.87, 1.38)
## 3:                NA 1.02 (0.86, 1.21) 0.97 (0.82, 1.15) 1.07 (0.85, 1.34)
## 4: 0.98 (0.83, 1.16)                NA 0.95 (0.85, 1.05) 1.04 (0.84, 1.29)
## 5: 1.03 (0.87, 1.23) 1.06 (0.95, 1.18)                NA 1.10 (0.89, 1.36)
## 6: 0.94 (0.75, 1.18) 0.96 (0.77, 1.19) 0.91 (0.73, 1.13)                NA
## 7: 1.13 (0.99, 1.29) 1.16 (1.04, 1.28) 1.10 (0.99, 1.22) 1.21 (1.01, 1.45)
##             Warfarin
## 1: 0.89 (0.80, 1.00)
## 2: 0.91 (0.80, 1.04)
## 3: 0.88 (0.77, 1.01)
## 4: 0.86 (0.78, 0.96)
## 5: 0.91 (0.82, 1.01)
## 6: 0.83 (0.69, 0.99)
## 7:                NA
```

# Diagnostics


```r
summary(results)
```

```
## $measure
## [1] "Log Odds Ratio"
## 
## $summaries
## 
## Iterations = 5010:25000
## Thinning interval = 10 
## Number of chains = 4 
## Sample size per chain = 2000 
## 
## 1. Empirical mean and standard deviation for each variable,
##    plus standard error of the mean:
## 
##                                  Mean      SD  Naive SE Time-series SE
## d.Warfarin.Apixaban_5_mg     -0.11555 0.05835 0.0006524      0.0006766
## d.Warfarin.Dabigatran_110_mg -0.09328 0.06767 0.0007566      0.0008628
## d.Warfarin.Dabigatran_150_mg -0.12405 0.06778 0.0007578      0.0007579
## d.Warfarin.Edoxaban_30_mg    -0.14579 0.05323 0.0005951      0.0006701
## d.Warfarin.Edoxaban_60_mg    -0.09186 0.05318 0.0005945      0.0006087
## d.Warfarin.Rivaroxaban_20_mg -0.18760 0.09496 0.0010616      0.0010634
## 
## 2. Quantiles for each variable:
## 
##                                 2.5%     25%      50%      75%      97.5%
## d.Warfarin.Apixaban_5_mg     -0.2290 -0.1556 -0.11520 -0.07640 -0.0005723
## d.Warfarin.Dabigatran_110_mg -0.2269 -0.1389 -0.09377 -0.04738  0.0387202
## d.Warfarin.Dabigatran_150_mg -0.2585 -0.1688 -0.12374 -0.07846  0.0080351
## d.Warfarin.Edoxaban_30_mg    -0.2500 -0.1813 -0.14677 -0.10998 -0.0393000
## d.Warfarin.Edoxaban_60_mg    -0.1981 -0.1270 -0.09220 -0.05609  0.0118778
## d.Warfarin.Rivaroxaban_20_mg -0.3741 -0.2504 -0.18811 -0.12262 -0.0050351
## 
## 
## $DIC
##      Dbar        pD       DIC 
##  9.914766  9.912403 19.827169 
## 
## attr(,"class")
## [1] "summary.mtc.result"
```

Sampler diagnostics.


```r
gelman.plot(results)
```

![](mtcMortality_files/figure-html/mortalityGelman-1.png) 

```r
gelman.diag(results)
```

```
## Potential scale reduction factors:
## 
##                              Point est. Upper C.I.
## d.Warfarin.Apixaban_5_mg              1          1
## d.Warfarin.Dabigatran_110_mg          1          1
## d.Warfarin.Dabigatran_150_mg          1          1
## d.Warfarin.Edoxaban_30_mg             1          1
## d.Warfarin.Edoxaban_60_mg             1          1
## d.Warfarin.Rivaroxaban_20_mg          1          1
## 
## Multivariate psrf
## 
## 1
```


```r
plot(results)
```

![](mtcMortality_files/figure-html/mortalityTrace-1.png) ![](mtcMortality_files/figure-html/mortalityTrace-2.png) 

Assess the degree of heterogeneity and inconsistency.


```r
anohe <- mtc.anohe(network, n.adapt=nAdapt, n.iter=nIter, thin=thin)
```


```r
summary(anohe)
```

```
## Analysis of heterogeneity
## =========================
## 
## Per-comparison I-squared:
## -------------------------
## 
##                  t1                t2 i2.pair i2.cons incons.p
## 1     Apixaban_5_mg          Warfarin      NA      NA       NA
## 2 Dabigatran_110_mg Dabigatran_150_mg      NA      NA       NA
## 3 Dabigatran_110_mg          Warfarin      NA      NA       NA
## 4 Dabigatran_150_mg          Warfarin      NA      NA       NA
## 5    Edoxaban_30_mg    Edoxaban_60_mg      NA      NA       NA
## 6    Edoxaban_30_mg          Warfarin      NA      NA       NA
## 7    Edoxaban_60_mg          Warfarin      NA      NA       NA
## 8 Rivaroxaban_20_mg          Warfarin      NA      NA       NA
## 
## Global I-squared:
## -------------------------
## 
##   i2.pair i2.cons
## 1       0       0
```

```r
plot(anohe)
```

```
## Analysis of heterogeneity -- convergence plots
## Unrelated Study Effects (USE) model:
```

![](mtcMortality_files/figure-html/mortalityAnohe-1.png) ![](mtcMortality_files/figure-html/mortalityAnohe-2.png) 

```
## Unrelated Mean Effects (UME) model:
```

![](mtcMortality_files/figure-html/mortalityAnohe-3.png) ![](mtcMortality_files/figure-html/mortalityAnohe-4.png) ![](mtcMortality_files/figure-html/mortalityAnohe-5.png) 

```
## Consistency model:
```

![](mtcMortality_files/figure-html/mortalityAnohe-6.png) ![](mtcMortality_files/figure-html/mortalityAnohe-7.png) 
