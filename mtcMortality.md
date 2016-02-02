# NOAC network meta-analysis: Mortality
Benjamin Chan  
`r Sys.time()`  


Clean up the data (do not show the code).


```
##               study         treatment responders sampleSize
##  1:       ARISTOTLE     Apixaban_5_mg        603       9120
##  2:       ARISTOTLE          Warfarin        669       9081
##  3:     ARISTOTLE-J     Apixaban_5_mg          0         72
##  4:     ARISTOTLE-J          Warfarin          0         75
##  5:  ENGAGE AF-TIMI    Edoxaban_30_mg        737       7034
##  6:  ENGAGE AF-TIMI    Edoxaban_60_mg        773       7035
##  7:  ENGAGE AF-TIMI          Warfarin        839       7036
##  8:        J-ROCKET Rivaroxaban_15_mg          7        639
##  9:        J-ROCKET          Warfarin          5        639
## 10:           RE-LY Dabigatran_110_mg        446       6015
## 11:           RE-LY Dabigatran_150_mg        438       6076
## 12:           RE-LY          Warfarin        487       6022
## 13:       ROCKET-AF Rivaroxaban_20_mg        208       7131
## 14:       ROCKET-AF          Warfarin        250       7133
## 15: Yamashita, 2012    Edoxaban_30_mg          0        131
## 16: Yamashita, 2012    Edoxaban_60_mg          1        131
## 17: Yamashita, 2012          Warfarin          1        129
```

# Network plot


```r
plot(network)
```

![](mtcMortality_files/figure-html/mortalityNetwork-1.png) 

Run the model using fixed-effects.


```r
M <- mtc.model(network, type="consistency", linearModel=effect)
runtime <- system.time(results <- mtc.run(M, n.adapt=nAdapt, n.iter=nIter, thin=thin))
```

# Summary

Head-to-head odds ratios and 95% confidence bounds are stored in
[mtcMortalityHTH.csv](mtcMortalityHTH.csv).


```r
hth <- combineResults()
hth[, .(label, result)]
```

```
##                                      label            result
##  1:     Dabigatran 110 mg vs Apixaban 5 mg 1.02 (0.86, 1.22)
##  2:     Dabigatran 150 mg vs Apixaban 5 mg 0.99 (0.83, 1.18)
##  3:        Edoxaban 30 mg vs Apixaban 5 mg 0.97 (0.83, 1.13)
##  4:        Edoxaban 60 mg vs Apixaban 5 mg 1.02 (0.88, 1.20)
##  5:     Rivaroxaban 15 mg vs Apixaban 5 mg 1.62 (0.50, 5.60)
##  6:     Rivaroxaban 20 mg vs Apixaban 5 mg 0.93 (0.75, 1.16)
##  7:              Warfarin vs Apixaban 5 mg 1.12 (1.00, 1.26)
##  8:     Apixaban 5 mg vs Dabigatran 110 mg 0.98 (0.82, 1.16)
##  9: Dabigatran 150 mg vs Dabigatran 110 mg 0.97 (0.85, 1.11)
## 10:    Edoxaban 30 mg vs Dabigatran 110 mg 0.95 (0.80, 1.13)
## 11:    Edoxaban 60 mg vs Dabigatran 110 mg 1.00 (0.84, 1.18)
## 12: Rivaroxaban 15 mg vs Dabigatran 110 mg 1.58 (0.49, 5.41)
## 13: Rivaroxaban 20 mg vs Dabigatran 110 mg 0.91 (0.72, 1.15)
## 14:          Warfarin vs Dabigatran 110 mg 1.10 (0.96, 1.25)
## 15:     Apixaban 5 mg vs Dabigatran 150 mg 1.01 (0.85, 1.20)
## 16: Dabigatran 110 mg vs Dabigatran 150 mg 1.03 (0.90, 1.18)
## 17:    Edoxaban 30 mg vs Dabigatran 150 mg 0.98 (0.82, 1.16)
## 18:    Edoxaban 60 mg vs Dabigatran 150 mg 1.03 (0.87, 1.23)
## 19: Rivaroxaban 15 mg vs Dabigatran 150 mg 1.63 (0.50, 5.57)
## 20: Rivaroxaban 20 mg vs Dabigatran 150 mg 0.94 (0.74, 1.19)
## 21:          Warfarin vs Dabigatran 150 mg 1.13 (0.99, 1.30)
## 22:        Apixaban 5 mg vs Edoxaban 30 mg 1.03 (0.88, 1.20)
## 23:    Dabigatran 110 mg vs Edoxaban 30 mg 1.05 (0.89, 1.25)
## 24:    Dabigatran 150 mg vs Edoxaban 30 mg 1.02 (0.86, 1.22)
## 25:       Edoxaban 60 mg vs Edoxaban 30 mg 1.06 (0.95, 1.18)
## 26:    Rivaroxaban 15 mg vs Edoxaban 30 mg 1.67 (0.51, 5.72)
## 27:    Rivaroxaban 20 mg vs Edoxaban 30 mg 0.96 (0.77, 1.19)
## 28:             Warfarin vs Edoxaban 30 mg 1.16 (1.04, 1.29)
## 29:        Apixaban 5 mg vs Edoxaban 60 mg 0.98 (0.84, 1.14)
## 30:    Dabigatran 110 mg vs Edoxaban 60 mg 1.00 (0.84, 1.19)
## 31:    Dabigatran 150 mg vs Edoxaban 60 mg 0.97 (0.82, 1.15)
## 32:       Edoxaban 30 mg vs Edoxaban 60 mg 0.95 (0.85, 1.05)
## 33:    Rivaroxaban 15 mg vs Edoxaban 60 mg 1.58 (0.48, 5.40)
## 34:    Rivaroxaban 20 mg vs Edoxaban 60 mg 0.91 (0.73, 1.13)
## 35:             Warfarin vs Edoxaban 60 mg 1.10 (0.99, 1.22)
## 36:     Apixaban 5 mg vs Rivaroxaban 20 mg 1.08 (0.86, 1.34)
## 37: Dabigatran 110 mg vs Rivaroxaban 20 mg 1.10 (0.87, 1.39)
## 38: Dabigatran 150 mg vs Rivaroxaban 20 mg 1.07 (0.84, 1.35)
## 39:    Edoxaban 30 mg vs Rivaroxaban 20 mg 1.04 (0.84, 1.30)
## 40:    Edoxaban 60 mg vs Rivaroxaban 20 mg 1.10 (0.88, 1.37)
## 41: Rivaroxaban 15 mg vs Rivaroxaban 20 mg 1.74 (0.54, 5.94)
## 42:          Warfarin vs Rivaroxaban 20 mg 1.21 (1.00, 1.47)
## 43:              Apixaban 5 mg vs Warfarin 0.89 (0.79, 1.00)
## 44:          Dabigatran 110 mg vs Warfarin 0.91 (0.80, 1.04)
## 45:          Dabigatran 150 mg vs Warfarin 0.88 (0.77, 1.01)
## 46:             Edoxaban 30 mg vs Warfarin 0.86 (0.78, 0.96)
## 47:             Edoxaban 60 mg vs Warfarin 0.91 (0.82, 1.01)
## 48:          Rivaroxaban 15 mg vs Warfarin 1.44 (0.44, 4.96)
## 49:          Rivaroxaban 20 mg vs Warfarin 0.83 (0.68, 1.00)
##                                      label            result
```

```r
write.csv(hth, file="mtcMortalityHTH.csv", row.names=FALSE)
```

# Diagnostics


```r
runtime
```

```
##    user  system elapsed 
##   13.12    0.00   13.24
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
##                                  Mean      SD  Naive SE Time-series SE
## d.Warfarin.Apixaban_5_mg     -0.11650 0.05775 0.0006457      0.0006492
## d.Warfarin.Dabigatran_110_mg -0.09336 0.06785 0.0007585      0.0008316
## d.Warfarin.Dabigatran_150_mg -0.12352 0.06819 0.0007624      0.0007588
## d.Warfarin.Edoxaban_30_mg    -0.14688 0.05430 0.0006071      0.0006989
## d.Warfarin.Edoxaban_60_mg    -0.09137 0.05365 0.0005998      0.0006103
## d.Warfarin.Rivaroxaban_15_mg  0.37116 0.61186 0.0068408      0.0069433
## d.Warfarin.Rivaroxaban_20_mg -0.18898 0.09752 0.0010903      0.0011536
## 
## 2. Quantiles for each variable:
## 
##                                 2.5%      25%      50%      75%      97.5%
## d.Warfarin.Apixaban_5_mg     -0.2318 -0.15523 -0.11695 -0.07849 -0.0029843
## d.Warfarin.Dabigatran_110_mg -0.2258 -0.13924 -0.09359 -0.04784  0.0385709
## d.Warfarin.Dabigatran_150_mg -0.2587 -0.16916 -0.12404 -0.07648  0.0093943
## d.Warfarin.Edoxaban_30_mg    -0.2541 -0.18417 -0.14642 -0.11019 -0.0392843
## d.Warfarin.Edoxaban_60_mg    -0.1966 -0.12839 -0.09078 -0.05540  0.0115186
## d.Warfarin.Rivaroxaban_15_mg -0.8159 -0.04972  0.36498  0.78326  1.6018017
## d.Warfarin.Rivaroxaban_20_mg -0.3819 -0.25345 -0.19057 -0.12340  0.0008541
## 
## 
## $DIC
##     Dbar       pD      DIC 
## 14.76039 13.12810 27.88849 
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
## d.Warfarin.Apixaban_5_mg              1       1.00
## d.Warfarin.Dabigatran_110_mg          1       1.00
## d.Warfarin.Dabigatran_150_mg          1       1.00
## d.Warfarin.Edoxaban_30_mg             1       1.00
## d.Warfarin.Edoxaban_60_mg             1       1.00
## d.Warfarin.Rivaroxaban_15_mg          1       1.01
## d.Warfarin.Rivaroxaban_20_mg          1       1.00
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
##                  t1                t2  i2.pair  i2.cons incons.p
## 1     Apixaban_5_mg          Warfarin  0.00000  0.00000       NA
## 2 Dabigatran_110_mg Dabigatran_150_mg       NA       NA       NA
## 3 Dabigatran_110_mg          Warfarin       NA       NA       NA
## 4 Dabigatran_150_mg          Warfarin       NA       NA       NA
## 5    Edoxaban_30_mg    Edoxaban_60_mg 67.28753 34.97424       NA
## 6    Edoxaban_30_mg          Warfarin 74.76060 31.85815       NA
## 7    Edoxaban_60_mg          Warfarin  0.00000  0.00000       NA
## 8 Rivaroxaban_15_mg          Warfarin       NA       NA       NA
## 9 Rivaroxaban_20_mg          Warfarin       NA       NA       NA
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

![](mtcMortality_files/figure-html/mortalityAnohe-1.png) ![](mtcMortality_files/figure-html/mortalityAnohe-2.png) ![](mtcMortality_files/figure-html/mortalityAnohe-3.png) ![](mtcMortality_files/figure-html/mortalityAnohe-4.png) 

```
## Unrelated Mean Effects (UME) model:
```

![](mtcMortality_files/figure-html/mortalityAnohe-5.png) ![](mtcMortality_files/figure-html/mortalityAnohe-6.png) ![](mtcMortality_files/figure-html/mortalityAnohe-7.png) ![](mtcMortality_files/figure-html/mortalityAnohe-8.png) 

```
## Consistency model:
```

![](mtcMortality_files/figure-html/mortalityAnohe-9.png) ![](mtcMortality_files/figure-html/mortalityAnohe-10.png) 
