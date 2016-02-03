# NOAC network meta-analysis: Stroke
Benjamin Chan  
`r Sys.time()`  


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
##  8: ENGAGE AF-TIMI    Edoxaban_30_mg        182       7034
##  9: ENGAGE AF-TIMI    Edoxaban_60_mg        253       7035
## 10: ENGAGE AF-TIMI          Warfarin        232       7036
```

# Network plot


```r
plot(network)
```

![](mtcStroke_files/figure-html/strokeNetwork-1.png) 

Run the model using fixed-effects.


```r
M <- mtc.model(network, type="consistency", linearModel=effect)
runtime <- system.time(results <- mtc.run(M, n.adapt=nAdapt, n.iter=nIter, thin=thin))
```

# Summary

Head-to-head odds ratios and 95% confidence bounds are stored in
[mtcStrokeHTH.csv](mtcStrokeHTH.csv).


```r
hth <- combineResults()
hth[, .(label, result)]
```

```
##                                      label            result
##  1:     Dabigatran 110 mg vs Apixaban 5 mg 1.15 (0.87, 1.52)
##  2:     Dabigatran 150 mg vs Apixaban 5 mg 0.83 (0.63, 1.11)
##  3:        Edoxaban 30 mg vs Apixaban 5 mg 0.99 (0.76, 1.29)
##  4:        Edoxaban 60 mg vs Apixaban 5 mg 1.38 (1.07, 1.79)
##  5:     Rivaroxaban 20 mg vs Apixaban 5 mg 0.98 (0.75, 1.28)
##  6:              Warfarin vs Apixaban 5 mg 1.26 (1.05, 1.52)
##  7:     Apixaban 5 mg vs Dabigatran 110 mg 0.87 (0.66, 1.15)
##  8: Dabigatran 150 mg vs Dabigatran 110 mg 0.72 (0.58, 0.90)
##  9:    Edoxaban 30 mg vs Dabigatran 110 mg 0.86 (0.65, 1.14)
## 10:    Edoxaban 60 mg vs Dabigatran 110 mg 1.20 (0.91, 1.59)
## 11: Rivaroxaban 20 mg vs Dabigatran 110 mg 0.85 (0.64, 1.13)
## 12:          Warfarin vs Dabigatran 110 mg 1.10 (0.89, 1.35)
## 13:     Apixaban 5 mg vs Dabigatran 150 mg 1.20 (0.90, 1.60)
## 14: Dabigatran 110 mg vs Dabigatran 150 mg 1.38 (1.11, 1.74)
## 15:    Edoxaban 30 mg vs Dabigatran 150 mg 1.18 (0.88, 1.60)
## 16:    Edoxaban 60 mg vs Dabigatran 150 mg 1.66 (1.25, 2.21)
## 17: Rivaroxaban 20 mg vs Dabigatran 150 mg 1.18 (0.87, 1.58)
## 18:          Warfarin vs Dabigatran 150 mg 1.52 (1.22, 1.89)
## 19:        Apixaban 5 mg vs Edoxaban 30 mg 1.01 (0.77, 1.32)
## 20:    Dabigatran 110 mg vs Edoxaban 30 mg 1.17 (0.88, 1.55)
## 21:    Dabigatran 150 mg vs Edoxaban 30 mg 0.84 (0.63, 1.14)
## 22:       Edoxaban 60 mg vs Edoxaban 30 mg 1.40 (1.16, 1.70)
## 23:    Rivaroxaban 20 mg vs Edoxaban 30 mg 0.99 (0.75, 1.31)
## 24:             Warfarin vs Edoxaban 30 mg 1.28 (1.05, 1.57)
## 25:        Apixaban 5 mg vs Edoxaban 60 mg 0.72 (0.56, 0.93)
## 26:    Dabigatran 110 mg vs Edoxaban 60 mg 0.84 (0.63, 1.10)
## 27:    Dabigatran 150 mg vs Edoxaban 60 mg 0.60 (0.45, 0.80)
## 28:       Edoxaban 30 mg vs Edoxaban 60 mg 0.71 (0.59, 0.86)
## 29:    Rivaroxaban 20 mg vs Edoxaban 60 mg 0.71 (0.54, 0.92)
## 30:             Warfarin vs Edoxaban 60 mg 0.92 (0.76, 1.09)
## 31:     Apixaban 5 mg vs Rivaroxaban 20 mg 1.02 (0.78, 1.34)
## 32: Dabigatran 110 mg vs Rivaroxaban 20 mg 1.18 (0.88, 1.56)
## 33: Dabigatran 150 mg vs Rivaroxaban 20 mg 0.85 (0.63, 1.14)
## 34:    Edoxaban 30 mg vs Rivaroxaban 20 mg 1.01 (0.76, 1.33)
## 35:    Edoxaban 60 mg vs Rivaroxaban 20 mg 1.41 (1.08, 1.85)
## 36:          Warfarin vs Rivaroxaban 20 mg 1.29 (1.07, 1.57)
## 37:              Apixaban 5 mg vs Warfarin 0.79 (0.66, 0.95)
## 38:          Dabigatran 110 mg vs Warfarin 0.91 (0.74, 1.12)
## 39:          Dabigatran 150 mg vs Warfarin 0.66 (0.53, 0.82)
## 40:             Edoxaban 30 mg vs Warfarin 0.78 (0.64, 0.95)
## 41:             Edoxaban 60 mg vs Warfarin 1.09 (0.92, 1.31)
## 42:          Rivaroxaban 20 mg vs Warfarin 0.77 (0.64, 0.94)
##                                      label            result
```

```r
write.csv(hth, file="mtcStrokeHTH.csv", row.names=FALSE)
```

# Diagnostics


```r
runtime
```

```
##    user  system elapsed 
##    8.11    0.00    9.59
```

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
##                                  Mean      SD Naive SE Time-series SE
## d.Warfarin.Apixaban_5_mg     -0.23378 0.09366 0.001047       0.001075
## d.Warfarin.Dabigatran_110_mg -0.09309 0.10595 0.001185       0.001309
## d.Warfarin.Dabigatran_150_mg -0.41633 0.11311 0.001265       0.001254
## d.Warfarin.Edoxaban_30_mg    -0.24784 0.10061 0.001125       0.001379
## d.Warfarin.Edoxaban_60_mg     0.08940 0.09163 0.001024       0.001066
## d.Warfarin.Rivaroxaban_20_mg -0.25620 0.09897 0.001107       0.001104
## 
## 2. Quantiles for each variable:
## 
##                                  2.5%      25%      50%      75%    97.5%
## d.Warfarin.Apixaban_5_mg     -0.42000 -0.29610 -0.23344 -0.17099 -0.05130
## d.Warfarin.Dabigatran_110_mg -0.30260 -0.16407 -0.09403 -0.02141  0.11117
## d.Warfarin.Dabigatran_150_mg -0.63736 -0.49302 -0.41695 -0.33952 -0.19800
## d.Warfarin.Edoxaban_30_mg    -0.44898 -0.31487 -0.24777 -0.18110 -0.05116
## d.Warfarin.Edoxaban_60_mg    -0.08706  0.02684  0.08878  0.15190  0.27170
## d.Warfarin.Rivaroxaban_20_mg -0.44983 -0.32081 -0.25627 -0.18962 -0.06531
## 
## 
## $DIC
##      Dbar        pD       DIC 
##  9.984658  9.982833 19.967491 
## 
## attr(,"class")
## [1] "summary.mtc.result"
```

Sampler diagnostics.


```r
gelman.plot(results)
```

![](mtcStroke_files/figure-html/strokeGelman-1.png) 

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

![](mtcStroke_files/figure-html/strokeTrace-1.png) ![](mtcStroke_files/figure-html/strokeTrace-2.png) 

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

![](mtcStroke_files/figure-html/strokeAnohe-1.png) ![](mtcStroke_files/figure-html/strokeAnohe-2.png) 

```
## Unrelated Mean Effects (UME) model:
```

![](mtcStroke_files/figure-html/strokeAnohe-3.png) ![](mtcStroke_files/figure-html/strokeAnohe-4.png) ![](mtcStroke_files/figure-html/strokeAnohe-5.png) 

```
## Consistency model:
```

![](mtcStroke_files/figure-html/strokeAnohe-6.png) ![](mtcStroke_files/figure-html/strokeAnohe-7.png) 
