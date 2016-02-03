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

Run the model using fixed-effects.


```r
M <- mtc.model(network, type="consistency", linearModel=effect)
plot(M)
```

![](mtcMI_files/figure-html/miNetwork-1.png) 

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
##               treatment     Apixaban 5 mg Dabigatran 110 mg
## 1:     Apixaban 5 mg vs                NA 0.64 (0.42, 0.98)
## 2: Dabigatran 110 mg vs 1.57 (1.02, 2.40)                NA
## 3: Dabigatran 150 mg vs 1.61 (1.05, 2.48) 1.02 (0.76, 1.38)
## 4:    Edoxaban 30 mg vs 1.07 (0.74, 1.54) 0.69 (0.46, 1.02)
## 5:    Edoxaban 60 mg vs 1.37 (0.95, 1.96) 0.87 (0.59, 1.29)
## 6: Rivaroxaban 20 mg vs 0.91 (0.62, 1.33) 0.58 (0.38, 0.88)
## 7:          Warfarin vs 1.14 (0.85, 1.52) 0.72 (0.53, 1.01)
##    Dabigatran 150 mg    Edoxaban 30 mg    Edoxaban 60 mg Rivaroxaban 20 mg
## 1: 0.62 (0.40, 0.95) 0.93 (0.65, 1.36) 0.73 (0.51, 1.05) 1.10 (0.75, 1.63)
## 2: 0.98 (0.72, 1.32) 1.46 (0.98, 2.19) 1.15 (0.78, 1.69) 1.72 (1.13, 2.65)
## 3:                NA 1.49 (1.01, 2.24) 1.17 (0.80, 1.75) 1.77 (1.16, 2.68)
## 4: 0.67 (0.45, 0.99)                NA 0.78 (0.62, 0.99) 1.18 (0.82, 1.68)
## 5: 0.85 (0.57, 1.25) 1.28 (1.01, 1.61)                NA 1.50 (1.05, 2.13)
## 6: 0.57 (0.37, 0.86) 0.85 (0.60, 1.22) 0.67 (0.47, 0.95)                NA
## 7: 0.71 (0.51, 0.97) 1.06 (0.84, 1.34) 0.83 (0.66, 1.04) 1.25 (0.96, 1.63)
##             Warfarin
## 1: 0.88 (0.66, 1.17)
## 2: 1.38 (0.99, 1.90)
## 3: 1.41 (1.03, 1.95)
## 4: 0.94 (0.74, 1.20)
## 5: 1.20 (0.96, 1.51)
## 6: 0.80 (0.61, 1.04)
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
##                                  Mean     SD Naive SE Time-series SE
## d.Warfarin.Apixaban_5_mg     -0.12749 0.1448 0.001619       0.001659
## d.Warfarin.Dabigatran_110_mg  0.32214 0.1660 0.001856       0.002122
## d.Warfarin.Dabigatran_150_mg  0.34552 0.1643 0.001837       0.001988
## d.Warfarin.Edoxaban_30_mg    -0.05786 0.1218 0.001362       0.001552
## d.Warfarin.Edoxaban_60_mg     0.18579 0.1158 0.001295       0.001348
## d.Warfarin.Rivaroxaban_20_mg -0.22189 0.1353 0.001512       0.001525
## 
## 2. Quantiles for each variable:
## 
##                                   2.5%     25%      50%      75%   97.5%
## d.Warfarin.Apixaban_5_mg     -0.416412 -0.2225 -0.12830 -0.02997 0.15692
## d.Warfarin.Dabigatran_110_mg -0.007706  0.2079  0.32186  0.43371 0.64075
## d.Warfarin.Dabigatran_150_mg  0.029598  0.2323  0.34307  0.45545 0.66791
## d.Warfarin.Edoxaban_30_mg    -0.296009 -0.1381 -0.05676  0.02341 0.18026
## d.Warfarin.Edoxaban_60_mg    -0.043294  0.1096  0.18584  0.26274 0.41041
## d.Warfarin.Rivaroxaban_20_mg -0.486562 -0.3136 -0.22265 -0.13004 0.03891
## 
## 
## $DIC
##      Dbar        pD       DIC 
##  9.996215  9.992951 19.989167 
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
