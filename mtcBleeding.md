# NOAC network meta-analysis: Bleeding
Benjamin Chan  
`r Sys.time()`  


Clean up the data (do not show the code).


```
##               study         treatment responders sampleSize
##  1:       ARISTOTLE     Apixaban_5_mg        148       9120
##  2:       ARISTOTLE          Warfarin        256       9081
##  3:     ARISTOTLE-J     Apixaban_5_mg          0         72
##  4:     ARISTOTLE-J          Warfarin          1         75
##  5:  ENGAGE AF-TIMI    Edoxaban_30_mg        418       7034
##  6:  ENGAGE AF-TIMI    Edoxaban_60_mg        254       7035
##  7:  ENGAGE AF-TIMI          Warfarin        524       7036
##  8:        J-ROCKET Rivaroxaban_15_mg         NA        639
##  9:        J-ROCKET          Warfarin         NA        639
## 10:           PETRO Dabigatran_150_mg          4        166
## 11:           PETRO          Warfarin          0         70
## 12:           RE-LY Dabigatran_110_mg        322       6015
## 13:           RE-LY Dabigatran_150_mg        375       6076
## 14:           RE-LY          Warfarin        397       6022
## 15:       ROCKET-AF Rivaroxaban_20_mg        395       7131
## 16:       ROCKET-AF          Warfarin        386       7133
## 17: Yamashita, 2012    Edoxaban_30_mg          0        131
## 18: Yamashita, 2012    Edoxaban_60_mg          2        131
## 19: Yamashita, 2012          Warfarin          0        129
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
##  1:     Dabigatran 110 mg vs Apixaban 5 mg 1.42 (1.10, 1.85)
##  2:     Dabigatran 150 mg vs Apixaban 5 mg 1.66 (1.29, 2.14)
##  3:        Edoxaban 30 mg vs Apixaban 5 mg 1.39 (1.09, 1.77)
##  4:        Edoxaban 60 mg vs Apixaban 5 mg 0.83 (0.64, 1.07)
##  5:     Rivaroxaban 20 mg vs Apixaban 5 mg 1.81 (1.41, 2.32)
##  6:              Warfarin vs Apixaban 5 mg 1.77 (1.44, 2.18)
##  7:     Apixaban 5 mg vs Dabigatran 110 mg 0.71 (0.54, 0.91)
##  8: Dabigatran 150 mg vs Dabigatran 110 mg 1.17 (1.00, 1.36)
##  9:    Edoxaban 30 mg vs Dabigatran 110 mg 0.98 (0.80, 1.20)
## 10:    Edoxaban 60 mg vs Dabigatran 110 mg 0.58 (0.47, 0.73)
## 11: Rivaroxaban 20 mg vs Dabigatran 110 mg 1.28 (1.03, 1.57)
## 12:          Warfarin vs Dabigatran 110 mg 1.24 (1.07, 1.45)
## 13:     Apixaban 5 mg vs Dabigatran 150 mg 0.60 (0.47, 0.77)
## 14: Dabigatran 110 mg vs Dabigatran 150 mg 0.86 (0.74, 1.00)
## 15:    Edoxaban 30 mg vs Dabigatran 150 mg 0.84 (0.69, 1.02)
## 16:    Edoxaban 60 mg vs Dabigatran 150 mg 0.50 (0.40, 0.62)
## 17: Rivaroxaban 20 mg vs Dabigatran 150 mg 1.09 (0.89, 1.34)
## 18:          Warfarin vs Dabigatran 150 mg 1.06 (0.92, 1.23)
## 19:        Apixaban 5 mg vs Edoxaban 30 mg 0.72 (0.57, 0.92)
## 20:    Dabigatran 110 mg vs Edoxaban 30 mg 1.02 (0.84, 1.25)
## 21:    Dabigatran 150 mg vs Edoxaban 30 mg 1.20 (0.98, 1.46)
## 22:       Edoxaban 60 mg vs Edoxaban 30 mg 0.60 (0.51, 0.70)
## 23:    Rivaroxaban 20 mg vs Edoxaban 30 mg 1.31 (1.08, 1.58)
## 24:             Warfarin vs Edoxaban 30 mg 1.27 (1.11, 1.45)
## 25:        Apixaban 5 mg vs Edoxaban 60 mg 1.21 (0.94, 1.56)
## 26:    Dabigatran 110 mg vs Edoxaban 60 mg 1.71 (1.38, 2.12)
## 27:    Dabigatran 150 mg vs Edoxaban 60 mg 2.00 (1.62, 2.48)
## 28:       Edoxaban 30 mg vs Edoxaban 60 mg 1.67 (1.42, 1.97)
## 29:    Rivaroxaban 20 mg vs Edoxaban 60 mg 2.18 (1.77, 2.70)
## 30:             Warfarin vs Edoxaban 60 mg 2.13 (1.83, 2.50)
## 31:     Apixaban 5 mg vs Rivaroxaban 20 mg 0.55 (0.43, 0.71)
## 32: Dabigatran 110 mg vs Rivaroxaban 20 mg 0.78 (0.64, 0.97)
## 33: Dabigatran 150 mg vs Rivaroxaban 20 mg 0.92 (0.75, 1.12)
## 34:    Edoxaban 30 mg vs Rivaroxaban 20 mg 0.77 (0.63, 0.93)
## 35:    Edoxaban 60 mg vs Rivaroxaban 20 mg 0.46 (0.37, 0.57)
## 36:          Warfarin vs Rivaroxaban 20 mg 0.98 (0.84, 1.13)
## 37:              Apixaban 5 mg vs Warfarin 0.57 (0.46, 0.69)
## 38:          Dabigatran 110 mg vs Warfarin 0.80 (0.69, 0.94)
## 39:          Dabigatran 150 mg vs Warfarin 0.94 (0.81, 1.09)
## 40:             Edoxaban 30 mg vs Warfarin 0.79 (0.69, 0.90)
## 41:             Edoxaban 60 mg vs Warfarin 0.47 (0.40, 0.55)
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
##   12.98    0.00   13.15
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
## d.Warfarin.Apixaban_5_mg     -0.56913 0.10495 0.0011733      0.0012856
## d.Warfarin.Dabigatran_110_mg -0.21837 0.07797 0.0008717      0.0009856
## d.Warfarin.Dabigatran_150_mg -0.06267 0.07425 0.0008302      0.0008668
## d.Warfarin.Edoxaban_30_mg    -0.24096 0.06751 0.0007548      0.0008321
## d.Warfarin.Edoxaban_60_mg    -0.75650 0.07872 0.0008801      0.0008801
## d.Warfarin.Rivaroxaban_20_mg  0.02477 0.07371 0.0008241      0.0009231
## 
## 2. Quantiles for each variable:
## 
##                                 2.5%      25%      50%      75%    97.5%
## d.Warfarin.Apixaban_5_mg     -0.7791 -0.63956 -0.56846 -0.49844 -0.36390
## d.Warfarin.Dabigatran_110_mg -0.3701 -0.27132 -0.21845 -0.16599 -0.06635
## d.Warfarin.Dabigatran_150_mg -0.2070 -0.11232 -0.06287 -0.01340  0.08429
## d.Warfarin.Edoxaban_30_mg    -0.3723 -0.28657 -0.24106 -0.19496 -0.10846
## d.Warfarin.Edoxaban_60_mg    -0.9152 -0.80931 -0.75590 -0.70119 -0.60656
## d.Warfarin.Rivaroxaban_20_mg -0.1188 -0.02431  0.02499  0.07292  0.16960
## 
## 
## $DIC
##     Dbar       pD      DIC 
## 23.40054 13.23636 36.63690 
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
##                  t1                t2  i2.pair  i2.cons incons.p
## 1     Apixaban_5_mg          Warfarin 99.92104 82.10961       NA
## 2 Dabigatran_110_mg Dabigatran_150_mg       NA       NA       NA
## 3 Dabigatran_110_mg          Warfarin       NA       NA       NA
## 4 Dabigatran_150_mg          Warfarin 99.95422 96.89515       NA
## 5    Edoxaban_30_mg    Edoxaban_60_mg 99.87522 97.30448       NA
## 6    Edoxaban_30_mg          Warfarin 99.48724  0.00000       NA
## 7    Edoxaban_60_mg          Warfarin 99.73692 97.80610       NA
## 8 Rivaroxaban_20_mg          Warfarin       NA       NA       NA
## 
## Global I-squared:
## -------------------------
## 
##    i2.pair  i2.cons
## 1 99.75142 90.87921
```

```r
plot(anohe)
```

```
## Analysis of heterogeneity -- convergence plots
## Unrelated Study Effects (USE) model:
```

![](mtcBleeding_files/figure-html/bleedingAnohe-1.png) ![](mtcBleeding_files/figure-html/bleedingAnohe-2.png) ![](mtcBleeding_files/figure-html/bleedingAnohe-3.png) ![](mtcBleeding_files/figure-html/bleedingAnohe-4.png) 

```
## Unrelated Mean Effects (UME) model:
```

![](mtcBleeding_files/figure-html/bleedingAnohe-5.png) ![](mtcBleeding_files/figure-html/bleedingAnohe-6.png) ![](mtcBleeding_files/figure-html/bleedingAnohe-7.png) 

```
## Consistency model:
```

![](mtcBleeding_files/figure-html/bleedingAnohe-8.png) ![](mtcBleeding_files/figure-html/bleedingAnohe-9.png) 
