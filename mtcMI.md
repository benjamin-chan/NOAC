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
##  1:     Dabigatran 110 mg vs Apixaban 5 mg   1.56 (1.01, 2.40)
##  2:     Dabigatran 150 mg vs Apixaban 5 mg   1.60 (1.04, 2.45)
##  3:        Edoxaban 30 mg vs Apixaban 5 mg   1.07 (0.74, 1.55)
##  4:        Edoxaban 60 mg vs Apixaban 5 mg   1.37 (0.96, 1.97)
##  5:     Rivaroxaban 15 mg vs Apixaban 5 mg 4.41 (0.48, 111.41)
##  6:     Rivaroxaban 20 mg vs Apixaban 5 mg   0.91 (0.62, 1.34)
##  7:              Warfarin vs Apixaban 5 mg   1.14 (0.85, 1.50)
##  8:     Apixaban 5 mg vs Dabigatran 110 mg   0.64 (0.42, 0.99)
##  9: Dabigatran 150 mg vs Dabigatran 110 mg   1.03 (0.76, 1.39)
## 10:    Edoxaban 30 mg vs Dabigatran 110 mg   0.69 (0.46, 1.04)
## 11:    Edoxaban 60 mg vs Dabigatran 110 mg   0.88 (0.59, 1.32)
## 12: Rivaroxaban 15 mg vs Dabigatran 110 mg  2.83 (0.30, 72.53)
## 13: Rivaroxaban 20 mg vs Dabigatran 110 mg   0.58 (0.38, 0.88)
## 14:          Warfarin vs Dabigatran 110 mg   0.73 (0.53, 1.00)
## 15:     Apixaban 5 mg vs Dabigatran 150 mg   0.62 (0.41, 0.96)
## 16: Dabigatran 110 mg vs Dabigatran 150 mg   0.97 (0.72, 1.32)
## 17:    Edoxaban 30 mg vs Dabigatran 150 mg   0.67 (0.45, 1.00)
## 18:    Edoxaban 60 mg vs Dabigatran 150 mg   0.86 (0.58, 1.28)
## 19: Rivaroxaban 15 mg vs Dabigatran 150 mg  2.74 (0.30, 69.62)
## 20: Rivaroxaban 20 mg vs Dabigatran 150 mg   0.57 (0.37, 0.86)
## 21:          Warfarin vs Dabigatran 150 mg   0.71 (0.51, 0.98)
## 22:        Apixaban 5 mg vs Edoxaban 30 mg   0.93 (0.64, 1.35)
## 23:    Dabigatran 110 mg vs Edoxaban 30 mg   1.45 (0.96, 2.18)
## 24:    Dabigatran 150 mg vs Edoxaban 30 mg   1.49 (1.00, 2.23)
## 25:       Edoxaban 60 mg vs Edoxaban 30 mg   1.28 (1.02, 1.62)
## 26:    Rivaroxaban 15 mg vs Edoxaban 30 mg 4.09 (0.44, 103.49)
## 27:    Rivaroxaban 20 mg vs Edoxaban 30 mg   0.85 (0.59, 1.22)
## 28:             Warfarin vs Edoxaban 30 mg   1.06 (0.84, 1.35)
## 29:        Apixaban 5 mg vs Edoxaban 60 mg   0.73 (0.51, 1.04)
## 30:    Dabigatran 110 mg vs Edoxaban 60 mg   1.14 (0.76, 1.70)
## 31:    Dabigatran 150 mg vs Edoxaban 60 mg   1.16 (0.78, 1.73)
## 32:       Edoxaban 30 mg vs Edoxaban 60 mg   0.78 (0.62, 0.98)
## 33:    Rivaroxaban 15 mg vs Edoxaban 60 mg  3.21 (0.35, 80.54)
## 34:    Rivaroxaban 20 mg vs Edoxaban 60 mg   0.66 (0.47, 0.94)
## 35:             Warfarin vs Edoxaban 60 mg   0.83 (0.66, 1.04)
## 36:     Apixaban 5 mg vs Rivaroxaban 20 mg   1.10 (0.75, 1.62)
## 37: Dabigatran 110 mg vs Rivaroxaban 20 mg   1.71 (1.14, 2.62)
## 38: Dabigatran 150 mg vs Rivaroxaban 20 mg   1.75 (1.17, 2.68)
## 39:    Edoxaban 30 mg vs Rivaroxaban 20 mg   1.18 (0.82, 1.69)
## 40:    Edoxaban 60 mg vs Rivaroxaban 20 mg   1.50 (1.06, 2.14)
## 41: Rivaroxaban 15 mg vs Rivaroxaban 20 mg 4.86 (0.52, 123.24)
## 42:          Warfarin vs Rivaroxaban 20 mg   1.25 (0.96, 1.63)
## 43:              Apixaban 5 mg vs Warfarin   0.88 (0.67, 1.17)
## 44:          Dabigatran 110 mg vs Warfarin   1.36 (1.00, 1.90)
## 45:          Dabigatran 150 mg vs Warfarin   1.40 (1.02, 1.95)
## 46:             Edoxaban 30 mg vs Warfarin   0.94 (0.74, 1.19)
## 47:             Edoxaban 60 mg vs Warfarin   1.21 (0.96, 1.51)
## 48:          Rivaroxaban 15 mg vs Warfarin  3.88 (0.44, 96.46)
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
##   11.30    0.00   11.31
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
## d.Warfarin.Apixaban_5_mg     -0.13051 0.1446 0.001617       0.001698
## d.Warfarin.Dabigatran_110_mg  0.31357 0.1663 0.001860       0.002119
## d.Warfarin.Dabigatran_150_mg  0.34023 0.1649 0.001844       0.001950
## d.Warfarin.Edoxaban_30_mg    -0.06008 0.1230 0.001375       0.001667
## d.Warfarin.Edoxaban_60_mg     0.18675 0.1153 0.001289       0.001325
## d.Warfarin.Rivaroxaban_15_mg  1.48331 1.3829 0.015462       0.015777
## d.Warfarin.Rivaroxaban_20_mg -0.22313 0.1356 0.001516       0.001521
## 
## 2. Quantiles for each variable:
## 
##                                  2.5%     25%      50%      75%  97.5%
## d.Warfarin.Apixaban_5_mg     -0.40617 -0.2299 -0.12911 -0.03320 0.1605
## d.Warfarin.Dabigatran_110_mg -0.00224  0.2003  0.31102  0.42628 0.6426
## d.Warfarin.Dabigatran_150_mg  0.02030  0.2267  0.33958  0.44885 0.6670
## d.Warfarin.Edoxaban_30_mg    -0.30145 -0.1415 -0.05837  0.02354 0.1780
## d.Warfarin.Edoxaban_60_mg    -0.03922  0.1088  0.18765  0.26414 0.4103
## d.Warfarin.Rivaroxaban_15_mg -0.82764  0.5585  1.35524  2.26228 4.5691
## d.Warfarin.Rivaroxaban_20_mg -0.49067 -0.3146 -0.22071 -0.13157 0.0409
## 
## 
## $DIC
##     Dbar       pD      DIC 
## 12.28108 12.09920 24.38028 
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
