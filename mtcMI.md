# NOAC network meta-analysis: MI
Benjamin Chan  
`r Sys.time()`  


Clean up the data (do not show the code).


```
##              study         treatment responders sampleSize
##  1:          RE-LY Dabigatran_110_mg         86       6015
##  2:          RE-LY Dabigatran_150_mg         89       6076
##  3:          RE-LY          Warfarin         63       6022
##  4:      ARISTOTLE     Apixaban_5_mg         90       9120
##  5:      ARISTOTLE          Warfarin        102       9081
##  6:      ROCKET-AF Rivaroxaban_20_mg        101       7131
##  7:      ROCKET-AF          Warfarin        126       7133
##  8: ENGAGE AF-TIMI    Edoxaban_30_mg        133       7034
##  9: ENGAGE AF-TIMI    Edoxaban_60_mg        169       7035
## 10: ENGAGE AF-TIMI          Warfarin        141       7036
```

# Network plot


```r
plot(network)
```

![](mtcMI_files/figure-html/miNetwork-1.png) 

Run the model using fixed-effects.


```r
M <- mtc.model(network, type="consistency", linearModel=effect)
runtime <- system.time(results <- mtc.run(M, n.adapt=nAdapt, n.iter=nIter, thin=thin))
```

# Summary

Head-to-head odds ratios and 95% confidence bounds are stored in
[mtcMIHTH.csv](mtcMIHTH.csv).


```r
hth <- combineResults()
hth[, .(label, result)]
```

```
##                                      label            result
##  1:     Dabigatran 110 mg vs Apixaban 5 mg 1.57 (1.02, 2.43)
##  2:     Dabigatran 150 mg vs Apixaban 5 mg 1.61 (1.05, 2.50)
##  3:        Edoxaban 30 mg vs Apixaban 5 mg 1.07 (0.74, 1.56)
##  4:        Edoxaban 60 mg vs Apixaban 5 mg 1.37 (0.95, 1.96)
##  5:     Rivaroxaban 20 mg vs Apixaban 5 mg 0.91 (0.62, 1.34)
##  6:              Warfarin vs Apixaban 5 mg 1.14 (0.86, 1.52)
##  7:     Apixaban 5 mg vs Dabigatran 110 mg 0.64 (0.41, 0.98)
##  8: Dabigatran 150 mg vs Dabigatran 110 mg 1.02 (0.76, 1.38)
##  9:    Edoxaban 30 mg vs Dabigatran 110 mg 0.68 (0.46, 1.01)
## 10:    Edoxaban 60 mg vs Dabigatran 110 mg 0.88 (0.59, 1.29)
## 11: Rivaroxaban 20 mg vs Dabigatran 110 mg 0.58 (0.38, 0.88)
## 12:          Warfarin vs Dabigatran 110 mg 0.73 (0.52, 0.99)
## 13:     Apixaban 5 mg vs Dabigatran 150 mg 0.62 (0.40, 0.96)
## 14: Dabigatran 110 mg vs Dabigatran 150 mg 0.98 (0.73, 1.32)
## 15:    Edoxaban 30 mg vs Dabigatran 150 mg 0.67 (0.45, 1.00)
## 16:    Edoxaban 60 mg vs Dabigatran 150 mg 0.85 (0.58, 1.27)
## 17: Rivaroxaban 20 mg vs Dabigatran 150 mg 0.56 (0.37, 0.86)
## 18:          Warfarin vs Dabigatran 150 mg 0.71 (0.51, 0.98)
## 19:        Apixaban 5 mg vs Edoxaban 30 mg 0.93 (0.64, 1.36)
## 20:    Dabigatran 110 mg vs Edoxaban 30 mg 1.46 (0.99, 2.20)
## 21:    Dabigatran 150 mg vs Edoxaban 30 mg 1.50 (1.00, 2.23)
## 22:       Edoxaban 60 mg vs Edoxaban 30 mg 1.28 (1.02, 1.61)
## 23:    Rivaroxaban 20 mg vs Edoxaban 30 mg 0.85 (0.60, 1.21)
## 24:             Warfarin vs Edoxaban 30 mg 1.06 (0.84, 1.35)
## 25:        Apixaban 5 mg vs Edoxaban 60 mg 0.73 (0.51, 1.05)
## 26:    Dabigatran 110 mg vs Edoxaban 60 mg 1.14 (0.78, 1.70)
## 27:    Dabigatran 150 mg vs Edoxaban 60 mg 1.17 (0.79, 1.74)
## 28:       Edoxaban 30 mg vs Edoxaban 60 mg 0.78 (0.62, 0.98)
## 29:    Rivaroxaban 20 mg vs Edoxaban 60 mg 0.66 (0.47, 0.94)
## 30:             Warfarin vs Edoxaban 60 mg 0.83 (0.66, 1.04)
## 31:     Apixaban 5 mg vs Rivaroxaban 20 mg 1.10 (0.75, 1.62)
## 32: Dabigatran 110 mg vs Rivaroxaban 20 mg 1.73 (1.14, 2.64)
## 33: Dabigatran 150 mg vs Rivaroxaban 20 mg 1.77 (1.16, 2.67)
## 34:    Edoxaban 30 mg vs Rivaroxaban 20 mg 1.18 (0.83, 1.68)
## 35:    Edoxaban 60 mg vs Rivaroxaban 20 mg 1.51 (1.07, 2.11)
## 36:          Warfarin vs Rivaroxaban 20 mg 1.25 (0.96, 1.64)
## 37:              Apixaban 5 mg vs Warfarin 0.88 (0.66, 1.17)
## 38:          Dabigatran 110 mg vs Warfarin 1.38 (1.01, 1.91)
## 39:          Dabigatran 150 mg vs Warfarin 1.41 (1.02, 1.94)
## 40:             Edoxaban 30 mg vs Warfarin 0.94 (0.74, 1.19)
## 41:             Edoxaban 60 mg vs Warfarin 1.20 (0.96, 1.51)
## 42:          Rivaroxaban 20 mg vs Warfarin 0.80 (0.61, 1.04)
##                                      label            result
```

```r
write.csv(hth, file="mtcMIHTH.csv", row.names=FALSE)
```

# Diagnostics


```r
runtime
```

```
##    user  system elapsed 
##    9.09    0.00    9.10
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
##                                  Mean     SD Naive SE Time-series SE
## d.Warfarin.Apixaban_5_mg     -0.12969 0.1454 0.001625       0.001658
## d.Warfarin.Dabigatran_110_mg  0.32196 0.1657 0.001853       0.002016
## d.Warfarin.Dabigatran_150_mg  0.34452 0.1654 0.001849       0.001901
## d.Warfarin.Edoxaban_30_mg    -0.05857 0.1211 0.001354       0.001596
## d.Warfarin.Edoxaban_60_mg     0.18656 0.1141 0.001275       0.001291
## d.Warfarin.Rivaroxaban_20_mg -0.22523 0.1353 0.001513       0.001527
## 
## 2. Quantiles for each variable:
## 
##                                   2.5%     25%      50%      75%   97.5%
## d.Warfarin.Apixaban_5_mg     -0.420196 -0.2266 -0.13028 -0.03289 0.15324
## d.Warfarin.Dabigatran_110_mg  0.007055  0.2099  0.32083  0.43229 0.64872
## d.Warfarin.Dabigatran_150_mg  0.017054  0.2341  0.34514  0.45615 0.66464
## d.Warfarin.Edoxaban_30_mg    -0.296791 -0.1403 -0.05804  0.02403 0.17800
## d.Warfarin.Edoxaban_60_mg    -0.036945  0.1093  0.18599  0.26259 0.41459
## d.Warfarin.Rivaroxaban_20_mg -0.492068 -0.3161 -0.22304 -0.13216 0.03763
## 
## 
## $DIC
##      Dbar        pD       DIC 
##  9.963508  9.962458 19.925966 
## 
## attr(,"class")
## [1] "summary.mtc.result"
```

Sampler diagnostics.


```r
gelman.plot(results)
```

![](mtcMI_files/figure-html/miGelman-1.png) 

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

![](mtcMI_files/figure-html/miTrace-1.png) ![](mtcMI_files/figure-html/miTrace-2.png) 

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

![](mtcMI_files/figure-html/miAnohe-1.png) ![](mtcMI_files/figure-html/miAnohe-2.png) 

```
## Unrelated Mean Effects (UME) model:
```

![](mtcMI_files/figure-html/miAnohe-3.png) ![](mtcMI_files/figure-html/miAnohe-4.png) ![](mtcMI_files/figure-html/miAnohe-5.png) 

```
## Consistency model:
```

![](mtcMI_files/figure-html/miAnohe-6.png) ![](mtcMI_files/figure-html/miAnohe-7.png) 
