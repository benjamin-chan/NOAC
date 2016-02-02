# NOAC network meta-analysis: Stroke
Benjamin Chan  
`r Sys.time()`  


Clean up the data (do not show the code).


```
##               study         treatment responders sampleSize
##  1:       ARISTOTLE     Apixaban_5_mg        212       9120
##  2:       ARISTOTLE          Warfarin        265       9081
##  3:     ARISTOTLE-J     Apixaban_5_mg          0         72
##  4:     ARISTOTLE-J          Warfarin          3         75
##  5:  ENGAGE AF-TIMI    Edoxaban_30_mg        182       7034
##  6:  ENGAGE AF-TIMI    Edoxaban_60_mg        253       7035
##  7:  ENGAGE AF-TIMI          Warfarin        232       7036
##  8:        J-ROCKET Rivaroxaban_15_mg         11        639
##  9:        J-ROCKET          Warfarin         22        639
## 10:       Mao, 2014 Rivaroxaban_20_mg          5        177
## 11:       Mao, 2014          Warfarin          7        176
## 12:           PETRO Dabigatran_150_mg          0        166
## 13:           PETRO          Warfarin          0         70
## 14:           RE-LY Dabigatran_110_mg        182       6015
## 15:           RE-LY Dabigatran_150_mg        134       6076
## 16:           RE-LY          Warfarin        199       6022
## 17:       ROCKET-AF Rivaroxaban_20_mg        188       7131
## 18:       ROCKET-AF          Warfarin        241       7133
## 19: Yamashita, 2012    Edoxaban_30_mg          0        131
## 20: Yamashita, 2012    Edoxaban_60_mg          0        131
## 21: Yamashita, 2012          Warfarin          0        129
##               study         treatment responders sampleSize
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
##  1:     Dabigatran 110 mg vs Apixaban 5 mg 1.17 (0.89, 1.54)
##  2:     Dabigatran 150 mg vs Apixaban 5 mg 0.84 (0.63, 1.13)
##  3:        Edoxaban 30 mg vs Apixaban 5 mg 0.99 (0.76, 1.31)
##  4:        Edoxaban 60 mg vs Apixaban 5 mg 1.40 (1.09, 1.81)
##  5:     Rivaroxaban 15 mg vs Apixaban 5 mg 0.61 (0.27, 1.28)
##  6:     Rivaroxaban 20 mg vs Apixaban 5 mg 0.99 (0.76, 1.29)
##  7:              Warfarin vs Apixaban 5 mg 1.28 (1.06, 1.54)
##  8:     Apixaban 5 mg vs Dabigatran 110 mg 0.86 (0.65, 1.13)
##  9: Dabigatran 150 mg vs Dabigatran 110 mg 0.72 (0.57, 0.91)
## 10:    Edoxaban 30 mg vs Dabigatran 110 mg 0.85 (0.64, 1.13)
## 11:    Edoxaban 60 mg vs Dabigatran 110 mg 1.20 (0.92, 1.57)
## 12: Rivaroxaban 15 mg vs Dabigatran 110 mg 0.52 (0.24, 1.11)
## 13: Rivaroxaban 20 mg vs Dabigatran 110 mg 0.85 (0.64, 1.12)
## 14:          Warfarin vs Dabigatran 110 mg 1.10 (0.90, 1.35)
## 15:     Apixaban 5 mg vs Dabigatran 150 mg 1.19 (0.89, 1.58)
## 16: Dabigatran 110 mg vs Dabigatran 150 mg 1.38 (1.10, 1.74)
## 17:    Edoxaban 30 mg vs Dabigatran 150 mg 1.18 (0.87, 1.59)
## 18:    Edoxaban 60 mg vs Dabigatran 150 mg 1.66 (1.24, 2.21)
## 19: Rivaroxaban 15 mg vs Dabigatran 150 mg 0.73 (0.33, 1.53)
## 20: Rivaroxaban 20 mg vs Dabigatran 150 mg 1.17 (0.87, 1.57)
## 21:          Warfarin vs Dabigatran 150 mg 1.52 (1.21, 1.90)
## 22:        Apixaban 5 mg vs Edoxaban 30 mg 1.01 (0.76, 1.31)
## 23:    Dabigatran 110 mg vs Edoxaban 30 mg 1.17 (0.89, 1.56)
## 24:    Dabigatran 150 mg vs Edoxaban 30 mg 0.85 (0.63, 1.14)
## 25:       Edoxaban 60 mg vs Edoxaban 30 mg 1.40 (1.15, 1.70)
## 26:    Rivaroxaban 15 mg vs Edoxaban 30 mg 0.62 (0.28, 1.29)
## 27:    Rivaroxaban 20 mg vs Edoxaban 30 mg 0.99 (0.75, 1.30)
## 28:             Warfarin vs Edoxaban 30 mg 1.29 (1.06, 1.57)
## 29:        Apixaban 5 mg vs Edoxaban 60 mg 0.72 (0.55, 0.92)
## 30:    Dabigatran 110 mg vs Edoxaban 60 mg 0.83 (0.64, 1.09)
## 31:    Dabigatran 150 mg vs Edoxaban 60 mg 0.60 (0.45, 0.81)
## 32:       Edoxaban 30 mg vs Edoxaban 60 mg 0.71 (0.59, 0.87)
## 33:    Rivaroxaban 15 mg vs Edoxaban 60 mg 0.44 (0.20, 0.91)
## 34:    Rivaroxaban 20 mg vs Edoxaban 60 mg 0.71 (0.54, 0.93)
## 35:             Warfarin vs Edoxaban 60 mg 0.91 (0.76, 1.10)
## 36:     Apixaban 5 mg vs Rivaroxaban 20 mg 1.01 (0.78, 1.31)
## 37: Dabigatran 110 mg vs Rivaroxaban 20 mg 1.18 (0.89, 1.56)
## 38: Dabigatran 150 mg vs Rivaroxaban 20 mg 0.85 (0.64, 1.15)
## 39:    Edoxaban 30 mg vs Rivaroxaban 20 mg 1.01 (0.77, 1.33)
## 40:    Edoxaban 60 mg vs Rivaroxaban 20 mg 1.41 (1.08, 1.84)
## 41: Rivaroxaban 15 mg vs Rivaroxaban 20 mg 0.62 (0.28, 1.30)
## 42:          Warfarin vs Rivaroxaban 20 mg 1.29 (1.07, 1.56)
## 43:              Apixaban 5 mg vs Warfarin 0.78 (0.65, 0.94)
## 44:          Dabigatran 110 mg vs Warfarin 0.91 (0.74, 1.11)
## 45:          Dabigatran 150 mg vs Warfarin 0.66 (0.53, 0.83)
## 46:             Edoxaban 30 mg vs Warfarin 0.78 (0.64, 0.95)
## 47:             Edoxaban 60 mg vs Warfarin 1.09 (0.91, 1.32)
## 48:          Rivaroxaban 15 mg vs Warfarin 0.48 (0.22, 0.98)
## 49:          Rivaroxaban 20 mg vs Warfarin 0.77 (0.64, 0.94)
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
##   15.46    0.00   15.51
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
## d.Warfarin.Apixaban_5_mg     -0.24627 0.09329 0.001043       0.001075
## d.Warfarin.Dabigatran_110_mg -0.09216 0.10462 0.001170       0.001295
## d.Warfarin.Dabigatran_150_mg -0.41663 0.11487 0.001284       0.001294
## d.Warfarin.Edoxaban_30_mg    -0.25049 0.10007 0.001119       0.001361
## d.Warfarin.Edoxaban_60_mg     0.08918 0.09239 0.001033       0.001043
## d.Warfarin.Rivaroxaban_15_mg -0.74261 0.38125 0.004262       0.004747
## d.Warfarin.Rivaroxaban_20_mg -0.25764 0.09736 0.001089       0.001154
## 
## 2. Quantiles for each variable:
## 
##                                  2.5%      25%      50%      75%    97.5%
## d.Warfarin.Apixaban_5_mg     -0.42946 -0.30989 -0.24594 -0.18644 -0.05938
## d.Warfarin.Dabigatran_110_mg -0.29662 -0.16271 -0.09140 -0.01874  0.10662
## d.Warfarin.Dabigatran_150_mg -0.64177 -0.49425 -0.41724 -0.34045 -0.19016
## d.Warfarin.Edoxaban_30_mg    -0.44861 -0.31841 -0.25185 -0.18166 -0.05469
## d.Warfarin.Edoxaban_60_mg    -0.09148  0.02531  0.08961  0.15176  0.27410
## d.Warfarin.Rivaroxaban_15_mg -1.50515 -0.99288 -0.73614 -0.48264 -0.02085
## d.Warfarin.Rivaroxaban_20_mg -0.44763 -0.32265 -0.25812 -0.19113 -0.06675
## 
## 
## $DIC
##     Dbar       pD      DIC 
## 17.65761 14.05613 31.71374 
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
##                  t1                t2  i2.pair  i2.cons incons.p
## 1     Apixaban_5_mg          Warfarin 98.58789 90.82001       NA
## 2 Dabigatran_110_mg Dabigatran_150_mg       NA       NA       NA
## 3 Dabigatran_110_mg          Warfarin       NA       NA       NA
## 4 Dabigatran_150_mg          Warfarin  0.00000  0.00000       NA
## 5    Edoxaban_30_mg    Edoxaban_60_mg  0.00000  0.00000       NA
## 6    Edoxaban_30_mg          Warfarin  0.00000  0.00000       NA
## 7    Edoxaban_60_mg          Warfarin  0.00000  0.00000       NA
## 8 Rivaroxaban_15_mg          Warfarin       NA       NA       NA
## 9 Rivaroxaban_20_mg          Warfarin  0.00000  0.00000       NA
## 
## Global I-squared:
## -------------------------
## 
##    i2.pair i2.cons
## 1 80.50312       0
```

```r
plot(anohe)
```

```
## Analysis of heterogeneity -- convergence plots
## Unrelated Study Effects (USE) model:
```

![](mtcStroke_files/figure-html/strokeAnohe-1.png) ![](mtcStroke_files/figure-html/strokeAnohe-2.png) ![](mtcStroke_files/figure-html/strokeAnohe-3.png) ![](mtcStroke_files/figure-html/strokeAnohe-4.png) 

```
## Unrelated Mean Effects (UME) model:
```

![](mtcStroke_files/figure-html/strokeAnohe-5.png) ![](mtcStroke_files/figure-html/strokeAnohe-6.png) ![](mtcStroke_files/figure-html/strokeAnohe-7.png) ![](mtcStroke_files/figure-html/strokeAnohe-8.png) 

```
## Consistency model:
```

![](mtcStroke_files/figure-html/strokeAnohe-9.png) ![](mtcStroke_files/figure-html/strokeAnohe-10.png) 
