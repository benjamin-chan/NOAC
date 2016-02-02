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
##  2:     Dabigatran 150 mg vs Apixaban 5 mg 0.84 (0.64, 1.13)
##  3:        Edoxaban 30 mg vs Apixaban 5 mg 1.00 (0.77, 1.30)
##  4:        Edoxaban 60 mg vs Apixaban 5 mg 1.40 (1.08, 1.81)
##  5:     Rivaroxaban 15 mg vs Apixaban 5 mg 0.61 (0.28, 1.30)
##  6:     Rivaroxaban 20 mg vs Apixaban 5 mg 0.99 (0.76, 1.28)
##  7:              Warfarin vs Apixaban 5 mg 1.28 (1.07, 1.53)
##  8:     Apixaban 5 mg vs Dabigatran 110 mg 0.86 (0.65, 1.13)
##  9: Dabigatran 150 mg vs Dabigatran 110 mg 0.72 (0.58, 0.90)
## 10:    Edoxaban 30 mg vs Dabigatran 110 mg 0.85 (0.64, 1.13)
## 11:    Edoxaban 60 mg vs Dabigatran 110 mg 1.20 (0.91, 1.57)
## 12: Rivaroxaban 15 mg vs Dabigatran 110 mg 0.53 (0.24, 1.13)
## 13: Rivaroxaban 20 mg vs Dabigatran 110 mg 0.85 (0.64, 1.11)
## 14:          Warfarin vs Dabigatran 110 mg 1.10 (0.89, 1.34)
## 15:     Apixaban 5 mg vs Dabigatran 150 mg 1.19 (0.88, 1.57)
## 16: Dabigatran 110 mg vs Dabigatran 150 mg 1.38 (1.11, 1.74)
## 17:    Edoxaban 30 mg vs Dabigatran 150 mg 1.18 (0.88, 1.59)
## 18:    Edoxaban 60 mg vs Dabigatran 150 mg 1.65 (1.25, 2.20)
## 19: Rivaroxaban 15 mg vs Dabigatran 150 mg 0.73 (0.33, 1.55)
## 20: Rivaroxaban 20 mg vs Dabigatran 150 mg 1.17 (0.88, 1.57)
## 21:          Warfarin vs Dabigatran 150 mg 1.51 (1.21, 1.89)
## 22:        Apixaban 5 mg vs Edoxaban 30 mg 1.00 (0.77, 1.31)
## 23:    Dabigatran 110 mg vs Edoxaban 30 mg 1.17 (0.89, 1.56)
## 24:    Dabigatran 150 mg vs Edoxaban 30 mg 0.85 (0.63, 1.14)
## 25:       Edoxaban 60 mg vs Edoxaban 30 mg 1.40 (1.15, 1.71)
## 26:    Rivaroxaban 15 mg vs Edoxaban 30 mg 0.62 (0.28, 1.30)
## 27:    Rivaroxaban 20 mg vs Edoxaban 30 mg 0.99 (0.75, 1.31)
## 28:             Warfarin vs Edoxaban 30 mg 1.28 (1.05, 1.56)
## 29:        Apixaban 5 mg vs Edoxaban 60 mg 0.72 (0.55, 0.92)
## 30:    Dabigatran 110 mg vs Edoxaban 60 mg 0.83 (0.64, 1.10)
## 31:    Dabigatran 150 mg vs Edoxaban 60 mg 0.61 (0.45, 0.80)
## 32:       Edoxaban 30 mg vs Edoxaban 60 mg 0.71 (0.59, 0.87)
## 33:    Rivaroxaban 15 mg vs Edoxaban 60 mg 0.44 (0.20, 0.93)
## 34:    Rivaroxaban 20 mg vs Edoxaban 60 mg 0.71 (0.54, 0.92)
## 35:             Warfarin vs Edoxaban 60 mg 0.91 (0.76, 1.09)
## 36:     Apixaban 5 mg vs Rivaroxaban 20 mg 1.01 (0.78, 1.32)
## 37: Dabigatran 110 mg vs Rivaroxaban 20 mg 1.18 (0.90, 1.56)
## 38: Dabigatran 150 mg vs Rivaroxaban 20 mg 0.86 (0.64, 1.14)
## 39:    Edoxaban 30 mg vs Rivaroxaban 20 mg 1.01 (0.77, 1.33)
## 40:    Edoxaban 60 mg vs Rivaroxaban 20 mg 1.41 (1.09, 1.84)
## 41: Rivaroxaban 15 mg vs Rivaroxaban 20 mg 0.62 (0.28, 1.32)
## 42:          Warfarin vs Rivaroxaban 20 mg 1.30 (1.07, 1.57)
## 43:              Apixaban 5 mg vs Warfarin 0.78 (0.65, 0.94)
## 44:          Dabigatran 110 mg vs Warfarin 0.91 (0.75, 1.12)
## 45:          Dabigatran 150 mg vs Warfarin 0.66 (0.53, 0.83)
## 46:             Edoxaban 30 mg vs Warfarin 0.78 (0.64, 0.95)
## 47:             Edoxaban 60 mg vs Warfarin 1.09 (0.91, 1.31)
## 48:          Rivaroxaban 15 mg vs Warfarin 0.48 (0.22, 0.99)
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
##   15.31    0.00   15.65
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
## d.Warfarin.Apixaban_5_mg     -0.24562 0.09268 0.001036       0.001099
## d.Warfarin.Dabigatran_110_mg -0.09043 0.10361 0.001158       0.001256
## d.Warfarin.Dabigatran_150_mg -0.41477 0.11308 0.001264       0.001264
## d.Warfarin.Edoxaban_30_mg    -0.24850 0.10046 0.001123       0.001345
## d.Warfarin.Edoxaban_60_mg     0.08950 0.09253 0.001034       0.001065
## d.Warfarin.Rivaroxaban_15_mg -0.74135 0.38381 0.004291       0.004616
## d.Warfarin.Rivaroxaban_20_mg -0.25858 0.09756 0.001091       0.001091
## 
## 2. Quantiles for each variable:
## 
##                                  2.5%      25%      50%     75%    97.5%
## d.Warfarin.Apixaban_5_mg     -0.42790 -0.30791 -0.24401 -0.1836 -0.06477
## d.Warfarin.Dabigatran_110_mg -0.29217 -0.16049 -0.09151 -0.0223  0.11360
## d.Warfarin.Dabigatran_150_mg -0.63499 -0.48984 -0.41444 -0.3393 -0.18919
## d.Warfarin.Edoxaban_30_mg    -0.44152 -0.31794 -0.24973 -0.1809 -0.05213
## d.Warfarin.Edoxaban_60_mg    -0.08949  0.02633  0.08956  0.1519  0.26980
## d.Warfarin.Rivaroxaban_15_mg -1.50072 -0.99411 -0.73283 -0.4821 -0.01034
## d.Warfarin.Rivaroxaban_20_mg -0.44860 -0.32588 -0.25924 -0.1921 -0.06616
## 
## 
## $DIC
##     Dbar       pD      DIC 
## 17.67500 14.06941 31.74442 
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
## 1     Apixaban_5_mg          Warfarin 98.87869 88.80718       NA
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
## 1 84.46022       0
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
