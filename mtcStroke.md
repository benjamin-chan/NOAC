# NOAC network meta-analysis: Stroke
Benjamin Chan  
`r Sys.time()`  

[Back](README.md) to main page.

Clean up the data (do not show the code).


```
##              study         treatment responders sampleSize
##  1:          RE-LY Dabigatran_110_mg        182       6015
##  2:          RE-LY Dabigatran_150_mg        134       6076
##  3:          RE-LY          Warfarin        199       6022
##  4:      ARISTOTLE     Apixaban_5_mg        212       9120
##  5:      ARISTOTLE          Warfarin        265       9081
##  6:      ROCKET-AF Rivaroxaban_20_mg        188       7131
##  7:      ROCKET-AF          Warfarin        241       7133
##  8: ENGAGE AF-TIMI    Edoxaban_30_mg        253       7002
##  9: ENGAGE AF-TIMI    Edoxaban_60_mg        182       7012
## 10: ENGAGE AF-TIMI          Warfarin        232       7012
```

Run the model using fixed-effects.


```r
M <- mtc.model(network, type="consistency", linearModel=effect)
plot(M)
```

![](mtcStroke_files/figure-html/network-1.png) 

```r
results <- mtc.run(M, n.adapt=nAdapt, n.iter=nIter, thin=thin)
```

# Summary

Direct and indirect odds ratios and 95% confidence bounds are stored in
[mtcStrokeOddsRatios.csv](mtcStrokeOddsRatios.csv).


```r
or <- combineResults()
write.csv(or, file="mtcStrokeOddsRatios.csv", row.names=FALSE)
show(or)
```

```
##               treatment     Apixaban 5 mg Dabigatran 110 mg
## 1:     Apixaban 5 mg vs                NA 0.87 (0.66, 1.14)
## 2: Dabigatran 110 mg vs 1.15 (0.88, 1.52)                NA
## 3: Dabigatran 150 mg vs 0.83 (0.62, 1.11) 0.72 (0.58, 0.91)
## 4:    Edoxaban 30 mg vs 1.39 (1.07, 1.78) 1.20 (0.91, 1.57)
## 5:    Edoxaban 60 mg vs 0.98 (0.75, 1.28) 0.85 (0.64, 1.13)
## 6: Rivaroxaban 20 mg vs 0.98 (0.75, 1.27) 0.85 (0.64, 1.12)
## 7:          Warfarin vs 1.26 (1.05, 1.52) 1.10 (0.89, 1.34)
##    Dabigatran 150 mg    Edoxaban 30 mg    Edoxaban 60 mg Rivaroxaban 20 mg
## 1: 1.20 (0.90, 1.60) 0.72 (0.56, 0.93) 1.02 (0.78, 1.34) 1.02 (0.79, 1.34)
## 2: 1.38 (1.10, 1.74) 0.83 (0.64, 1.10) 1.17 (0.88, 1.57) 1.18 (0.89, 1.57)
## 3:                NA 0.60 (0.45, 0.80) 0.85 (0.63, 1.14) 0.85 (0.64, 1.15)
## 4: 1.66 (1.25, 2.20)                NA 1.41 (1.16, 1.72) 1.41 (1.08, 1.85)
## 5: 1.18 (0.87, 1.59) 0.71 (0.58, 0.86)                NA 1.00 (0.76, 1.33)
## 6: 1.18 (0.87, 1.57) 0.71 (0.54, 0.92) 1.00 (0.75, 1.31)                NA
## 7: 1.51 (1.22, 1.90) 0.91 (0.76, 1.10) 1.28 (1.06, 1.57) 1.29 (1.07, 1.57)
##             Warfarin
## 1: 0.79 (0.66, 0.95)
## 2: 0.91 (0.75, 1.12)
## 3: 0.66 (0.53, 0.82)
## 4: 1.10 (0.91, 1.31)
## 5: 0.78 (0.64, 0.95)
## 6: 0.77 (0.64, 0.93)
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
## Iterations = 5010:30000
## Thinning interval = 10 
## Number of chains = 4 
## Sample size per chain = 2500 
## 
## 1. Empirical mean and standard deviation for each variable,
##    plus standard error of the mean:
## 
##                                  Mean      SD  Naive SE Time-series SE
## d.Warfarin.Apixaban_5_mg     -0.23380 0.09449 0.0009449      0.0009719
## d.Warfarin.Dabigatran_110_mg -0.09107 0.10414 0.0010414      0.0011172
## d.Warfarin.Dabigatran_150_mg -0.41659 0.11396 0.0011396      0.0011627
## d.Warfarin.Edoxaban_30_mg     0.09120 0.09318 0.0009318      0.0010022
## d.Warfarin.Edoxaban_60_mg    -0.25164 0.10054 0.0010054      0.0010000
## d.Warfarin.Rivaroxaban_20_mg -0.25681 0.09792 0.0009792      0.0010310
## 
## 2. Quantiles for each variable:
## 
##                                  2.5%      25%     50%      75%    97.5%
## d.Warfarin.Apixaban_5_mg     -0.42022 -0.29925 -0.2337 -0.16941 -0.04918
## d.Warfarin.Dabigatran_110_mg -0.29282 -0.16164 -0.0920 -0.02193  0.11442
## d.Warfarin.Dabigatran_150_mg -0.64241 -0.49350 -0.4146 -0.33986 -0.19478
## d.Warfarin.Edoxaban_30_mg    -0.09287  0.02911  0.0917  0.15402  0.27200
## d.Warfarin.Edoxaban_60_mg    -0.45187 -0.31965 -0.2505 -0.18461 -0.05418
## d.Warfarin.Rivaroxaban_20_mg -0.44959 -0.32304 -0.2562 -0.19044 -0.06736
## 
## 
## $DIC
##     Dbar       pD      DIC 
## 10.03850 10.03791 20.07641 
## 
## attr(,"class")
## [1] "summary.mtc.result"
```

Sampler diagnostics.


```r
gelman.plot(results)
```

![](mtcStroke_files/figure-html/gelman-1.png) 

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

![](mtcStroke_files/figure-html/trace-1.png) ![](mtcStroke_files/figure-html/trace-2.png) 


```r
autocorr.plot(results$samples)
```

![](mtcStroke_files/figure-html/autocorr-1.png) ![](mtcStroke_files/figure-html/autocorr-2.png) ![](mtcStroke_files/figure-html/autocorr-3.png) ![](mtcStroke_files/figure-html/autocorr-4.png) 

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

![](mtcStroke_files/figure-html/anohe-1.png) ![](mtcStroke_files/figure-html/anohe-2.png) 

```
## Unrelated Mean Effects (UME) model:
```

![](mtcStroke_files/figure-html/anohe-3.png) ![](mtcStroke_files/figure-html/anohe-4.png) ![](mtcStroke_files/figure-html/anohe-5.png) 

```
## Consistency model:
```

![](mtcStroke_files/figure-html/anohe-6.png) ![](mtcStroke_files/figure-html/anohe-7.png) 
