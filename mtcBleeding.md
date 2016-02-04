# NOAC network meta-analysis: Bleeding
Benjamin Chan  
`r Sys.time()`  

[Back](README.md) to main page.

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

`Run the model using fixed-effects.


```r
M <- mtc.model(network, type="consistency", linearModel=effect)
plot(M)
```

![](mtcBleeding_files/figure-html/network-1.png) 

```r
results <- mtc.run(M, n.adapt=nAdapt, n.iter=nIter, thin=thin)
```

# Summary

Direct and indirect odds ratios and 95% confidence bounds are stored in
[mtcBleedingOddsRatios.csv](mtcBleedingOddsRatios.csv).


```r
or <- combineResults(outcomeBleeding=TRUE)
write.csv(or, file="mtcBleedingOddsRatios.csv", row.names=FALSE)
show(or)
```

```
##               treatment     Apixaban 5 mg Dabigatran 110 mg
## 1:     Apixaban 5 mg vs                NA 0.70 (0.55, 0.92)
## 2: Dabigatran 110 mg vs 1.42 (1.09, 1.82)                NA
## 3: Dabigatran 150 mg vs 1.66 (1.29, 2.13) 1.17 (1.01, 1.36)
## 4:    Edoxaban 30 mg vs 1.38 (1.11, 1.79) 0.98 (0.81, 1.19)
## 5:    Edoxaban 60 mg vs 0.84 (0.65, 1.06) 0.59 (0.48, 0.72)
## 6: Rivaroxaban 20 mg vs 1.81 (1.44, 2.29) 1.28 (1.03, 1.59)
## 7:          Warfarin vs 1.77 (1.44, 2.19) 1.25 (1.08, 1.45)
##    Dabigatran 150 mg    Edoxaban 30 mg    Edoxaban 60 mg Rivaroxaban 20 mg
## 1: 0.60 (0.47, 0.77) 0.72 (0.56, 0.90) 1.19 (0.94, 1.55) 0.55 (0.44, 0.69)
## 2: 0.85 (0.73, 0.99) 1.02 (0.84, 1.24) 1.70 (1.39, 2.10) 0.78 (0.63, 0.97)
## 3:                NA 1.19 (0.98, 1.43) 1.99 (1.61, 2.46) 0.92 (0.74, 1.13)
## 4: 0.84 (0.70, 1.02)                NA 1.67 (1.43, 1.96) 0.77 (0.64, 0.95)
## 5: 0.50 (0.41, 0.62) 0.60 (0.51, 0.70)                NA 0.46 (0.37, 0.57)
## 6: 1.09 (0.88, 1.35) 1.30 (1.05, 1.57) 2.18 (1.76, 2.69)                NA
## 7: 1.07 (0.92, 1.22) 1.27 (1.11, 1.43) 2.11 (1.79, 2.50) 0.98 (0.85, 1.13)
##             Warfarin
## 1: 0.57 (0.46, 0.70)
## 2: 0.80 (0.69, 0.93)
## 3: 0.94 (0.82, 1.09)
## 4: 0.79 (0.70, 0.90)
## 5: 0.47 (0.40, 0.56)
## 6: 1.03 (0.88, 1.17)
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
## Iterations = 5010:6250
## Thinning interval = 10 
## Number of chains = 4 
## Sample size per chain = 125 
## 
## 1. Empirical mean and standard deviation for each variable,
##    plus standard error of the mean:
## 
##                                  Mean      SD Naive SE Time-series SE
## d.Warfarin.Apixaban_5_mg     -0.57169 0.10577 0.004730       0.004950
## d.Warfarin.Dabigatran_110_mg -0.22090 0.07513 0.003360       0.004377
## d.Warfarin.Dabigatran_150_mg -0.06294 0.07487 0.003348       0.003882
## d.Warfarin.Edoxaban_30_mg    -0.23953 0.06771 0.003028       0.003463
## d.Warfarin.Edoxaban_60_mg    -0.75214 0.08225 0.003678       0.003592
## d.Warfarin.Rivaroxaban_20_mg  0.02473 0.07305 0.003267       0.003409
## 
## 2. Quantiles for each variable:
## 
##                                 2.5%      25%      50%      75%    97.5%
## d.Warfarin.Apixaban_5_mg     -0.7837 -0.64533 -0.57083 -0.50389 -0.36141
## d.Warfarin.Dabigatran_110_mg -0.3696 -0.26885 -0.22080 -0.17095 -0.07514
## d.Warfarin.Dabigatran_150_mg -0.2008 -0.11774 -0.06306 -0.01580  0.08197
## d.Warfarin.Edoxaban_30_mg    -0.3609 -0.28709 -0.24197 -0.19170 -0.10784
## d.Warfarin.Edoxaban_60_mg    -0.9151 -0.80762 -0.74833 -0.69793 -0.58427
## d.Warfarin.Rivaroxaban_20_mg -0.1239 -0.02049  0.02522  0.07715  0.15924
## 
## 
## $DIC
##     Dbar       pD      DIC 
## 23.41152 13.22144 36.63296 
## 
## attr(,"class")
## [1] "summary.mtc.result"
```

Sampler diagnostics.


```r
gelman.plot(results)
```

![](mtcBleeding_files/figure-html/gelman-1.png) 

```r
gelman.diag(results)
```

```
## Potential scale reduction factors:
## 
##                              Point est. Upper C.I.
## d.Warfarin.Apixaban_5_mg          1.010       1.03
## d.Warfarin.Dabigatran_110_mg      1.006       1.02
## d.Warfarin.Dabigatran_150_mg      1.014       1.04
## d.Warfarin.Edoxaban_30_mg         0.998       1.00
## d.Warfarin.Edoxaban_60_mg         0.999       1.00
## d.Warfarin.Rivaroxaban_20_mg      1.003       1.02
## 
## Multivariate psrf
## 
## 1.02
```


```r
plot(results)
```

![](mtcBleeding_files/figure-html/trace-1.png) ![](mtcBleeding_files/figure-html/trace-2.png) 


```r
autocorr.plot(results$samples)
```

![](mtcBleeding_files/figure-html/autocorr-1.png) ![](mtcBleeding_files/figure-html/autocorr-2.png) ![](mtcBleeding_files/figure-html/autocorr-3.png) ![](mtcBleeding_files/figure-html/autocorr-4.png) 

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
## 1     Apixaban_5_mg          Warfarin 99.96833 73.90005       NA
## 2 Dabigatran_110_mg Dabigatran_150_mg       NA       NA       NA
## 3 Dabigatran_110_mg          Warfarin       NA       NA       NA
## 4 Dabigatran_150_mg          Warfarin 99.97410 97.80697       NA
## 5    Edoxaban_30_mg    Edoxaban_60_mg 99.95500 98.31400       NA
## 6    Edoxaban_30_mg          Warfarin 98.41287  0.00000       NA
## 7    Edoxaban_60_mg          Warfarin 99.95185 98.32142       NA
## 8 Rivaroxaban_20_mg          Warfarin       NA       NA       NA
## 
## Global I-squared:
## -------------------------
## 
##    i2.pair  i2.cons
## 1 99.89543 93.43187
```

```r
plot(anohe)
```

```
## Analysis of heterogeneity -- convergence plots
## Unrelated Study Effects (USE) model:
```

![](mtcBleeding_files/figure-html/anohe-1.png) ![](mtcBleeding_files/figure-html/anohe-2.png) ![](mtcBleeding_files/figure-html/anohe-3.png) ![](mtcBleeding_files/figure-html/anohe-4.png) 

```
## Unrelated Mean Effects (UME) model:
```

![](mtcBleeding_files/figure-html/anohe-5.png) ![](mtcBleeding_files/figure-html/anohe-6.png) ![](mtcBleeding_files/figure-html/anohe-7.png) 

```
## Consistency model:
```

![](mtcBleeding_files/figure-html/anohe-8.png) ![](mtcBleeding_files/figure-html/anohe-9.png) 
