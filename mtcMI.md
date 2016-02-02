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
##  1:     Dabigatran 110 mg vs Apixaban 5 mg   1.56 (1.02, 2.45)
##  2:     Dabigatran 150 mg vs Apixaban 5 mg   1.60 (1.03, 2.47)
##  3:        Edoxaban 30 mg vs Apixaban 5 mg   1.07 (0.74, 1.56)
##  4:        Edoxaban 60 mg vs Apixaban 5 mg   1.38 (0.95, 1.96)
##  5:     Rivaroxaban 15 mg vs Apixaban 5 mg 4.48 (0.48, 113.64)
##  6:     Rivaroxaban 20 mg vs Apixaban 5 mg   0.91 (0.61, 1.35)
##  7:              Warfarin vs Apixaban 5 mg   1.14 (0.85, 1.51)
##  8:     Apixaban 5 mg vs Dabigatran 110 mg   0.64 (0.41, 0.98)
##  9: Dabigatran 150 mg vs Dabigatran 110 mg   1.02 (0.76, 1.37)
## 10:    Edoxaban 30 mg vs Dabigatran 110 mg   0.68 (0.45, 1.02)
## 11:    Edoxaban 60 mg vs Dabigatran 110 mg   0.88 (0.58, 1.29)
## 12: Rivaroxaban 15 mg vs Dabigatran 110 mg  2.82 (0.31, 70.79)
## 13: Rivaroxaban 20 mg vs Dabigatran 110 mg   0.58 (0.38, 0.89)
## 14:          Warfarin vs Dabigatran 110 mg   0.73 (0.52, 1.00)
## 15:     Apixaban 5 mg vs Dabigatran 150 mg   0.63 (0.40, 0.97)
## 16: Dabigatran 110 mg vs Dabigatran 150 mg   0.98 (0.73, 1.31)
## 17:    Edoxaban 30 mg vs Dabigatran 150 mg   0.67 (0.44, 1.00)
## 18:    Edoxaban 60 mg vs Dabigatran 150 mg   0.86 (0.57, 1.29)
## 19: Rivaroxaban 15 mg vs Dabigatran 150 mg  2.78 (0.31, 69.02)
## 20: Rivaroxaban 20 mg vs Dabigatran 150 mg   0.57 (0.37, 0.87)
## 21:          Warfarin vs Dabigatran 150 mg   0.71 (0.51, 0.98)
## 22:        Apixaban 5 mg vs Edoxaban 30 mg   0.93 (0.64, 1.36)
## 23:    Dabigatran 110 mg vs Edoxaban 30 mg   1.46 (0.98, 2.24)
## 24:    Dabigatran 150 mg vs Edoxaban 30 mg   1.49 (1.00, 2.25)
## 25:       Edoxaban 60 mg vs Edoxaban 30 mg   1.28 (1.01, 1.63)
## 26:    Rivaroxaban 15 mg vs Edoxaban 30 mg 4.16 (0.46, 102.74)
## 27:    Rivaroxaban 20 mg vs Edoxaban 30 mg   0.85 (0.59, 1.22)
## 28:             Warfarin vs Edoxaban 30 mg   1.07 (0.83, 1.35)
## 29:        Apixaban 5 mg vs Edoxaban 60 mg   0.73 (0.51, 1.05)
## 30:    Dabigatran 110 mg vs Edoxaban 60 mg   1.14 (0.77, 1.72)
## 31:    Dabigatran 150 mg vs Edoxaban 60 mg   1.17 (0.78, 1.75)
## 32:       Edoxaban 30 mg vs Edoxaban 60 mg   0.78 (0.62, 0.99)
## 33:    Rivaroxaban 15 mg vs Edoxaban 60 mg  3.21 (0.36, 80.13)
## 34:    Rivaroxaban 20 mg vs Edoxaban 60 mg   0.66 (0.47, 0.95)
## 35:             Warfarin vs Edoxaban 60 mg   0.83 (0.66, 1.04)
## 36:     Apixaban 5 mg vs Rivaroxaban 20 mg   1.10 (0.74, 1.63)
## 37: Dabigatran 110 mg vs Rivaroxaban 20 mg   1.72 (1.13, 2.60)
## 38: Dabigatran 150 mg vs Rivaroxaban 20 mg   1.77 (1.15, 2.69)
## 39:    Edoxaban 30 mg vs Rivaroxaban 20 mg   1.18 (0.82, 1.69)
## 40:    Edoxaban 60 mg vs Rivaroxaban 20 mg   1.51 (1.05, 2.12)
## 41: Rivaroxaban 15 mg vs Rivaroxaban 20 mg 4.87 (0.54, 119.63)
## 42:          Warfarin vs Rivaroxaban 20 mg   1.25 (0.96, 1.64)
## 43:              Apixaban 5 mg vs Warfarin   0.88 (0.66, 1.17)
## 44:          Dabigatran 110 mg vs Warfarin   1.37 (1.00, 1.92)
## 45:          Dabigatran 150 mg vs Warfarin   1.40 (1.02, 1.96)
## 46:             Edoxaban 30 mg vs Warfarin   0.94 (0.74, 1.20)
## 47:             Edoxaban 60 mg vs Warfarin   1.20 (0.96, 1.51)
## 48:          Rivaroxaban 15 mg vs Warfarin  3.89 (0.43, 96.81)
## 49:          Rivaroxaban 20 mg vs Warfarin   0.80 (0.61, 1.05)
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
##    9.70    0.00    9.78
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
## d.Warfarin.Apixaban_5_mg     -0.12905 0.1460 0.001632       0.001617
## d.Warfarin.Dabigatran_110_mg  0.31923 0.1677 0.001875       0.002127
## d.Warfarin.Dabigatran_150_mg  0.34111 0.1680 0.001879       0.002011
## d.Warfarin.Edoxaban_30_mg    -0.06207 0.1239 0.001385       0.001651
## d.Warfarin.Edoxaban_60_mg     0.18586 0.1164 0.001301       0.001411
## d.Warfarin.Rivaroxaban_15_mg  1.50195 1.3873 0.015510       0.015505
## d.Warfarin.Rivaroxaban_20_mg -0.22362 0.1355 0.001514       0.001511
## 
## 2. Quantiles for each variable:
## 
##                                   2.5%     25%      50%      75%   97.5%
## d.Warfarin.Apixaban_5_mg     -0.414166 -0.2287 -0.12950 -0.02930 0.16097
## d.Warfarin.Dabigatran_110_mg -0.004323  0.2058  0.31634  0.43211 0.65048
## d.Warfarin.Dabigatran_150_mg  0.019769  0.2285  0.33800  0.45522 0.67468
## d.Warfarin.Edoxaban_30_mg    -0.300964 -0.1450 -0.06346  0.02114 0.18301
## d.Warfarin.Edoxaban_60_mg    -0.039499  0.1074  0.18544  0.26458 0.41524
## d.Warfarin.Rivaroxaban_15_mg -0.842814  0.5454  1.35819  2.30610 4.57279
## d.Warfarin.Rivaroxaban_20_mg -0.493646 -0.3126 -0.22483 -0.13130 0.04559
## 
## 
## $DIC
##     Dbar       pD      DIC 
## 12.32608 12.14719 24.47328 
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
