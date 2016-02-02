# NOAC network meta-analysis: MI
Benjamin Chan  
`r Sys.time()`  


Clean up the data (do not show the code).


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
pairwiseComparisons <- combineResults()
pairwiseComparisons[, .(label, result)]
```

```
##                                      label            result
##  1:     Dabigatran 110 mg vs Apixaban 5 mg 1.56 (1.01, 2.42)
##  2:     Dabigatran 150 mg vs Apixaban 5 mg 1.60 (1.04, 2.44)
##  3:        Edoxaban 30 mg vs Apixaban 5 mg 1.07 (0.73, 1.56)
##  4:        Edoxaban 60 mg vs Apixaban 5 mg 1.37 (0.94, 1.96)
##  5:     Rivaroxaban 20 mg vs Apixaban 5 mg 0.91 (0.62, 1.33)
##  6:              Warfarin vs Apixaban 5 mg 1.14 (0.85, 1.51)
##  7:     Apixaban 5 mg vs Dabigatran 110 mg 0.64 (0.41, 0.99)
##  8: Dabigatran 150 mg vs Dabigatran 110 mg 1.02 (0.76, 1.38)
##  9:    Edoxaban 30 mg vs Dabigatran 110 mg 0.68 (0.46, 1.04)
## 10:    Edoxaban 60 mg vs Dabigatran 110 mg 0.87 (0.59, 1.31)
## 11: Rivaroxaban 20 mg vs Dabigatran 110 mg 0.58 (0.38, 0.88)
## 12:          Warfarin vs Dabigatran 110 mg 0.72 (0.52, 1.01)
## 13:     Apixaban 5 mg vs Dabigatran 150 mg 0.62 (0.41, 0.96)
## 14: Dabigatran 110 mg vs Dabigatran 150 mg 0.98 (0.72, 1.32)
## 15:    Edoxaban 30 mg vs Dabigatran 150 mg 0.67 (0.45, 1.00)
## 16:    Edoxaban 60 mg vs Dabigatran 150 mg 0.85 (0.57, 1.27)
## 17: Rivaroxaban 20 mg vs Dabigatran 150 mg 0.57 (0.37, 0.85)
## 18:          Warfarin vs Dabigatran 150 mg 0.71 (0.51, 0.98)
## 19:        Apixaban 5 mg vs Edoxaban 30 mg 0.93 (0.64, 1.37)
## 20:    Dabigatran 110 mg vs Edoxaban 30 mg 1.46 (0.97, 2.18)
## 21:    Dabigatran 150 mg vs Edoxaban 30 mg 1.49 (1.00, 2.25)
## 22:       Edoxaban 60 mg vs Edoxaban 30 mg 1.27 (1.02, 1.61)
## 23:    Rivaroxaban 20 mg vs Edoxaban 30 mg 0.84 (0.59, 1.22)
## 24:             Warfarin vs Edoxaban 30 mg 1.06 (0.84, 1.35)
## 25:        Apixaban 5 mg vs Edoxaban 60 mg 0.73 (0.51, 1.06)
## 26:    Dabigatran 110 mg vs Edoxaban 60 mg 1.15 (0.76, 1.69)
## 27:    Dabigatran 150 mg vs Edoxaban 60 mg 1.17 (0.79, 1.74)
## 28:       Edoxaban 30 mg vs Edoxaban 60 mg 0.79 (0.62, 0.98)
## 29:    Rivaroxaban 20 mg vs Edoxaban 60 mg 0.66 (0.47, 0.94)
## 30:             Warfarin vs Edoxaban 60 mg 0.83 (0.66, 1.04)
## 31:     Apixaban 5 mg vs Rivaroxaban 20 mg 1.10 (0.75, 1.62)
## 32: Dabigatran 110 mg vs Rivaroxaban 20 mg 1.73 (1.14, 2.63)
## 33: Dabigatran 150 mg vs Rivaroxaban 20 mg 1.76 (1.17, 2.69)
## 34:    Edoxaban 30 mg vs Rivaroxaban 20 mg 1.18 (0.82, 1.69)
## 35:    Edoxaban 60 mg vs Rivaroxaban 20 mg 1.51 (1.06, 2.13)
## 36:          Warfarin vs Rivaroxaban 20 mg 1.26 (0.96, 1.63)
## 37:              Apixaban 5 mg vs Warfarin 0.88 (0.66, 1.17)
## 38:          Dabigatran 110 mg vs Warfarin 1.38 (0.99, 1.90)
## 39:          Dabigatran 150 mg vs Warfarin 1.41 (1.02, 1.95)
## 40:             Edoxaban 30 mg vs Warfarin 0.95 (0.74, 1.19)
## 41:             Edoxaban 60 mg vs Warfarin 1.20 (0.96, 1.51)
## 42:          Rivaroxaban 20 mg vs Warfarin 0.80 (0.61, 1.04)
##                                      label            result
```

```r
write.csv(pairwiseComparisons, file="mtcMIPairwiseComparisons.csv")
```

# Diagnostics


```r
runtime
```

```
##    user  system elapsed 
##    7.73    0.00    8.72
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
## d.Warfarin.Apixaban_5_mg     -0.12731 0.1461 0.001633       0.001631
## d.Warfarin.Dabigatran_110_mg  0.32085 0.1665 0.001862       0.002116
## d.Warfarin.Dabigatran_150_mg  0.34371 0.1656 0.001852       0.001952
## d.Warfarin.Edoxaban_30_mg    -0.05743 0.1220 0.001364       0.001594
## d.Warfarin.Edoxaban_60_mg     0.18469 0.1146 0.001281       0.001336
## d.Warfarin.Rivaroxaban_20_mg -0.22562 0.1359 0.001519       0.001567
## 
## 2. Quantiles for each variable:
## 
##                                   2.5%     25%      50%      75%   97.5%
## d.Warfarin.Apixaban_5_mg     -0.412037 -0.2259 -0.12766 -0.02908 0.16056
## d.Warfarin.Dabigatran_110_mg -0.008223  0.2090  0.32168  0.43450 0.64444
## d.Warfarin.Dabigatran_150_mg  0.015525  0.2297  0.34480  0.45666 0.66720
## d.Warfarin.Edoxaban_30_mg    -0.298018 -0.1385 -0.05615  0.02572 0.17771
## d.Warfarin.Edoxaban_60_mg    -0.038036  0.1070  0.18643  0.26190 0.41289
## d.Warfarin.Rivaroxaban_20_mg -0.491595 -0.3173 -0.22750 -0.13313 0.04226
## 
## 
## $DIC
##     Dbar       pD      DIC 
## 10.02587 10.02357 20.04944 
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

![](mtcMI_files/figure-html/miAnohe-1.png) ![](mtcMI_files/figure-html/miAnohe-2.png) 

```
## Unrelated Mean Effects (UME) model:
```

![](mtcMI_files/figure-html/miAnohe-3.png) ![](mtcMI_files/figure-html/miAnohe-4.png) ![](mtcMI_files/figure-html/miAnohe-5.png) 

```
## Consistency model:
```

![](mtcMI_files/figure-html/miAnohe-6.png) ![](mtcMI_files/figure-html/miAnohe-7.png) 
