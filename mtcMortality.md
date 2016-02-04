# NOAC network meta-analysis: Mortality
Benjamin Chan  
`r Sys.time()`  

[Back](README.md) to main page.

Clean up the data (do not show the code).


```
##               study         treatment responders sampleSize
##  1:       ARISTOTLE     Apixaban_5_mg        603       9120
##  2:       ARISTOTLE          Warfarin        669       9081
##  3:     ARISTOTLE-J     Apixaban_5_mg          0         72
##  4:     ARISTOTLE-J          Warfarin          0         75
##  5:  ENGAGE AF-TIMI    Edoxaban_30_mg        737       7034
##  6:  ENGAGE AF-TIMI    Edoxaban_60_mg        773       7035
##  7:  ENGAGE AF-TIMI          Warfarin        839       7036
##  8:        J-ROCKET Rivaroxaban_15_mg          7        639
##  9:        J-ROCKET          Warfarin          5        639
## 10:           RE-LY Dabigatran_110_mg        446       6015
## 11:           RE-LY Dabigatran_150_mg        438       6076
## 12:           RE-LY          Warfarin        487       6022
## 13:       ROCKET-AF Rivaroxaban_20_mg        208       7131
## 14:       ROCKET-AF          Warfarin        250       7133
## 15: Yamashita, 2012    Edoxaban_30_mg          0        131
## 16: Yamashita, 2012    Edoxaban_60_mg          1        131
## 17: Yamashita, 2012          Warfarin          1        129
```

Run the model using fixed-effects.


```r
M <- mtc.model(network, type="consistency", linearModel=effect)
plot(M)
```

![](mtcMortality_files/figure-html/network-1.png) 

```r
results <- mtc.run(M, n.adapt=nAdapt, n.iter=nIter, thin=thin)
```

# Summary

Direct and indirect odds ratios and 95% confidence bounds are stored in
[mtcMortalityOddsRatios.csv](mtcMortalityOddsRatios.csv).


```r
or <- combineResults()
write.csv(or, file="mtcMortalityOddsRatios.csv", row.names=FALSE)
show(or)
```

```
##               treatment     Apixaban 5 mg Dabigatran 110 mg
## 1:     Apixaban 5 mg vs                NA 0.98 (0.83, 1.17)
## 2: Dabigatran 110 mg vs 1.02 (0.86, 1.20)                NA
## 3: Dabigatran 150 mg vs 0.99 (0.84, 1.17) 0.97 (0.84, 1.12)
## 4:    Edoxaban 30 mg vs 0.97 (0.83, 1.14) 0.95 (0.80, 1.12)
## 5:    Edoxaban 60 mg vs 1.03 (0.89, 1.18) 1.01 (0.86, 1.18)
## 6: Rivaroxaban 15 mg vs 1.65 (0.53, 5.55) 1.61 (0.53, 5.27)
## 7: Rivaroxaban 20 mg vs 0.93 (0.75, 1.15) 0.91 (0.73, 1.13)
## 8:          Warfarin vs 1.13 (1.01, 1.25) 1.10 (0.97, 1.26)
##    Dabigatran 150 mg    Edoxaban 30 mg    Edoxaban 60 mg Rivaroxaban 15 mg
## 1: 1.01 (0.85, 1.19) 1.03 (0.88, 1.20) 0.97 (0.85, 1.13) 0.60 (0.18, 1.87)
## 2: 1.03 (0.90, 1.19) 1.05 (0.89, 1.24) 0.99 (0.85, 1.16) 0.62 (0.19, 1.89)
## 3:                NA 1.02 (0.86, 1.21) 0.97 (0.81, 1.15) 0.60 (0.18, 1.88)
## 4: 0.98 (0.83, 1.16)                NA 0.94 (0.86, 1.05) 0.59 (0.18, 1.82)
## 5: 1.03 (0.87, 1.24) 1.06 (0.95, 1.17)                NA 0.63 (0.19, 1.98)
## 6: 1.66 (0.53, 5.61) 1.69 (0.55, 5.64) 1.60 (0.50, 5.21)                NA
## 7: 0.93 (0.76, 1.17) 0.95 (0.78, 1.18) 0.90 (0.73, 1.11) 0.57 (0.17, 1.68)
## 8: 1.13 (0.99, 1.28) 1.16 (1.02, 1.30) 1.09 (0.98, 1.22) 0.68 (0.21, 2.02)
##    Rivaroxaban 20 mg          Warfarin
## 1: 1.08 (0.87, 1.34) 0.89 (0.80, 0.99)
## 2: 1.10 (0.89, 1.38) 0.91 (0.80, 1.03)
## 3: 1.08 (0.85, 1.32) 0.88 (0.78, 1.01)
## 4: 1.05 (0.85, 1.28) 0.86 (0.77, 0.98)
## 5: 1.11 (0.90, 1.37) 0.91 (0.82, 1.02)
## 6: 1.76 (0.60, 5.76) 1.47 (0.49, 4.82)
## 7:                NA 0.83 (0.69, 0.99)
## 8: 1.21 (1.01, 1.45)                NA
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
## d.Warfarin.Apixaban_5_mg     -0.11691 0.05721 0.002559       0.002512
## d.Warfarin.Dabigatran_110_mg -0.09585 0.06750 0.003019       0.003064
## d.Warfarin.Dabigatran_150_mg -0.12390 0.06939 0.003103       0.003024
## d.Warfarin.Edoxaban_30_mg    -0.14700 0.05711 0.002554       0.002477
## d.Warfarin.Edoxaban_60_mg    -0.09138 0.05486 0.002453       0.002455
## d.Warfarin.Rivaroxaban_15_mg  0.38351 0.60906 0.027238       0.026406
## d.Warfarin.Rivaroxaban_20_mg -0.19130 0.09082 0.004061       0.004064
## 
## 2. Quantiles for each variable:
## 
##                                 2.5%     25%      50%      75%     97.5%
## d.Warfarin.Apixaban_5_mg     -0.2257 -0.1558 -0.12060 -0.07467 -0.014120
## d.Warfarin.Dabigatran_110_mg -0.2287 -0.1426 -0.09889 -0.04577  0.029985
## d.Warfarin.Dabigatran_150_mg -0.2485 -0.1743 -0.12385 -0.07289  0.006449
## d.Warfarin.Edoxaban_30_mg    -0.2613 -0.1830 -0.14728 -0.10969 -0.023315
## d.Warfarin.Edoxaban_60_mg    -0.1974 -0.1283 -0.08890 -0.05684  0.021108
## d.Warfarin.Rivaroxaban_15_mg -0.7038  0.0129  0.38321  0.80096  1.572511
## d.Warfarin.Rivaroxaban_20_mg -0.3733 -0.2535 -0.18796 -0.13380 -0.007266
## 
## 
## $DIC
##     Dbar       pD      DIC 
## 14.69930 13.05100 27.75031 
## 
## attr(,"class")
## [1] "summary.mtc.result"
```

Sampler diagnostics.


```r
gelman.plot(results)
```

![](mtcMortality_files/figure-html/gelman-1.png) 

```r
gelman.diag(results)
```

```
## Potential scale reduction factors:
## 
##                              Point est. Upper C.I.
## d.Warfarin.Apixaban_5_mg          1.001       1.01
## d.Warfarin.Dabigatran_110_mg      1.003       1.02
## d.Warfarin.Dabigatran_150_mg      0.999       1.00
## d.Warfarin.Edoxaban_30_mg         1.003       1.02
## d.Warfarin.Edoxaban_60_mg         1.006       1.01
## d.Warfarin.Rivaroxaban_15_mg      1.002       1.01
## d.Warfarin.Rivaroxaban_20_mg      1.000       1.01
## 
## Multivariate psrf
## 
## 1.02
```


```r
plot(results)
```

![](mtcMortality_files/figure-html/trace-1.png) ![](mtcMortality_files/figure-html/trace-2.png) 


```r
autocorr.plot(results$samples)
```

![](mtcMortality_files/figure-html/autocorr-1.png) ![](mtcMortality_files/figure-html/autocorr-2.png) ![](mtcMortality_files/figure-html/autocorr-3.png) ![](mtcMortality_files/figure-html/autocorr-4.png) 

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
## 1     Apixaban_5_mg          Warfarin 63.44486  0.00000       NA
## 2 Dabigatran_110_mg Dabigatran_150_mg       NA       NA       NA
## 3 Dabigatran_110_mg          Warfarin       NA       NA       NA
## 4 Dabigatran_150_mg          Warfarin       NA       NA       NA
## 5    Edoxaban_30_mg    Edoxaban_60_mg 61.34218 56.30955       NA
## 6    Edoxaban_30_mg          Warfarin 96.25219 75.69819       NA
## 7    Edoxaban_60_mg          Warfarin 80.40420  0.00000       NA
## 8 Rivaroxaban_15_mg          Warfarin       NA       NA       NA
## 9 Rivaroxaban_20_mg          Warfarin       NA       NA       NA
## 
## Global I-squared:
## -------------------------
## 
##    i2.pair i2.cons
## 1 72.01314       0
```

```r
plot(anohe)
```

```
## Analysis of heterogeneity -- convergence plots
## Unrelated Study Effects (USE) model:
```

![](mtcMortality_files/figure-html/anohe-1.png) ![](mtcMortality_files/figure-html/anohe-2.png) ![](mtcMortality_files/figure-html/anohe-3.png) ![](mtcMortality_files/figure-html/anohe-4.png) 

```
## Unrelated Mean Effects (UME) model:
```

![](mtcMortality_files/figure-html/anohe-5.png) ![](mtcMortality_files/figure-html/anohe-6.png) ![](mtcMortality_files/figure-html/anohe-7.png) ![](mtcMortality_files/figure-html/anohe-8.png) 

```
## Consistency model:
```

![](mtcMortality_files/figure-html/anohe-9.png) ![](mtcMortality_files/figure-html/anohe-10.png) 
