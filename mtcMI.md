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

Head-to-head odds ratios and 95% confidence bounds are stored in
[mtcMIHTH.csv](mtcMIHTH.csv).


```r
hth <- combineResults()
hth[, .(label, result)]
```

```
##                                      label              result
##  1:     Dabigatran 110 mg vs Apixaban 5 mg   1.56 (1.02, 2.44)
##  2:     Dabigatran 150 mg vs Apixaban 5 mg   1.61 (1.04, 2.49)
##  3:        Edoxaban 30 mg vs Apixaban 5 mg   1.08 (0.74, 1.56)
##  4:        Edoxaban 60 mg vs Apixaban 5 mg   1.37 (0.95, 1.97)
##  5:     Rivaroxaban 15 mg vs Apixaban 5 mg 4.30 (0.45, 106.73)
##  6:     Rivaroxaban 20 mg vs Apixaban 5 mg   0.91 (0.61, 1.34)
##  7:              Warfarin vs Apixaban 5 mg   1.14 (0.86, 1.52)
##  8:     Apixaban 5 mg vs Dabigatran 110 mg   0.64 (0.41, 0.98)
##  9: Dabigatran 150 mg vs Dabigatran 110 mg   1.03 (0.76, 1.38)
## 10:    Edoxaban 30 mg vs Dabigatran 110 mg   0.69 (0.46, 1.02)
## 11:    Edoxaban 60 mg vs Dabigatran 110 mg   0.87 (0.59, 1.30)
## 12: Rivaroxaban 15 mg vs Dabigatran 110 mg  2.76 (0.29, 67.49)
## 13: Rivaroxaban 20 mg vs Dabigatran 110 mg   0.58 (0.38, 0.88)
## 14:          Warfarin vs Dabigatran 110 mg   0.73 (0.52, 1.00)
## 15:     Apixaban 5 mg vs Dabigatran 150 mg   0.62 (0.40, 0.96)
## 16: Dabigatran 110 mg vs Dabigatran 150 mg   0.97 (0.72, 1.32)
## 17:    Edoxaban 30 mg vs Dabigatran 150 mg   0.67 (0.45, 1.00)
## 18:    Edoxaban 60 mg vs Dabigatran 150 mg   0.86 (0.58, 1.26)
## 19: Rivaroxaban 15 mg vs Dabigatran 150 mg  2.69 (0.28, 68.70)
## 20: Rivaroxaban 20 mg vs Dabigatran 150 mg   0.57 (0.37, 0.85)
## 21:          Warfarin vs Dabigatran 150 mg   0.71 (0.52, 0.98)
## 22:        Apixaban 5 mg vs Edoxaban 30 mg   0.93 (0.64, 1.35)
## 23:    Dabigatran 110 mg vs Edoxaban 30 mg   1.45 (0.98, 2.19)
## 24:    Dabigatran 150 mg vs Edoxaban 30 mg   1.49 (1.00, 2.22)
## 25:       Edoxaban 60 mg vs Edoxaban 30 mg   1.27 (1.02, 1.61)
## 26:    Rivaroxaban 15 mg vs Edoxaban 30 mg  4.05 (0.41, 99.36)
## 27:    Rivaroxaban 20 mg vs Edoxaban 30 mg   0.85 (0.59, 1.20)
## 28:             Warfarin vs Edoxaban 30 mg   1.06 (0.83, 1.34)
## 29:        Apixaban 5 mg vs Edoxaban 60 mg   0.73 (0.51, 1.05)
## 30:    Dabigatran 110 mg vs Edoxaban 60 mg   1.14 (0.77, 1.70)
## 31:    Dabigatran 150 mg vs Edoxaban 60 mg   1.17 (0.79, 1.71)
## 32:       Edoxaban 30 mg vs Edoxaban 60 mg   0.79 (0.62, 0.98)
## 33:    Rivaroxaban 15 mg vs Edoxaban 60 mg  3.16 (0.33, 76.25)
## 34:    Rivaroxaban 20 mg vs Edoxaban 60 mg   0.67 (0.47, 0.94)
## 35:             Warfarin vs Edoxaban 60 mg   0.83 (0.66, 1.04)
## 36:     Apixaban 5 mg vs Rivaroxaban 15 mg   0.23 (0.01, 2.21)
## 37: Dabigatran 110 mg vs Rivaroxaban 15 mg   0.36 (0.01, 3.42)
## 38: Dabigatran 150 mg vs Rivaroxaban 15 mg   0.37 (0.01, 3.52)
## 39:    Edoxaban 30 mg vs Rivaroxaban 15 mg   0.25 (0.01, 2.41)
## 40:    Edoxaban 60 mg vs Rivaroxaban 15 mg   0.32 (0.01, 3.04)
## 41: Rivaroxaban 20 mg vs Rivaroxaban 15 mg   0.21 (0.01, 2.01)
## 42:          Warfarin vs Rivaroxaban 15 mg   0.26 (0.01, 2.46)
## 43:     Apixaban 5 mg vs Rivaroxaban 20 mg   1.10 (0.75, 1.63)
## 44: Dabigatran 110 mg vs Rivaroxaban 20 mg   1.72 (1.13, 2.63)
## 45: Dabigatran 150 mg vs Rivaroxaban 20 mg   1.76 (1.17, 2.68)
## 46:    Edoxaban 30 mg vs Rivaroxaban 20 mg   1.18 (0.83, 1.69)
## 47:    Edoxaban 60 mg vs Rivaroxaban 20 mg   1.50 (1.06, 2.15)
## 48: Rivaroxaban 15 mg vs Rivaroxaban 20 mg 4.76 (0.50, 117.86)
## 49:          Warfarin vs Rivaroxaban 20 mg   1.25 (0.96, 1.63)
## 50:              Apixaban 5 mg vs Warfarin   0.88 (0.66, 1.16)
## 51:          Dabigatran 110 mg vs Warfarin   1.37 (1.00, 1.92)
## 52:          Dabigatran 150 mg vs Warfarin   1.41 (1.02, 1.94)
## 53:             Edoxaban 30 mg vs Warfarin   0.94 (0.75, 1.20)
## 54:             Edoxaban 60 mg vs Warfarin   1.20 (0.96, 1.52)
## 55:          Rivaroxaban 15 mg vs Warfarin  3.78 (0.41, 92.20)
## 56:          Rivaroxaban 20 mg vs Warfarin   0.80 (0.61, 1.04)
##                                      label              result
```

```r
write.csv(hth, file="mtcMIHTH.csv", row.names=FALSE)
```

# Diagnostics


```r
runtime
```

```
##    user  system elapsed 
##   11.20    0.00   11.24
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
## d.Warfarin.Apixaban_5_mg     -0.12997 0.1444 0.001615       0.001603
## d.Warfarin.Dabigatran_110_mg  0.31841 0.1681 0.001879       0.002305
## d.Warfarin.Dabigatran_150_mg  0.34364 0.1654 0.001849       0.001958
## d.Warfarin.Edoxaban_30_mg    -0.05797 0.1208 0.001350       0.001576
## d.Warfarin.Edoxaban_60_mg     0.18541 0.1157 0.001294       0.001334
## d.Warfarin.Rivaroxaban_15_mg  1.46290 1.3747 0.015370       0.015933
## d.Warfarin.Rivaroxaban_20_mg -0.22433 0.1337 0.001494       0.001562
## 
## 2. Quantiles for each variable:
## 
##                                   2.5%     25%      50%      75%   97.5%
## d.Warfarin.Apixaban_5_mg     -0.416699 -0.2276 -0.12913 -0.03201 0.14668
## d.Warfarin.Dabigatran_110_mg -0.004879  0.2051  0.31651  0.43108 0.65352
## d.Warfarin.Dabigatran_150_mg  0.023525  0.2324  0.34017  0.45511 0.66039
## d.Warfarin.Edoxaban_30_mg    -0.293378 -0.1397 -0.05743  0.02244 0.18136
## d.Warfarin.Edoxaban_60_mg    -0.042943  0.1058  0.18500  0.26279 0.41647
## d.Warfarin.Rivaroxaban_15_mg -0.899291  0.5445  1.32937  2.25333 4.52398
## d.Warfarin.Rivaroxaban_20_mg -0.487386 -0.3139 -0.22235 -0.13548 0.03701
## 
## 
## $DIC
##     Dbar       pD      DIC 
## 12.25789 12.08421 24.34210 
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
