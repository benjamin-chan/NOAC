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


```r
hth <- combineResults()
hth[, .(label, result)]
```

```
##                                      label            result
##  1:     Dabigatran 110 mg vs Apixaban 5 mg 1.17 (0.89, 1.53)
##  2:     Dabigatran 150 mg vs Apixaban 5 mg 0.84 (0.62, 1.12)
##  3:        Edoxaban 30 mg vs Apixaban 5 mg 1.00 (0.76, 1.30)
##  4:        Edoxaban 60 mg vs Apixaban 5 mg 1.40 (1.08, 1.80)
##  5:     Rivaroxaban 15 mg vs Apixaban 5 mg 0.62 (0.28, 1.31)
##  6:     Rivaroxaban 20 mg vs Apixaban 5 mg 0.98 (0.75, 1.29)
##  7:              Warfarin vs Apixaban 5 mg 1.28 (1.06, 1.53)
##  8:     Apixaban 5 mg vs Dabigatran 110 mg 0.86 (0.65, 1.12)
##  9: Dabigatran 150 mg vs Dabigatran 110 mg 0.72 (0.57, 0.90)
## 10:    Edoxaban 30 mg vs Dabigatran 110 mg 0.85 (0.64, 1.14)
## 11:    Edoxaban 60 mg vs Dabigatran 110 mg 1.20 (0.91, 1.58)
## 12: Rivaroxaban 15 mg vs Dabigatran 110 mg 0.53 (0.23, 1.12)
## 13: Rivaroxaban 20 mg vs Dabigatran 110 mg 0.84 (0.64, 1.12)
## 14:          Warfarin vs Dabigatran 110 mg 1.09 (0.90, 1.34)
## 15:     Apixaban 5 mg vs Dabigatran 150 mg 1.19 (0.89, 1.60)
## 16: Dabigatran 110 mg vs Dabigatran 150 mg 1.39 (1.11, 1.74)
## 17:    Edoxaban 30 mg vs Dabigatran 150 mg 1.18 (0.88, 1.60)
## 18:    Edoxaban 60 mg vs Dabigatran 150 mg 1.66 (1.26, 2.21)
## 19: Rivaroxaban 15 mg vs Dabigatran 150 mg 0.73 (0.32, 1.57)
## 20: Rivaroxaban 20 mg vs Dabigatran 150 mg 1.17 (0.87, 1.57)
## 21:          Warfarin vs Dabigatran 150 mg 1.52 (1.22, 1.90)
## 22:        Apixaban 5 mg vs Edoxaban 30 mg 1.00 (0.77, 1.32)
## 23:    Dabigatran 110 mg vs Edoxaban 30 mg 1.17 (0.88, 1.56)
## 24:    Dabigatran 150 mg vs Edoxaban 30 mg 0.85 (0.62, 1.13)
## 25:       Edoxaban 60 mg vs Edoxaban 30 mg 1.40 (1.15, 1.71)
## 26:    Rivaroxaban 15 mg vs Edoxaban 30 mg 0.62 (0.27, 1.30)
## 27:    Rivaroxaban 20 mg vs Edoxaban 30 mg 0.99 (0.74, 1.31)
## 28:             Warfarin vs Edoxaban 30 mg 1.28 (1.05, 1.57)
## 29:        Apixaban 5 mg vs Edoxaban 60 mg 0.72 (0.56, 0.92)
## 30:    Dabigatran 110 mg vs Edoxaban 60 mg 0.84 (0.63, 1.10)
## 31:    Dabigatran 150 mg vs Edoxaban 60 mg 0.60 (0.45, 0.80)
## 32:       Edoxaban 30 mg vs Edoxaban 60 mg 0.71 (0.59, 0.87)
## 33:    Rivaroxaban 15 mg vs Edoxaban 60 mg 0.44 (0.20, 0.93)
## 34:    Rivaroxaban 20 mg vs Edoxaban 60 mg 0.71 (0.54, 0.92)
## 35:             Warfarin vs Edoxaban 60 mg 0.92 (0.76, 1.09)
## 36:     Apixaban 5 mg vs Rivaroxaban 20 mg 1.02 (0.77, 1.33)
## 37: Dabigatran 110 mg vs Rivaroxaban 20 mg 1.19 (0.89, 1.57)
## 38: Dabigatran 150 mg vs Rivaroxaban 20 mg 0.85 (0.64, 1.15)
## 39:    Edoxaban 30 mg vs Rivaroxaban 20 mg 1.01 (0.77, 1.34)
## 40:    Edoxaban 60 mg vs Rivaroxaban 20 mg 1.42 (1.09, 1.86)
## 41: Rivaroxaban 15 mg vs Rivaroxaban 20 mg 0.63 (0.28, 1.32)
## 42:          Warfarin vs Rivaroxaban 20 mg 1.30 (1.07, 1.57)
## 43:              Apixaban 5 mg vs Warfarin 0.78 (0.65, 0.94)
## 44:          Dabigatran 110 mg vs Warfarin 0.91 (0.74, 1.11)
## 45:          Dabigatran 150 mg vs Warfarin 0.66 (0.53, 0.82)
## 46:             Edoxaban 30 mg vs Warfarin 0.78 (0.64, 0.95)
## 47:             Edoxaban 60 mg vs Warfarin 1.09 (0.91, 1.31)
## 48:          Rivaroxaban 15 mg vs Warfarin 0.48 (0.22, 0.99)
## 49:          Rivaroxaban 20 mg vs Warfarin 0.77 (0.64, 0.93)
##                                      label            result
```

```r
write.csv(hth, file="mtcStrokeHTH.csv")
```

# Diagnostics


```r
runtime
```

```
##    user  system elapsed 
##   15.35    0.01   15.50
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
## d.Warfarin.Apixaban_5_mg     -0.24528 0.09335 0.001044       0.001131
## d.Warfarin.Dabigatran_110_mg -0.09085 0.10403 0.001163       0.001271
## d.Warfarin.Dabigatran_150_mg -0.41820 0.11359 0.001270       0.001327
## d.Warfarin.Edoxaban_30_mg    -0.25004 0.10199 0.001140       0.001331
## d.Warfarin.Edoxaban_60_mg     0.08835 0.09178 0.001026       0.001085
## d.Warfarin.Rivaroxaban_15_mg -0.73850 0.38330 0.004285       0.004913
## d.Warfarin.Rivaroxaban_20_mg -0.26124 0.09875 0.001104       0.001191
## 
## 2. Quantiles for each variable:
## 
##                                  2.5%      25%      50%      75%     97.5%
## d.Warfarin.Apixaban_5_mg     -0.42794 -0.30877 -0.24493 -0.18202 -0.061427
## d.Warfarin.Dabigatran_110_mg -0.29498 -0.16086 -0.09037 -0.01992  0.108833
## d.Warfarin.Dabigatran_150_mg -0.64350 -0.49448 -0.41917 -0.34189 -0.196078
## d.Warfarin.Edoxaban_30_mg    -0.45124 -0.31764 -0.25025 -0.18074 -0.051825
## d.Warfarin.Edoxaban_60_mg    -0.08889  0.02558  0.08820  0.15051  0.268784
## d.Warfarin.Rivaroxaban_15_mg -1.51086 -0.99063 -0.73010 -0.47599 -0.006907
## d.Warfarin.Rivaroxaban_20_mg -0.45413 -0.32723 -0.26154 -0.19359 -0.072161
## 
## 
## $DIC
##     Dbar       pD      DIC 
## 17.84336 14.24002 32.08338 
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
## 1     Apixaban_5_mg          Warfarin 98.54297 89.78434       NA
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
## 1 79.87272       0
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
