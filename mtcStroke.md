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
##  2:     Dabigatran 150 mg vs Apixaban 5 mg 0.84 (0.63, 1.12)
##  3:        Edoxaban 30 mg vs Apixaban 5 mg 1.00 (0.76, 1.30)
##  4:        Edoxaban 60 mg vs Apixaban 5 mg 1.39 (1.08, 1.80)
##  5:     Rivaroxaban 15 mg vs Apixaban 5 mg 0.62 (0.28, 1.28)
##  6:     Rivaroxaban 20 mg vs Apixaban 5 mg 0.99 (0.76, 1.28)
##  7:              Warfarin vs Apixaban 5 mg 1.28 (1.07, 1.54)
##  8:     Apixaban 5 mg vs Dabigatran 110 mg 0.86 (0.65, 1.12)
##  9: Dabigatran 150 mg vs Dabigatran 110 mg 0.72 (0.57, 0.90)
## 10:    Edoxaban 30 mg vs Dabigatran 110 mg 0.85 (0.64, 1.13)
## 11:    Edoxaban 60 mg vs Dabigatran 110 mg 1.20 (0.91, 1.57)
## 12: Rivaroxaban 15 mg vs Dabigatran 110 mg 0.53 (0.24, 1.11)
## 13: Rivaroxaban 20 mg vs Dabigatran 110 mg 0.85 (0.64, 1.12)
## 14:          Warfarin vs Dabigatran 110 mg 1.09 (0.89, 1.35)
## 15:     Apixaban 5 mg vs Dabigatran 150 mg 1.19 (0.89, 1.58)
## 16: Dabigatran 110 mg vs Dabigatran 150 mg 1.39 (1.11, 1.75)
## 17:    Edoxaban 30 mg vs Dabigatran 150 mg 1.18 (0.88, 1.59)
## 18:    Edoxaban 60 mg vs Dabigatran 150 mg 1.66 (1.25, 2.20)
## 19: Rivaroxaban 15 mg vs Dabigatran 150 mg 0.73 (0.33, 1.54)
## 20: Rivaroxaban 20 mg vs Dabigatran 150 mg 1.18 (0.88, 1.57)
## 21:          Warfarin vs Dabigatran 150 mg 1.52 (1.22, 1.91)
## 22:        Apixaban 5 mg vs Edoxaban 30 mg 1.00 (0.77, 1.31)
## 23:    Dabigatran 110 mg vs Edoxaban 30 mg 1.17 (0.88, 1.56)
## 24:    Dabigatran 150 mg vs Edoxaban 30 mg 0.85 (0.63, 1.13)
## 25:       Edoxaban 60 mg vs Edoxaban 30 mg 1.40 (1.16, 1.70)
## 26:    Rivaroxaban 15 mg vs Edoxaban 30 mg 0.62 (0.28, 1.30)
## 27:    Rivaroxaban 20 mg vs Edoxaban 30 mg 0.99 (0.76, 1.31)
## 28:             Warfarin vs Edoxaban 30 mg 1.29 (1.05, 1.56)
## 29:        Apixaban 5 mg vs Edoxaban 60 mg 0.72 (0.55, 0.93)
## 30:    Dabigatran 110 mg vs Edoxaban 60 mg 0.83 (0.64, 1.10)
## 31:    Dabigatran 150 mg vs Edoxaban 60 mg 0.60 (0.45, 0.80)
## 32:       Edoxaban 30 mg vs Edoxaban 60 mg 0.71 (0.59, 0.87)
## 33:    Rivaroxaban 15 mg vs Edoxaban 60 mg 0.44 (0.20, 0.92)
## 34:    Rivaroxaban 20 mg vs Edoxaban 60 mg 0.71 (0.54, 0.92)
## 35:             Warfarin vs Edoxaban 60 mg 0.92 (0.76, 1.10)
## 36:     Apixaban 5 mg vs Rivaroxaban 15 mg 1.62 (0.78, 3.58)
## 37: Dabigatran 110 mg vs Rivaroxaban 15 mg 1.89 (0.90, 4.22)
## 38: Dabigatran 150 mg vs Rivaroxaban 15 mg 1.36 (0.65, 3.05)
## 39:    Edoxaban 30 mg vs Rivaroxaban 15 mg 1.61 (0.77, 3.58)
## 40:    Edoxaban 60 mg vs Rivaroxaban 15 mg 2.26 (1.08, 4.96)
## 41: Rivaroxaban 20 mg vs Rivaroxaban 15 mg 1.60 (0.78, 3.56)
## 42:          Warfarin vs Rivaroxaban 15 mg 2.06 (1.01, 4.50)
## 43:     Apixaban 5 mg vs Rivaroxaban 20 mg 1.01 (0.78, 1.31)
## 44: Dabigatran 110 mg vs Rivaroxaban 20 mg 1.18 (0.89, 1.56)
## 45: Dabigatran 150 mg vs Rivaroxaban 20 mg 0.85 (0.64, 1.14)
## 46:    Edoxaban 30 mg vs Rivaroxaban 20 mg 1.01 (0.76, 1.32)
## 47:    Edoxaban 60 mg vs Rivaroxaban 20 mg 1.41 (1.08, 1.85)
## 48: Rivaroxaban 15 mg vs Rivaroxaban 20 mg 0.62 (0.28, 1.29)
## 49:          Warfarin vs Rivaroxaban 20 mg 1.29 (1.07, 1.57)
## 50:              Apixaban 5 mg vs Warfarin 0.78 (0.65, 0.94)
## 51:          Dabigatran 110 mg vs Warfarin 0.91 (0.74, 1.12)
## 52:          Dabigatran 150 mg vs Warfarin 0.66 (0.52, 0.82)
## 53:             Edoxaban 30 mg vs Warfarin 0.78 (0.64, 0.95)
## 54:             Edoxaban 60 mg vs Warfarin 1.09 (0.91, 1.31)
## 55:          Rivaroxaban 15 mg vs Warfarin 0.48 (0.22, 0.99)
## 56:          Rivaroxaban 20 mg vs Warfarin 0.77 (0.64, 0.93)
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
##   15.35    0.00   15.52
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
##                                 Mean      SD Naive SE Time-series SE
## d.Warfarin.Apixaban_5_mg     -0.2454 0.09276 0.001037       0.001084
## d.Warfarin.Dabigatran_110_mg -0.0906 0.10515 0.001176       0.001302
## d.Warfarin.Dabigatran_150_mg -0.4176 0.11344 0.001268       0.001277
## d.Warfarin.Edoxaban_30_mg    -0.2501 0.09944 0.001112       0.001359
## d.Warfarin.Edoxaban_60_mg     0.0883 0.09238 0.001033       0.001036
## d.Warfarin.Rivaroxaban_15_mg -0.7348 0.37985 0.004247       0.004580
## d.Warfarin.Rivaroxaban_20_mg -0.2576 0.09795 0.001095       0.001169
## 
## 2. Quantiles for each variable:
## 
##                                 2.5%      25%      50%     75%    97.5%
## d.Warfarin.Apixaban_5_mg     -0.4296 -0.30799 -0.24510 -0.1812 -0.06357
## d.Warfarin.Dabigatran_110_mg -0.3006 -0.16212 -0.08960 -0.0207  0.11671
## d.Warfarin.Dabigatran_150_mg -0.6446 -0.49524 -0.41567 -0.3408 -0.19486
## d.Warfarin.Edoxaban_30_mg    -0.4423 -0.31647 -0.25139 -0.1823 -0.05137
## d.Warfarin.Edoxaban_60_mg    -0.0914  0.02593  0.08695  0.1522  0.26842
## d.Warfarin.Rivaroxaban_15_mg -1.5032 -0.98156 -0.72396 -0.4777 -0.01026
## d.Warfarin.Rivaroxaban_20_mg -0.4518 -0.32362 -0.25822 -0.1914 -0.06814
## 
## 
## $DIC
##     Dbar       pD      DIC 
## 17.66312 14.05946 31.72258 
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
## 1     Apixaban_5_mg          Warfarin 98.76069 86.43908       NA
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
## 1 82.84795       0
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
