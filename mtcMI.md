# NOAC network meta-analysis: MI
Benjamin Chan  
`r Sys.time()`  

[Back](README.md) to main page.

Clean up the data (do not show the code).


```
##              study         treatment responders sampleSize
##  1:      ARISTOTLE     Apixaban_5_mg         90       9120
##  2:      ARISTOTLE          Warfarin        102       9081
##  3:    ARISTOTLE-J     Apixaban_5_mg          0         72
##  4:    ARISTOTLE-J          Warfarin          0         75
##  5: ENGAGE AF-TIMI    Edoxaban_30_mg        133       7034
##  6: ENGAGE AF-TIMI    Edoxaban_60_mg        169       7035
##  7: ENGAGE AF-TIMI          Warfarin        141       7036
##  8:       J-ROCKET Rivaroxaban_15_mg          3        639
##  9:       J-ROCKET          Warfarin          1        639
## 10:          RE-LY Dabigatran_110_mg         86       6015
## 11:          RE-LY Dabigatran_150_mg         89       6076
## 12:          RE-LY          Warfarin         63       6022
## 13:      ROCKET-AF Rivaroxaban_20_mg        101       7131
## 14:      ROCKET-AF          Warfarin        126       7133
```

Run the model using fixed-effects.


```r
M <- mtc.model(network, type="consistency", linearModel=effect)
plot(M)
```

![](mtcMI_files/figure-html/network-1.png) 

```r
results <- mtc.run(M, n.adapt=nAdapt, n.iter=nIter, thin=thin)
```

# Summary

Direct and indirect odds ratios and 95% confidence bounds are stored in
[mtcMIOddsRatios.csv](mtcMIOddsRatios.csv).


```r
or <- combineResults()
write.csv(or, file="mtcMIOddsRatios.csv", row.names=FALSE)
show(or)
```

```
##               treatment       Apixaban 5 mg  Dabigatran 110 mg
## 1:     Apixaban 5 mg vs                  NA  0.66 (0.43, 0.97)
## 2: Dabigatran 110 mg vs   1.52 (1.03, 2.35)                 NA
## 3: Dabigatran 150 mg vs   1.55 (1.04, 2.40)  1.01 (0.76, 1.38)
## 4:    Edoxaban 30 mg vs   1.06 (0.72, 1.50)  0.68 (0.48, 1.02)
## 5:    Edoxaban 60 mg vs   1.35 (0.96, 1.93)  0.89 (0.61, 1.31)
## 6: Rivaroxaban 15 mg vs 4.52 (0.49, 104.00) 2.87 (0.34, 64.71)
## 7: Rivaroxaban 20 mg vs   0.90 (0.61, 1.35)  0.58 (0.40, 0.87)
## 8:          Warfarin vs   1.14 (0.85, 1.50)  0.74 (0.52, 1.04)
##     Dabigatran 150 mg     Edoxaban 30 mg     Edoxaban 60 mg
## 1:  0.64 (0.42, 0.96)  0.94 (0.67, 1.39)  0.74 (0.52, 1.04)
## 2:  0.99 (0.72, 1.32)  1.47 (0.98, 2.09)  1.13 (0.76, 1.65)
## 3:                 NA  1.47 (1.00, 2.20)  1.14 (0.80, 1.72)
## 4:  0.68 (0.45, 1.00)                 NA  0.77 (0.62, 0.98)
## 5:  0.88 (0.58, 1.25)  1.29 (1.02, 1.62)                 NA
## 6: 2.83 (0.33, 60.51) 4.19 (0.51, 92.68) 3.22 (0.37, 73.44)
## 7:  0.57 (0.39, 0.85)  0.86 (0.60, 1.18)  0.67 (0.46, 0.92)
## 8:  0.72 (0.53, 1.00)  1.07 (0.83, 1.37)  0.83 (0.65, 1.03)
##    Rivaroxaban 15 mg   Rivaroxaban 20 mg           Warfarin
## 1: 0.22 (0.01, 2.03)   1.11 (0.74, 1.64)  0.88 (0.67, 1.18)
## 2: 0.35 (0.02, 2.98)   1.71 (1.14, 2.51)  1.36 (0.96, 1.91)
## 3: 0.35 (0.02, 3.01)   1.75 (1.17, 2.54)  1.39 (1.00, 1.89)
## 4: 0.24 (0.01, 1.95)   1.17 (0.84, 1.68)  0.93 (0.73, 1.20)
## 5: 0.31 (0.01, 2.71)   1.49 (1.08, 2.17)  1.20 (0.97, 1.53)
## 6:                NA 4.71 (0.54, 110.69) 4.02 (0.45, 87.78)
## 7: 0.21 (0.01, 1.86)                  NA  0.81 (0.62, 1.04)
## 8: 0.25 (0.01, 2.22)   1.24 (0.97, 1.62)                 NA
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
##                                  Mean     SD Naive SE Time-series SE
## d.Warfarin.Apixaban_5_mg     -0.12096 0.1411 0.006311       0.006312
## d.Warfarin.Dabigatran_110_mg  0.30973 0.1657 0.007409       0.008215
## d.Warfarin.Dabigatran_150_mg  0.32758 0.1629 0.007286       0.007282
## d.Warfarin.Edoxaban_30_mg    -0.06568 0.1225 0.005477       0.006217
## d.Warfarin.Edoxaban_60_mg     0.18847 0.1165 0.005209       0.004845
## d.Warfarin.Rivaroxaban_15_mg  1.50656 1.3233 0.059180       0.059801
## d.Warfarin.Rivaroxaban_20_mg -0.22251 0.1328 0.005940       0.005932
## 
## 2. Quantiles for each variable:
## 
##                                   2.5%     25%      50%      75%   97.5%
## d.Warfarin.Apixaban_5_mg     -0.405752 -0.2044 -0.12732 -0.02433 0.16151
## d.Warfarin.Dabigatran_110_mg -0.036743  0.2055  0.30427  0.42176 0.64728
## d.Warfarin.Dabigatran_150_mg  0.001628  0.2129  0.32967  0.44123 0.63730
## d.Warfarin.Edoxaban_30_mg    -0.311465 -0.1461 -0.06748  0.01002 0.18167
## d.Warfarin.Edoxaban_60_mg    -0.025417  0.1090  0.18511  0.26377 0.42335
## d.Warfarin.Rivaroxaban_15_mg -0.799363  0.6723  1.39100  2.28815 4.47479
## d.Warfarin.Rivaroxaban_20_mg -0.483851 -0.3164 -0.21302 -0.13571 0.03464
## 
## 
## $DIC
##     Dbar       pD      DIC 
## 12.23907 12.04921 24.28828 
## 
## attr(,"class")
## [1] "summary.mtc.result"
```

Sampler diagnostics.


```r
gelman.plot(results)
```

![](mtcMI_files/figure-html/gelman-1.png) 

```r
gelman.diag(results)
```

```
## Potential scale reduction factors:
## 
##                              Point est. Upper C.I.
## d.Warfarin.Apixaban_5_mg          1.003       1.01
## d.Warfarin.Dabigatran_110_mg      1.005       1.02
## d.Warfarin.Dabigatran_150_mg      1.005       1.02
## d.Warfarin.Edoxaban_30_mg         0.998       1.00
## d.Warfarin.Edoxaban_60_mg         1.004       1.02
## d.Warfarin.Rivaroxaban_15_mg      1.008       1.02
## d.Warfarin.Rivaroxaban_20_mg      1.003       1.02
## 
## Multivariate psrf
## 
## 1.01
```


```r
plot(results)
```

![](mtcMI_files/figure-html/trace-1.png) ![](mtcMI_files/figure-html/trace-2.png) 


```r
autocorr.plot(results$samples)
```

![](mtcMI_files/figure-html/autocorr-1.png) ![](mtcMI_files/figure-html/autocorr-2.png) ![](mtcMI_files/figure-html/autocorr-3.png) ![](mtcMI_files/figure-html/autocorr-4.png) 

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
## 1     Apixaban_5_mg          Warfarin       0       0       NA
## 2 Dabigatran_110_mg Dabigatran_150_mg      NA      NA       NA
## 3 Dabigatran_110_mg          Warfarin      NA      NA       NA
## 4 Dabigatran_150_mg          Warfarin      NA      NA       NA
## 5    Edoxaban_30_mg    Edoxaban_60_mg      NA      NA       NA
## 6    Edoxaban_30_mg          Warfarin      NA      NA       NA
## 7    Edoxaban_60_mg          Warfarin      NA      NA       NA
## 8 Rivaroxaban_15_mg          Warfarin      NA      NA       NA
## 9 Rivaroxaban_20_mg          Warfarin      NA      NA       NA
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

![](mtcMI_files/figure-html/anohe-1.png) ![](mtcMI_files/figure-html/anohe-2.png) 

```
## Unrelated Mean Effects (UME) model:
```

![](mtcMI_files/figure-html/anohe-3.png) ![](mtcMI_files/figure-html/anohe-4.png) ![](mtcMI_files/figure-html/anohe-5.png) ![](mtcMI_files/figure-html/anohe-6.png) 

```
## Consistency model:
```

![](mtcMI_files/figure-html/anohe-7.png) ![](mtcMI_files/figure-html/anohe-8.png) 
