# NOAC network meta-analysis: Mortality
Benjamin Chan  
`r Sys.time()`  


Clean up the data (do not show the code).


```
##              study         treatment responders sampleSize
##  1:          RE-LY Dabigatran_110_mg        446       6015
##  2:          RE-LY Dabigatran_150_mg        438       6076
##  3:          RE-LY          Warfarin        487       6022
##  4:      ARISTOTLE     Apixaban_5_mg        603       9120
##  5:      ARISTOTLE          Warfarin        669       9081
##  6:      ROCKET-AF Rivaroxaban_20_mg        208       7131
##  7:      ROCKET-AF          Warfarin        250       7133
##  8: ENGAGE AF-TIMI    Edoxaban_30_mg        737       7034
##  9: ENGAGE AF-TIMI    Edoxaban_60_mg        773       7035
## 10: ENGAGE AF-TIMI          Warfarin        839       7036
```

# Network plot


```r
plot(network)
```

![](mtcMortality_files/figure-html/mortalityNetwork-1.png) 

Run the model using fixed-effects.


```r
M <- mtc.model(network, type="consistency", linearModel=effect)
runtime <- system.time(results <- mtc.run(M, n.adapt=nAdapt, n.iter=nIter, thin=thin))
```

# Summary

Head-to-head odds ratios and 95% confidence bounds are stored in
[mtcMortalityHTH.csv](mtcMortalityHTH.csv).


```r
hth <- combineResults()
hth[, .(label, result)]
```

```
##                                      label            result
##  1:     Dabigatran 110 mg vs Apixaban 5 mg 1.02 (0.86, 1.22)
##  2:     Dabigatran 150 mg vs Apixaban 5 mg 0.99 (0.83, 1.18)
##  3:        Edoxaban 30 mg vs Apixaban 5 mg 0.97 (0.83, 1.13)
##  4:        Edoxaban 60 mg vs Apixaban 5 mg 1.02 (0.88, 1.20)
##  5:     Rivaroxaban 20 mg vs Apixaban 5 mg 0.93 (0.75, 1.16)
##  6:              Warfarin vs Apixaban 5 mg 1.12 (1.00, 1.26)
##  7:     Apixaban 5 mg vs Dabigatran 110 mg 0.98 (0.82, 1.17)
##  8: Dabigatran 150 mg vs Dabigatran 110 mg 0.97 (0.85, 1.11)
##  9:    Edoxaban 30 mg vs Dabigatran 110 mg 0.95 (0.80, 1.12)
## 10:    Edoxaban 60 mg vs Dabigatran 110 mg 1.00 (0.85, 1.18)
## 11: Rivaroxaban 20 mg vs Dabigatran 110 mg 0.91 (0.72, 1.15)
## 12:          Warfarin vs Dabigatran 110 mg 1.10 (0.96, 1.26)
## 13:     Apixaban 5 mg vs Dabigatran 150 mg 1.01 (0.85, 1.20)
## 14: Dabigatran 110 mg vs Dabigatran 150 mg 1.03 (0.90, 1.18)
## 15:    Edoxaban 30 mg vs Dabigatran 150 mg 0.98 (0.83, 1.16)
## 16:    Edoxaban 60 mg vs Dabigatran 150 mg 1.03 (0.87, 1.23)
## 17: Rivaroxaban 20 mg vs Dabigatran 150 mg 0.94 (0.74, 1.18)
## 18:          Warfarin vs Dabigatran 150 mg 1.13 (0.99, 1.29)
## 19:        Apixaban 5 mg vs Edoxaban 30 mg 1.03 (0.88, 1.20)
## 20:    Dabigatran 110 mg vs Edoxaban 30 mg 1.05 (0.89, 1.24)
## 21:    Dabigatran 150 mg vs Edoxaban 30 mg 1.02 (0.86, 1.21)
## 22:       Edoxaban 60 mg vs Edoxaban 30 mg 1.06 (0.95, 1.17)
## 23:    Rivaroxaban 20 mg vs Edoxaban 30 mg 0.96 (0.77, 1.18)
## 24:             Warfarin vs Edoxaban 30 mg 1.16 (1.04, 1.29)
## 25:        Apixaban 5 mg vs Edoxaban 60 mg 0.98 (0.84, 1.14)
## 26:    Dabigatran 110 mg vs Edoxaban 60 mg 1.00 (0.85, 1.18)
## 27:    Dabigatran 150 mg vs Edoxaban 60 mg 0.97 (0.81, 1.15)
## 28:       Edoxaban 30 mg vs Edoxaban 60 mg 0.95 (0.85, 1.05)
## 29:    Rivaroxaban 20 mg vs Edoxaban 60 mg 0.91 (0.73, 1.12)
## 30:             Warfarin vs Edoxaban 60 mg 1.10 (0.99, 1.22)
## 31:     Apixaban 5 mg vs Rivaroxaban 20 mg 1.07 (0.86, 1.33)
## 32: Dabigatran 110 mg vs Rivaroxaban 20 mg 1.10 (0.87, 1.38)
## 33: Dabigatran 150 mg vs Rivaroxaban 20 mg 1.06 (0.85, 1.35)
## 34:    Edoxaban 30 mg vs Rivaroxaban 20 mg 1.04 (0.85, 1.29)
## 35:    Edoxaban 60 mg vs Rivaroxaban 20 mg 1.10 (0.89, 1.37)
## 36:          Warfarin vs Rivaroxaban 20 mg 1.20 (1.00, 1.45)
## 37:              Apixaban 5 mg vs Warfarin 0.89 (0.80, 1.00)
## 38:          Dabigatran 110 mg vs Warfarin 0.91 (0.80, 1.04)
## 39:          Dabigatran 150 mg vs Warfarin 0.88 (0.77, 1.01)
## 40:             Edoxaban 30 mg vs Warfarin 0.86 (0.78, 0.96)
## 41:             Edoxaban 60 mg vs Warfarin 0.91 (0.82, 1.01)
## 42:          Rivaroxaban 20 mg vs Warfarin 0.83 (0.69, 1.00)
##                                      label            result
```

```r
write.csv(hth, file="mtcMortalityHTH.csv", row.names=FALSE)
```

# Diagnostics


```r
runtime
```

```
##    user  system elapsed 
##    8.72    0.02    8.99
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
## d.Warfarin.Apixaban_5_mg     -0.11568 0.05852 0.0006543      0.0006656
## d.Warfarin.Dabigatran_110_mg -0.09363 0.06761 0.0007559      0.0008510
## d.Warfarin.Dabigatran_150_mg -0.12405 0.06866 0.0007677      0.0007959
## d.Warfarin.Edoxaban_30_mg    -0.14560 0.05376 0.0006010      0.0006429
## d.Warfarin.Edoxaban_60_mg    -0.09126 0.05330 0.0005960      0.0005959
## d.Warfarin.Rivaroxaban_20_mg -0.18654 0.09601 0.0010734      0.0011146
## 
## 2. Quantiles for each variable:
## 
##                                 2.5%     25%      50%      75%      97.5%
## d.Warfarin.Apixaban_5_mg     -0.2280 -0.1545 -0.11557 -0.07714  3.669e-05
## d.Warfarin.Dabigatran_110_mg -0.2277 -0.1387 -0.09352 -0.04758  3.767e-02
## d.Warfarin.Dabigatran_150_mg -0.2559 -0.1704 -0.12437 -0.07716  1.147e-02
## d.Warfarin.Edoxaban_30_mg    -0.2510 -0.1815 -0.14604 -0.10867 -4.104e-02
## d.Warfarin.Edoxaban_60_mg    -0.1952 -0.1272 -0.09166 -0.05540  1.271e-02
## d.Warfarin.Rivaroxaban_20_mg -0.3749 -0.2521 -0.18620 -0.12142  2.704e-03
## 
## 
## $DIC
##     Dbar       pD      DIC 
## 10.03419 10.03038 20.06457 
## 
## attr(,"class")
## [1] "summary.mtc.result"
```

Sampler diagnostics.


```r
gelman.plot(results)
```

![](mtcMortality_files/figure-html/mortalityGelman-1.png) 

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

![](mtcMortality_files/figure-html/mortalityTrace-1.png) ![](mtcMortality_files/figure-html/mortalityTrace-2.png) 

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

![](mtcMortality_files/figure-html/mortalityAnohe-1.png) ![](mtcMortality_files/figure-html/mortalityAnohe-2.png) 

```
## Unrelated Mean Effects (UME) model:
```

![](mtcMortality_files/figure-html/mortalityAnohe-3.png) ![](mtcMortality_files/figure-html/mortalityAnohe-4.png) ![](mtcMortality_files/figure-html/mortalityAnohe-5.png) 

```
## Consistency model:
```

![](mtcMortality_files/figure-html/mortalityAnohe-6.png) ![](mtcMortality_files/figure-html/mortalityAnohe-7.png) 
