# NOAC network meta-analysis: Bleeding
Benjamin Chan  
`r Sys.time()`  


Clean up the data (do not show the code).


```
##              study         treatment responders sampleSize
##  1:          RE-LY Dabigatran_110_mg        322       6015
##  2:          RE-LY Dabigatran_150_mg        375       6076
##  3:          RE-LY          Warfarin        397       6022
##  4:      ARISTOTLE     Apixaban_5_mg        148       9120
##  5:      ARISTOTLE          Warfarin        256       9081
##  6:      ROCKET-AF Rivaroxaban_20_mg        395       7131
##  7:      ROCKET-AF          Warfarin        386       7133
##  8: ENGAGE AF-TIMI    Edoxaban_30_mg        418       7034
##  9: ENGAGE AF-TIMI    Edoxaban_60_mg        254       7035
## 10: ENGAGE AF-TIMI          Warfarin        524       7036
```

# Network plot


```r
plot(network)
```

![](mtcBleeding_files/figure-html/bleedingNetwork-1.png) 

Run the model using fixed-effects.


```r
M <- mtc.model(network, type="consistency", linearModel=effect)
runtime <- system.time(results <- mtc.run(M, n.adapt=nAdapt, n.iter=nIter, thin=thin))
```

# Summary

Head-to-head odds ratios and 95% confidence bounds are stored in
[mtcBleedingHTH.csv](mtcBleedingHTH.csv).


```r
hth <- combineResults()
hth[, .(label, result)]
```

```
##                                      label            result
##  1:     Dabigatran 110 mg vs Apixaban 5 mg 1.41 (1.09, 1.82)
##  2:     Dabigatran 150 mg vs Apixaban 5 mg 1.64 (1.28, 2.11)
##  3:        Edoxaban 30 mg vs Apixaban 5 mg 1.38 (1.08, 1.76)
##  4:        Edoxaban 60 mg vs Apixaban 5 mg 0.82 (0.64, 1.05)
##  5:     Rivaroxaban 20 mg vs Apixaban 5 mg 1.81 (1.41, 2.31)
##  6:              Warfarin vs Apixaban 5 mg 1.76 (1.44, 2.15)
##  7:     Apixaban 5 mg vs Dabigatran 110 mg 0.71 (0.55, 0.92)
##  8: Dabigatran 150 mg vs Dabigatran 110 mg 1.16 (1.00, 1.36)
##  9:    Edoxaban 30 mg vs Dabigatran 110 mg 0.98 (0.80, 1.20)
## 10:    Edoxaban 60 mg vs Dabigatran 110 mg 0.58 (0.47, 0.72)
## 11: Rivaroxaban 20 mg vs Dabigatran 110 mg 1.28 (1.04, 1.58)
## 12:          Warfarin vs Dabigatran 110 mg 1.25 (1.07, 1.45)
## 13:     Apixaban 5 mg vs Dabigatran 150 mg 0.61 (0.47, 0.78)
## 14: Dabigatran 110 mg vs Dabigatran 150 mg 0.86 (0.74, 1.00)
## 15:    Edoxaban 30 mg vs Dabigatran 150 mg 0.84 (0.69, 1.02)
## 16:    Edoxaban 60 mg vs Dabigatran 150 mg 0.50 (0.40, 0.62)
## 17: Rivaroxaban 20 mg vs Dabigatran 150 mg 1.10 (0.90, 1.35)
## 18:          Warfarin vs Dabigatran 150 mg 1.07 (0.93, 1.24)
## 19:        Apixaban 5 mg vs Edoxaban 30 mg 0.73 (0.57, 0.92)
## 20:    Dabigatran 110 mg vs Edoxaban 30 mg 1.02 (0.83, 1.25)
## 21:    Dabigatran 150 mg vs Edoxaban 30 mg 1.19 (0.98, 1.44)
## 22:       Edoxaban 60 mg vs Edoxaban 30 mg 0.59 (0.51, 0.70)
## 23:    Rivaroxaban 20 mg vs Edoxaban 30 mg 1.31 (1.07, 1.59)
## 24:             Warfarin vs Edoxaban 30 mg 1.27 (1.12, 1.46)
## 25:        Apixaban 5 mg vs Edoxaban 60 mg 1.22 (0.95, 1.57)
## 26:    Dabigatran 110 mg vs Edoxaban 60 mg 1.72 (1.39, 2.13)
## 27:    Dabigatran 150 mg vs Edoxaban 60 mg 2.00 (1.63, 2.48)
## 28:       Edoxaban 30 mg vs Edoxaban 60 mg 1.69 (1.44, 1.98)
## 29:    Rivaroxaban 20 mg vs Edoxaban 60 mg 2.20 (1.78, 2.72)
## 30:             Warfarin vs Edoxaban 60 mg 2.15 (1.85, 2.50)
## 31:     Apixaban 5 mg vs Rivaroxaban 20 mg 0.55 (0.43, 0.71)
## 32: Dabigatran 110 mg vs Rivaroxaban 20 mg 0.78 (0.63, 0.96)
## 33: Dabigatran 150 mg vs Rivaroxaban 20 mg 0.91 (0.74, 1.11)
## 34:    Edoxaban 30 mg vs Rivaroxaban 20 mg 0.76 (0.63, 0.93)
## 35:    Edoxaban 60 mg vs Rivaroxaban 20 mg 0.45 (0.37, 0.56)
## 36:          Warfarin vs Rivaroxaban 20 mg 0.97 (0.84, 1.12)
## 37:              Apixaban 5 mg vs Warfarin 0.57 (0.46, 0.70)
## 38:          Dabigatran 110 mg vs Warfarin 0.80 (0.69, 0.93)
## 39:          Dabigatran 150 mg vs Warfarin 0.93 (0.80, 1.08)
## 40:             Edoxaban 30 mg vs Warfarin 0.79 (0.69, 0.89)
## 41:             Edoxaban 60 mg vs Warfarin 0.47 (0.40, 0.54)
## 42:          Rivaroxaban 20 mg vs Warfarin 1.03 (0.89, 1.18)
##                                      label            result
```

```r
write.csv(hth, file="mtcBleedingHTH.csv", row.names=FALSE)
```

# Diagnostics


```r
runtime
```

```
##    user  system elapsed 
##    8.96    0.00    9.08
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
## d.Warfarin.Apixaban_5_mg     -0.56429 0.10430 0.0011661      0.0012577
## d.Warfarin.Dabigatran_110_mg -0.22133 0.07770 0.0008687      0.0010063
## d.Warfarin.Dabigatran_150_mg -0.07199 0.07392 0.0008265      0.0008480
## d.Warfarin.Edoxaban_30_mg    -0.24257 0.06841 0.0007648      0.0008421
## d.Warfarin.Edoxaban_60_mg    -0.76450 0.07756 0.0008672      0.0008334
## d.Warfarin.Rivaroxaban_20_mg  0.02583 0.07319 0.0008183      0.0008087
## 
## 2. Quantiles for each variable:
## 
##                                 2.5%      25%      50%     75%    97.5%
## d.Warfarin.Apixaban_5_mg     -0.7673 -0.63421 -0.56335 -0.4926 -0.36315
## d.Warfarin.Dabigatran_110_mg -0.3748 -0.27315 -0.22057 -0.1699 -0.06838
## d.Warfarin.Dabigatran_150_mg -0.2171 -0.12214 -0.07084 -0.0214  0.07291
## d.Warfarin.Edoxaban_30_mg    -0.3770 -0.28910 -0.24156 -0.1973 -0.11110
## d.Warfarin.Edoxaban_60_mg    -0.9155 -0.81597 -0.76488 -0.7109 -0.61268
## d.Warfarin.Rivaroxaban_20_mg -0.1175 -0.02303  0.02684  0.0745  0.16895
## 
## 
## $DIC
##      Dbar        pD       DIC 
##  9.936114  9.933318 19.869432 
## 
## attr(,"class")
## [1] "summary.mtc.result"
```

Sampler diagnostics.


```r
gelman.plot(results)
```

![](mtcBleeding_files/figure-html/bleedingGelman-1.png) 

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

![](mtcBleeding_files/figure-html/bleedingTrace-1.png) ![](mtcBleeding_files/figure-html/bleedingTrace-2.png) 

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

![](mtcBleeding_files/figure-html/bleedingAnohe-1.png) ![](mtcBleeding_files/figure-html/bleedingAnohe-2.png) 

```
## Unrelated Mean Effects (UME) model:
```

![](mtcBleeding_files/figure-html/bleedingAnohe-3.png) ![](mtcBleeding_files/figure-html/bleedingAnohe-4.png) ![](mtcBleeding_files/figure-html/bleedingAnohe-5.png) 

```
## Consistency model:
```

![](mtcBleeding_files/figure-html/bleedingAnohe-6.png) ![](mtcBleeding_files/figure-html/bleedingAnohe-7.png) 
