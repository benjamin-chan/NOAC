# NOAC network meta-analysis: Stroke
Benjamin Chan  
`r Sys.time()`  


Clean up the data (do not show the code).


```
##              study         treatment responders sampleSize
##  1:          RE-LY Dabigatran_110_mg        182       6015
##  2:          RE-LY Dabigatran_150_mg        134       6076
##  3:          RE-LY          Warfarin        199       6022
##  4:      ARISTOTLE     Apixaban_5_mg        212       9120
##  5:      ARISTOTLE          Warfarin        265       9081
##  6:      ROCKET-AF Rivaroxaban_20_mg        188       7131
##  7:      ROCKET-AF          Warfarin        241       7133
##  8: ENGAGE AF-TIMI    Edoxaban_30_mg        182       7034
##  9: ENGAGE AF-TIMI    Edoxaban_60_mg        253       7035
## 10: ENGAGE AF-TIMI          Warfarin        232       7036
```

Run the model using fixed-effects.


```r
M <- mtc.model(network, type="consistency", linearModel=effect)
plot(M)
```

![](mtcStroke_files/figure-html/strokeNetwork-1.png) 

```r
results <- mtc.run(M, n.adapt=nAdapt, n.iter=nIter, thin=thin)
```

# Summary

Direct and indirect odds ratios and 95% confidence bounds are stored in
[mtcStrokeOddsRatios.csv](mtcStrokeOddsRatios.csv).


```r
or <- combineResults()
write.csv(or, file="mtcStrokeOddsRatios.csv", row.names=FALSE)
show(or)
```

```
##               treatment     Apixaban 5 mg Dabigatran 110 mg
## 1:     Apixaban 5 mg vs                NA 0.87 (0.66, 1.14)
## 2: Dabigatran 110 mg vs 1.15 (0.88, 1.51)                NA
## 3: Dabigatran 150 mg vs 0.83 (0.63, 1.11) 0.72 (0.58, 0.90)
## 4:    Edoxaban 30 mg vs 0.99 (0.75, 1.29) 0.85 (0.64, 1.13)
## 5:    Edoxaban 60 mg vs 1.38 (1.07, 1.78) 1.20 (0.92, 1.57)
## 6: Rivaroxaban 20 mg vs 0.98 (0.75, 1.28) 0.85 (0.64, 1.12)
## 7:          Warfarin vs 1.26 (1.05, 1.51) 1.10 (0.89, 1.35)
##    Dabigatran 150 mg    Edoxaban 30 mg    Edoxaban 60 mg Rivaroxaban 20 mg
## 1: 1.21 (0.90, 1.60) 1.01 (0.78, 1.33) 0.72 (0.56, 0.93) 1.02 (0.78, 1.33)
## 2: 1.39 (1.11, 1.74) 1.17 (0.88, 1.55) 0.84 (0.64, 1.09) 1.17 (0.89, 1.56)
## 3:                NA 0.84 (0.63, 1.14) 0.60 (0.45, 0.80) 0.85 (0.63, 1.14)
## 4: 1.19 (0.88, 1.59)                NA 0.71 (0.59, 0.86) 1.01 (0.77, 1.32)
## 5: 1.67 (1.25, 2.21) 1.40 (1.16, 1.70)                NA 1.41 (1.09, 1.83)
## 6: 1.18 (0.88, 1.58) 0.99 (0.76, 1.31) 0.71 (0.55, 0.92)                NA
## 7: 1.52 (1.22, 1.88) 1.28 (1.05, 1.56) 0.92 (0.77, 1.09) 1.29 (1.07, 1.57)
##             Warfarin
## 1: 0.79 (0.66, 0.95)
## 2: 0.91 (0.74, 1.12)
## 3: 0.66 (0.53, 0.82)
## 4: 0.78 (0.64, 0.95)
## 5: 1.09 (0.92, 1.31)
## 6: 0.78 (0.64, 0.94)
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
##                                  Mean      SD Naive SE Time-series SE
## d.Warfarin.Apixaban_5_mg     -0.23291 0.09265 0.001036       0.001068
## d.Warfarin.Dabigatran_110_mg -0.09133 0.10473 0.001171       0.001299
## d.Warfarin.Dabigatran_150_mg -0.41861 0.11365 0.001271       0.001241
## d.Warfarin.Edoxaban_30_mg    -0.24838 0.09945 0.001112       0.001312
## d.Warfarin.Edoxaban_60_mg     0.08983 0.09166 0.001025       0.001061
## d.Warfarin.Rivaroxaban_20_mg -0.25468 0.09865 0.001103       0.001170
## 
## 2. Quantiles for each variable:
## 
##                                  2.5%      25%      50%      75%    97.5%
## d.Warfarin.Apixaban_5_mg     -0.41417 -0.29422 -0.23339 -0.17226 -0.04890
## d.Warfarin.Dabigatran_110_mg -0.29740 -0.16046 -0.09300 -0.02094  0.11425
## d.Warfarin.Dabigatran_150_mg -0.63362 -0.49729 -0.41894 -0.34071 -0.19834
## d.Warfarin.Edoxaban_30_mg    -0.44472 -0.31499 -0.24753 -0.18097 -0.05273
## d.Warfarin.Edoxaban_60_mg    -0.08567  0.02782  0.08743  0.15305  0.26756
## d.Warfarin.Rivaroxaban_20_mg -0.44951 -0.32073 -0.25417 -0.18816 -0.06482
## 
## 
## $DIC
##      Dbar        pD       DIC 
##  9.995553  9.993287 19.988840 
## 
## attr(,"class")
## [1] "summary.mtc.result"
```

Sampler diagnostics.


```r
gelman.plot(results)
```

![](mtcStroke_files/figure-html/strokeGelman-1.png) 

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

![](mtcStroke_files/figure-html/strokeTrace-1.png) ![](mtcStroke_files/figure-html/strokeTrace-2.png) 

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

![](mtcStroke_files/figure-html/strokeAnohe-1.png) ![](mtcStroke_files/figure-html/strokeAnohe-2.png) 

```
## Unrelated Mean Effects (UME) model:
```

![](mtcStroke_files/figure-html/strokeAnohe-3.png) ![](mtcStroke_files/figure-html/strokeAnohe-4.png) ![](mtcStroke_files/figure-html/strokeAnohe-5.png) 

```
## Consistency model:
```

![](mtcStroke_files/figure-html/strokeAnohe-6.png) ![](mtcStroke_files/figure-html/strokeAnohe-7.png) 
