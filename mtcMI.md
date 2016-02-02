# NOAC network meta-analysis: MI
Benjamin Chan  
`r Sys.time()`  


Clean up the data (do not show the code).


```
##              study         treatment responders sampleSize
##  1:      ARISTOTLE     Apixaban_5_mg         90       9120
##  2:      ARISTOTLE          Warfarin        102       9081
##  3:    ARISTOTLE-J     Apixaban_5_mg          0         72
##  4:    ARISTOTLE-J          Warfarin          0         75
##  5: ENGAGE AF-TIMI    Edoxaban_30_mg        133       7034
##  6: ENGAGE AF-TIMI    Edoxaban_60_mg        169       7035
##  7: ENGAGE AF-TIMI          Warfarin        141       7036
##  8:       J-ROCKET Rivaroxaban_15_mg          3        639
##  9:       J-ROCKET          Warfarin          1        639
## 10:          RE-LY Dabigatran_110_mg         86       6015
## 11:          RE-LY Dabigatran_150_mg         89       6076
## 12:          RE-LY          Warfarin         63       6022
## 13:      ROCKET-AF Rivaroxaban_20_mg        101       7131
## 14:      ROCKET-AF          Warfarin        126       7133
```

# Network plot


```r
plot(network)
```

![](mtcMI_files/figure-html/miNetwork-1.png) 

Run the model using fixed-effects.


```r
M <- mtc.model(network, type="consistency", linearModel=effect)
runtime <- system.time(results <- mtc.run(M, n.adapt=nAdapt, n.iter=nIter, thin=thin))
```

# Summary


```r
hth <- combineResults()
hth[, .(label, result)]
```

```
##                                      label              result
##  1:     Dabigatran 110 mg vs Apixaban 5 mg   1.55 (1.01, 2.41)
##  2:     Dabigatran 150 mg vs Apixaban 5 mg   1.60 (1.04, 2.45)
##  3:        Edoxaban 30 mg vs Apixaban 5 mg   1.07 (0.74, 1.55)
##  4:        Edoxaban 60 mg vs Apixaban 5 mg   1.37 (0.95, 1.96)
##  5:     Rivaroxaban 15 mg vs Apixaban 5 mg 4.54 (0.47, 120.97)
##  6:     Rivaroxaban 20 mg vs Apixaban 5 mg   0.90 (0.62, 1.34)
##  7:              Warfarin vs Apixaban 5 mg   1.13 (0.85, 1.50)
##  8:     Apixaban 5 mg vs Dabigatran 110 mg   0.64 (0.42, 0.99)
##  9: Dabigatran 150 mg vs Dabigatran 110 mg   1.03 (0.76, 1.38)
## 10:    Edoxaban 30 mg vs Dabigatran 110 mg   0.69 (0.46, 1.04)
## 11:    Edoxaban 60 mg vs Dabigatran 110 mg   0.88 (0.59, 1.30)
## 12: Rivaroxaban 15 mg vs Dabigatran 110 mg  2.90 (0.30, 76.21)
## 13: Rivaroxaban 20 mg vs Dabigatran 110 mg   0.58 (0.38, 0.88)
## 14:          Warfarin vs Dabigatran 110 mg   0.73 (0.52, 1.02)
## 15:     Apixaban 5 mg vs Dabigatran 150 mg   0.63 (0.41, 0.96)
## 16: Dabigatran 110 mg vs Dabigatran 150 mg   0.97 (0.72, 1.32)
## 17:    Edoxaban 30 mg vs Dabigatran 150 mg   0.67 (0.45, 1.00)
## 18:    Edoxaban 60 mg vs Dabigatran 150 mg   0.86 (0.58, 1.27)
## 19: Rivaroxaban 15 mg vs Dabigatran 150 mg  2.82 (0.28, 74.45)
## 20: Rivaroxaban 20 mg vs Dabigatran 150 mg   0.57 (0.38, 0.86)
## 21:          Warfarin vs Dabigatran 150 mg   0.71 (0.52, 0.98)
## 22:        Apixaban 5 mg vs Edoxaban 30 mg   0.94 (0.64, 1.36)
## 23:    Dabigatran 110 mg vs Edoxaban 30 mg   1.46 (0.96, 2.18)
## 24:    Dabigatran 150 mg vs Edoxaban 30 mg   1.49 (1.00, 2.23)
## 25:       Edoxaban 60 mg vs Edoxaban 30 mg   1.28 (1.02, 1.61)
## 26:    Rivaroxaban 15 mg vs Edoxaban 30 mg 4.20 (0.44, 113.10)
## 27:    Rivaroxaban 20 mg vs Edoxaban 30 mg   0.85 (0.59, 1.20)
## 28:             Warfarin vs Edoxaban 30 mg   1.06 (0.84, 1.35)
## 29:        Apixaban 5 mg vs Edoxaban 60 mg   0.73 (0.51, 1.06)
## 30:    Dabigatran 110 mg vs Edoxaban 60 mg   1.14 (0.77, 1.69)
## 31:    Dabigatran 150 mg vs Edoxaban 60 mg   1.17 (0.79, 1.72)
## 32:       Edoxaban 30 mg vs Edoxaban 60 mg   0.78 (0.62, 0.98)
## 33:    Rivaroxaban 15 mg vs Edoxaban 60 mg  3.30 (0.34, 88.93)
## 34:    Rivaroxaban 20 mg vs Edoxaban 60 mg   0.66 (0.47, 0.94)
## 35:             Warfarin vs Edoxaban 60 mg   0.83 (0.66, 1.04)
## 36:     Apixaban 5 mg vs Rivaroxaban 20 mg   1.11 (0.75, 1.62)
## 37: Dabigatran 110 mg vs Rivaroxaban 20 mg   1.72 (1.13, 2.61)
## 38: Dabigatran 150 mg vs Rivaroxaban 20 mg   1.77 (1.17, 2.66)
## 39:    Edoxaban 30 mg vs Rivaroxaban 20 mg   1.18 (0.83, 1.69)
## 40:    Edoxaban 60 mg vs Rivaroxaban 20 mg   1.51 (1.07, 2.14)
## 41: Rivaroxaban 15 mg vs Rivaroxaban 20 mg 4.99 (0.51, 136.07)
## 42:          Warfarin vs Rivaroxaban 20 mg   1.25 (0.96, 1.63)
## 43:              Apixaban 5 mg vs Warfarin   0.88 (0.67, 1.17)
## 44:          Dabigatran 110 mg vs Warfarin   1.37 (0.98, 1.91)
## 45:          Dabigatran 150 mg vs Warfarin   1.41 (1.02, 1.93)
## 46:             Edoxaban 30 mg vs Warfarin   0.94 (0.74, 1.20)
## 47:             Edoxaban 60 mg vs Warfarin   1.20 (0.96, 1.51)
## 48:          Rivaroxaban 15 mg vs Warfarin 3.95 (0.42, 104.41)
## 49:          Rivaroxaban 20 mg vs Warfarin   0.80 (0.61, 1.04)
##                                      label              result
```

```r
write.csv(hth, file="mtcMIHTH.csv")
```

# Diagnostics


```r
runtime
```

```
##    user  system elapsed 
##   11.37    0.00   11.42
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
##                                  Mean     SD Naive SE Time-series SE
## d.Warfarin.Apixaban_5_mg     -0.12572 0.1452 0.001623       0.001690
## d.Warfarin.Dabigatran_110_mg  0.31519 0.1682 0.001880       0.002221
## d.Warfarin.Dabigatran_150_mg  0.34080 0.1652 0.001846       0.002001
## d.Warfarin.Edoxaban_30_mg    -0.05924 0.1218 0.001362       0.001625
## d.Warfarin.Edoxaban_60_mg     0.18649 0.1157 0.001293       0.001357
## d.Warfarin.Rivaroxaban_15_mg  1.49657 1.3863 0.015499       0.015493
## d.Warfarin.Rivaroxaban_20_mg -0.22601 0.1346 0.001505       0.001579
## 
## 2. Quantiles for each variable:
## 
##                                  2.5%     25%      50%      75%  97.5%
## d.Warfarin.Apixaban_5_mg     -0.40466 -0.2242 -0.12535 -0.02903 0.1599
## d.Warfarin.Dabigatran_110_mg -0.01755  0.2017  0.31447  0.42946 0.6473
## d.Warfarin.Dabigatran_150_mg  0.01743  0.2296  0.34133  0.45340 0.6599
## d.Warfarin.Edoxaban_30_mg    -0.29763 -0.1383 -0.05959  0.01869 0.1790
## d.Warfarin.Edoxaban_60_mg    -0.04329  0.1082  0.18567  0.26411 0.4121
## d.Warfarin.Rivaroxaban_15_mg -0.87663  0.5619  1.37384  2.28949 4.6484
## d.Warfarin.Rivaroxaban_20_mg -0.48773 -0.3184 -0.22637 -0.13566 0.0396
## 
## 
## $DIC
##     Dbar       pD      DIC 
## 12.25408 12.08312 24.33720 
## 
## attr(,"class")
## [1] "summary.mtc.result"
```

Sampler diagnostics.


```r
gelman.plot(results)
```

![](mtcMI_files/figure-html/miGelman-1.png) 

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
## d.Warfarin.Rivaroxaban_15_mg          1          1
## d.Warfarin.Rivaroxaban_20_mg          1          1
## 
## Multivariate psrf
## 
## 1
```


```r
plot(results)
```

![](mtcMI_files/figure-html/miTrace-1.png) ![](mtcMI_files/figure-html/miTrace-2.png) 

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
## 1     Apixaban_5_mg          Warfarin       0       0       NA
## 2 Dabigatran_110_mg Dabigatran_150_mg      NA      NA       NA
## 3 Dabigatran_110_mg          Warfarin      NA      NA       NA
## 4 Dabigatran_150_mg          Warfarin      NA      NA       NA
## 5    Edoxaban_30_mg    Edoxaban_60_mg      NA      NA       NA
## 6    Edoxaban_30_mg          Warfarin      NA      NA       NA
## 7    Edoxaban_60_mg          Warfarin      NA      NA       NA
## 8 Rivaroxaban_15_mg          Warfarin      NA      NA       NA
## 9 Rivaroxaban_20_mg          Warfarin      NA      NA       NA
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

![](mtcMI_files/figure-html/miAnohe-1.png) ![](mtcMI_files/figure-html/miAnohe-2.png) 

```
## Unrelated Mean Effects (UME) model:
```

![](mtcMI_files/figure-html/miAnohe-3.png) ![](mtcMI_files/figure-html/miAnohe-4.png) ![](mtcMI_files/figure-html/miAnohe-5.png) ![](mtcMI_files/figure-html/miAnohe-6.png) 

```
## Consistency model:
```

![](mtcMI_files/figure-html/miAnohe-7.png) ![](mtcMI_files/figure-html/miAnohe-8.png) 
