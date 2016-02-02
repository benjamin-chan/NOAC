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
##  1:     Dabigatran 110 mg vs Apixaban 5 mg   1.57 (1.02, 2.44)
##  2:     Dabigatran 150 mg vs Apixaban 5 mg   1.61 (1.05, 2.45)
##  3:        Edoxaban 30 mg vs Apixaban 5 mg   1.08 (0.74, 1.57)
##  4:        Edoxaban 60 mg vs Apixaban 5 mg   1.37 (0.95, 1.97)
##  5:     Rivaroxaban 15 mg vs Apixaban 5 mg 4.41 (0.48, 123.84)
##  6:     Rivaroxaban 20 mg vs Apixaban 5 mg   0.91 (0.62, 1.33)
##  7:              Warfarin vs Apixaban 5 mg   1.14 (0.86, 1.51)
##  8:     Apixaban 5 mg vs Dabigatran 110 mg   0.64 (0.41, 0.98)
##  9: Dabigatran 150 mg vs Dabigatran 110 mg   1.02 (0.76, 1.39)
## 10:    Edoxaban 30 mg vs Dabigatran 110 mg   0.68 (0.46, 1.03)
## 11:    Edoxaban 60 mg vs Dabigatran 110 mg   0.87 (0.59, 1.31)
## 12: Rivaroxaban 15 mg vs Dabigatran 110 mg  2.81 (0.31, 75.18)
## 13: Rivaroxaban 20 mg vs Dabigatran 110 mg   0.58 (0.38, 0.87)
## 14:          Warfarin vs Dabigatran 110 mg   0.73 (0.52, 1.00)
## 15:     Apixaban 5 mg vs Dabigatran 150 mg   0.62 (0.41, 0.96)
## 16: Dabigatran 110 mg vs Dabigatran 150 mg   0.98 (0.72, 1.32)
## 17:    Edoxaban 30 mg vs Dabigatran 150 mg   0.67 (0.45, 0.99)
## 18:    Edoxaban 60 mg vs Dabigatran 150 mg   0.86 (0.58, 1.26)
## 19: Rivaroxaban 15 mg vs Dabigatran 150 mg  2.76 (0.29, 75.74)
## 20: Rivaroxaban 20 mg vs Dabigatran 150 mg   0.57 (0.38, 0.86)
## 21:          Warfarin vs Dabigatran 150 mg   0.71 (0.51, 0.98)
## 22:        Apixaban 5 mg vs Edoxaban 30 mg   0.93 (0.64, 1.35)
## 23:    Dabigatran 110 mg vs Edoxaban 30 mg   1.47 (0.97, 2.20)
## 24:    Dabigatran 150 mg vs Edoxaban 30 mg   1.50 (1.01, 2.24)
## 25:       Edoxaban 60 mg vs Edoxaban 30 mg   1.28 (1.01, 1.62)
## 26:    Rivaroxaban 15 mg vs Edoxaban 30 mg 4.16 (0.44, 110.13)
## 27:    Rivaroxaban 20 mg vs Edoxaban 30 mg   0.85 (0.59, 1.21)
## 28:             Warfarin vs Edoxaban 30 mg   1.06 (0.83, 1.35)
## 29:        Apixaban 5 mg vs Edoxaban 60 mg   0.73 (0.51, 1.05)
## 30:    Dabigatran 110 mg vs Edoxaban 60 mg   1.15 (0.77, 1.69)
## 31:    Dabigatran 150 mg vs Edoxaban 60 mg   1.17 (0.79, 1.72)
## 32:       Edoxaban 30 mg vs Edoxaban 60 mg   0.78 (0.62, 0.99)
## 33:    Rivaroxaban 15 mg vs Edoxaban 60 mg  3.25 (0.35, 86.23)
## 34:    Rivaroxaban 20 mg vs Edoxaban 60 mg   0.66 (0.47, 0.93)
## 35:             Warfarin vs Edoxaban 60 mg   0.83 (0.66, 1.04)
## 36:     Apixaban 5 mg vs Rivaroxaban 20 mg   1.10 (0.75, 1.62)
## 37: Dabigatran 110 mg vs Rivaroxaban 20 mg   1.73 (1.14, 2.63)
## 38: Dabigatran 150 mg vs Rivaroxaban 20 mg   1.77 (1.16, 2.66)
## 39:    Edoxaban 30 mg vs Rivaroxaban 20 mg   1.18 (0.82, 1.69)
## 40:    Edoxaban 60 mg vs Rivaroxaban 20 mg   1.51 (1.07, 2.15)
## 41: Rivaroxaban 15 mg vs Rivaroxaban 20 mg 4.89 (0.51, 130.93)
## 42:          Warfarin vs Rivaroxaban 20 mg   1.25 (0.96, 1.64)
## 43:              Apixaban 5 mg vs Warfarin   0.88 (0.66, 1.17)
## 44:          Dabigatran 110 mg vs Warfarin   1.38 (1.00, 1.92)
## 45:          Dabigatran 150 mg vs Warfarin   1.41 (1.02, 1.96)
## 46:             Edoxaban 30 mg vs Warfarin   0.94 (0.74, 1.20)
## 47:             Edoxaban 60 mg vs Warfarin   1.20 (0.96, 1.51)
## 48:          Rivaroxaban 15 mg vs Warfarin 3.89 (0.42, 103.87)
## 49:          Rivaroxaban 20 mg vs Warfarin   0.80 (0.61, 1.04)
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
##   11.22    0.00   11.39
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
##                                 Mean     SD Naive SE Time-series SE
## d.Warfarin.Apixaban_5_mg     -0.1313 0.1443 0.001613       0.001630
## d.Warfarin.Dabigatran_110_mg  0.3211 0.1675 0.001872       0.002038
## d.Warfarin.Dabigatran_150_mg  0.3437 0.1643 0.001837       0.001886
## d.Warfarin.Edoxaban_30_mg    -0.0589 0.1233 0.001379       0.001632
## d.Warfarin.Edoxaban_60_mg     0.1860 0.1149 0.001284       0.001353
## d.Warfarin.Rivaroxaban_15_mg  1.4982 1.4136 0.015805       0.015089
## d.Warfarin.Rivaroxaban_20_mg -0.2261 0.1355 0.001515       0.001486
## 
## 2. Quantiles for each variable:
## 
##                                   2.5%     25%      50%      75%   97.5%
## d.Warfarin.Apixaban_5_mg     -0.413759 -0.2284 -0.13101 -0.03432 0.15576
## d.Warfarin.Dabigatran_110_mg -0.003843  0.2060  0.32059  0.43292 0.65112
## d.Warfarin.Dabigatran_150_mg  0.020459  0.2329  0.34331  0.45409 0.67148
## d.Warfarin.Edoxaban_30_mg    -0.296966 -0.1419 -0.05982  0.02181 0.18373
## d.Warfarin.Edoxaban_60_mg    -0.036429  0.1065  0.18474  0.26585 0.41162
## d.Warfarin.Rivaroxaban_15_mg -0.868209  0.5367  1.35930  2.30277 4.64315
## d.Warfarin.Rivaroxaban_20_mg -0.493048 -0.3166 -0.22641 -0.13413 0.03751
## 
## 
## $DIC
##     Dbar       pD      DIC 
## 12.35000 12.17155 24.52156 
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
## d.Warfarin.Apixaban_5_mg              1       1.00
## d.Warfarin.Dabigatran_110_mg          1       1.00
## d.Warfarin.Dabigatran_150_mg          1       1.00
## d.Warfarin.Edoxaban_30_mg             1       1.00
## d.Warfarin.Edoxaban_60_mg             1       1.01
## d.Warfarin.Rivaroxaban_15_mg          1       1.00
## d.Warfarin.Rivaroxaban_20_mg          1       1.00
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
