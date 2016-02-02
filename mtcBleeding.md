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


```r
pairwiseComparisons <- combineResults()
pairwiseComparisons[, .(label, result)]
```

```
##                                      label            result
##  1:     Dabigatran 110 mg vs Apixaban 5 mg 1.41 (1.09, 1.82)
##  2:     Dabigatran 150 mg vs Apixaban 5 mg 1.64 (1.28, 2.11)
##  3:        Edoxaban 30 mg vs Apixaban 5 mg 1.38 (1.08, 1.77)
##  4:        Edoxaban 60 mg vs Apixaban 5 mg 0.82 (0.64, 1.07)
##  5:     Rivaroxaban 20 mg vs Apixaban 5 mg 1.80 (1.41, 2.34)
##  6:              Warfarin vs Apixaban 5 mg 1.76 (1.44, 2.17)
##  7:     Apixaban 5 mg vs Dabigatran 110 mg 0.71 (0.55, 0.92)
##  8: Dabigatran 150 mg vs Dabigatran 110 mg 1.16 (1.00, 1.36)
##  9:    Edoxaban 30 mg vs Dabigatran 110 mg 0.98 (0.80, 1.20)
## 10:    Edoxaban 60 mg vs Dabigatran 110 mg 0.58 (0.47, 0.72)
## 11: Rivaroxaban 20 mg vs Dabigatran 110 mg 1.28 (1.04, 1.58)
## 12:          Warfarin vs Dabigatran 110 mg 1.25 (1.07, 1.45)
## 13:     Apixaban 5 mg vs Dabigatran 150 mg 0.61 (0.47, 0.78)
## 14: Dabigatran 110 mg vs Dabigatran 150 mg 0.86 (0.74, 1.00)
## 15:    Edoxaban 30 mg vs Dabigatran 150 mg 0.84 (0.69, 1.03)
## 16:    Edoxaban 60 mg vs Dabigatran 150 mg 0.50 (0.41, 0.62)
## 17: Rivaroxaban 20 mg vs Dabigatran 150 mg 1.10 (0.90, 1.36)
## 18:          Warfarin vs Dabigatran 150 mg 1.07 (0.93, 1.24)
## 19:        Apixaban 5 mg vs Edoxaban 30 mg 0.73 (0.57, 0.93)
## 20:    Dabigatran 110 mg vs Edoxaban 30 mg 1.02 (0.83, 1.25)
## 21:    Dabigatran 150 mg vs Edoxaban 30 mg 1.19 (0.98, 1.44)
## 22:       Edoxaban 60 mg vs Edoxaban 30 mg 0.59 (0.51, 0.70)
## 23:    Rivaroxaban 20 mg vs Edoxaban 30 mg 1.31 (1.07, 1.60)
## 24:             Warfarin vs Edoxaban 30 mg 1.28 (1.12, 1.45)
## 25:        Apixaban 5 mg vs Edoxaban 60 mg 1.22 (0.94, 1.57)
## 26:    Dabigatran 110 mg vs Edoxaban 60 mg 1.72 (1.39, 2.13)
## 27:    Dabigatran 150 mg vs Edoxaban 60 mg 2.00 (1.62, 2.47)
## 28:       Edoxaban 30 mg vs Edoxaban 60 mg 1.69 (1.44, 1.97)
## 29:    Rivaroxaban 20 mg vs Edoxaban 60 mg 2.21 (1.79, 2.73)
## 30:             Warfarin vs Edoxaban 60 mg 2.15 (1.84, 2.50)
## 31:     Apixaban 5 mg vs Rivaroxaban 20 mg 0.55 (0.43, 0.71)
## 32: Dabigatran 110 mg vs Rivaroxaban 20 mg 0.78 (0.63, 0.96)
## 33: Dabigatran 150 mg vs Rivaroxaban 20 mg 0.91 (0.74, 1.11)
## 34:    Edoxaban 30 mg vs Rivaroxaban 20 mg 0.77 (0.63, 0.93)
## 35:    Edoxaban 60 mg vs Rivaroxaban 20 mg 0.45 (0.37, 0.56)
## 36:          Warfarin vs Rivaroxaban 20 mg 0.98 (0.84, 1.13)
## 37:              Apixaban 5 mg vs Warfarin 0.57 (0.46, 0.70)
## 38:          Dabigatran 110 mg vs Warfarin 0.80 (0.69, 0.93)
## 39:          Dabigatran 150 mg vs Warfarin 0.93 (0.81, 1.08)
## 40:             Edoxaban 30 mg vs Warfarin 0.78 (0.69, 0.90)
## 41:             Edoxaban 60 mg vs Warfarin 0.46 (0.40, 0.54)
## 42:          Rivaroxaban 20 mg vs Warfarin 1.02 (0.89, 1.19)
##                                      label            result
```

```r
write.csv(pairwiseComparisons, file="mtcBleedingPairwiseComparisons.csv")
```

# Diagnostics


```r
runtime
```

```
##    user  system elapsed 
##    7.47    0.00    7.53
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
## d.Warfarin.Apixaban_5_mg     -0.56546 0.10509 0.0011750      0.0012470
## d.Warfarin.Dabigatran_110_mg -0.22332 0.07774 0.0008691      0.0010844
## d.Warfarin.Dabigatran_150_mg -0.07136 0.07454 0.0008334      0.0008475
## d.Warfarin.Edoxaban_30_mg    -0.24318 0.06759 0.0007556      0.0008316
## d.Warfarin.Edoxaban_60_mg    -0.76554 0.07835 0.0008760      0.0009075
## d.Warfarin.Rivaroxaban_20_mg  0.02559 0.07413 0.0008288      0.0008725
## 
## 2. Quantiles for each variable:
## 
##                                 2.5%      25%      50%      75%    97.5%
## d.Warfarin.Apixaban_5_mg     -0.7767 -0.63541 -0.56452 -0.49371 -0.36207
## d.Warfarin.Dabigatran_110_mg -0.3735 -0.27589 -0.22397 -0.17127 -0.07052
## d.Warfarin.Dabigatran_150_mg -0.2156 -0.12179 -0.07030 -0.02192  0.07654
## d.Warfarin.Edoxaban_30_mg    -0.3736 -0.28846 -0.24409 -0.19724 -0.11078
## d.Warfarin.Edoxaban_60_mg    -0.9168 -0.81706 -0.76685 -0.71376 -0.61068
## d.Warfarin.Rivaroxaban_20_mg -0.1201 -0.02395  0.02418  0.07515  0.17263
## 
## 
## $DIC
##     Dbar       pD      DIC 
## 10.02660 10.02513 20.05174 
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
