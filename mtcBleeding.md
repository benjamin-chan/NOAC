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

`Run the model using fixed-effects.


```r
M <- mtc.model(network, type="consistency", linearModel=effect)
plot(M)
```

![](mtcBleeding_files/figure-html/bleedingNetwork-1.png) 

```r
results <- mtc.run(M, n.adapt=nAdapt, n.iter=nIter, thin=thin)
```

# Summary

Direct and indirect odds ratios and 95% confidence bounds are stored in
[mtcBleedingOddsRatios.csv](mtcBleedingOddsRatios.csv).


```r
or <- combineResults()
write.csv(or, file="mtcBleedingOddsRatios.csv", row.names=FALSE)
show(or)
```

```
##               treatment     Apixaban 5 mg Dabigatran 110 mg
## 1:     Apixaban 5 mg vs                NA 0.71 (0.55, 0.91)
## 2: Dabigatran 110 mg vs 1.41 (1.09, 1.81)                NA
## 3: Dabigatran 150 mg vs 1.64 (1.28, 2.11) 1.16 (1.00, 1.36)
## 4:    Edoxaban 30 mg vs 1.38 (1.09, 1.77) 0.98 (0.80, 1.20)
## 5:    Edoxaban 60 mg vs 0.82 (0.64, 1.06) 0.58 (0.47, 0.72)
## 6: Rivaroxaban 20 mg vs 1.80 (1.41, 2.32) 1.28 (1.04, 1.58)
## 7:          Warfarin vs 1.76 (1.44, 2.16) 1.25 (1.07, 1.46)
##    Dabigatran 150 mg    Edoxaban 30 mg    Edoxaban 60 mg Rivaroxaban 20 mg
## 1: 0.61 (0.47, 0.78) 0.72 (0.56, 0.92) 1.22 (0.95, 1.57) 0.55 (0.43, 0.71)
## 2: 0.86 (0.74, 1.00) 1.02 (0.83, 1.25) 1.72 (1.38, 2.14) 0.78 (0.63, 0.96)
## 3:                NA 1.19 (0.97, 1.45) 2.00 (1.62, 2.47) 0.91 (0.74, 1.11)
## 4: 0.84 (0.69, 1.03)                NA 1.68 (1.44, 1.98) 0.76 (0.63, 0.93)
## 5: 0.50 (0.40, 0.62) 0.59 (0.51, 0.69)                NA 0.45 (0.37, 0.56)
## 6: 1.10 (0.90, 1.36) 1.31 (1.08, 1.59) 2.21 (1.79, 2.73)                NA
## 7: 1.07 (0.92, 1.24) 1.27 (1.12, 1.45) 2.15 (1.84, 2.51) 0.97 (0.84, 1.12)
##             Warfarin
## 1: 0.57 (0.46, 0.69)
## 2: 0.80 (0.69, 0.93)
## 3: 0.93 (0.81, 1.08)
## 4: 0.78 (0.69, 0.89)
## 5: 0.47 (0.40, 0.54)
## 6: 1.03 (0.89, 1.18)
## 7:                NA
```

# Diagnostics


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
## d.Warfarin.Apixaban_5_mg     -0.56516 0.10278 0.0011491      0.0012046
## d.Warfarin.Dabigatran_110_mg -0.22164 0.07728 0.0008640      0.0010148
## d.Warfarin.Dabigatran_150_mg -0.06981 0.07470 0.0008351      0.0008632
## d.Warfarin.Edoxaban_30_mg    -0.24202 0.06811 0.0007615      0.0008471
## d.Warfarin.Edoxaban_60_mg    -0.76469 0.07915 0.0008850      0.0009147
## d.Warfarin.Rivaroxaban_20_mg  0.02647 0.07368 0.0008237      0.0008235
## 
## 2. Quantiles for each variable:
## 
##                                 2.5%      25%      50%      75%    97.5%
## d.Warfarin.Apixaban_5_mg     -0.7701 -0.63476 -0.56369 -0.49606 -0.36789
## d.Warfarin.Dabigatran_110_mg -0.3767 -0.27350 -0.22111 -0.16923 -0.06794
## d.Warfarin.Dabigatran_150_mg -0.2139 -0.12167 -0.06972 -0.01968  0.07869
## d.Warfarin.Edoxaban_30_mg    -0.3749 -0.28718 -0.24242 -0.19533 -0.11156
## d.Warfarin.Edoxaban_60_mg    -0.9218 -0.81765 -0.76441 -0.71158 -0.60999
## d.Warfarin.Rivaroxaban_20_mg -0.1169 -0.02308  0.02559  0.07620  0.16968
## 
## 
## $DIC
##     Dbar       pD      DIC 
## 10.06002 10.05879 20.11881 
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
