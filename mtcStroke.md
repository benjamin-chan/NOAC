# NOAC network meta-analysis: Stroke
Benjamin Chan  
`r Sys.time()`  

[Back](README.md) to main page.

Read data.


```r
D <- readSheet("Strokeembolism")
```

Hard-code data corrections and additions to the PETRO study.

> From: Marian McDonagh  
> Sent: Friday, March 11, 2016 4:17 PM  
> To: Benjamin Chan  
> Subject: Re: Network Meta-analysis  
> 
> For stroke, you are right --- we can delete row 18, and correct the N for dabi 150 to be 169 in row 6.  
> 
> From: Benjamin Chan  
> Sent: Friday, March 11, 2016 4:08 PM  
> To: Marian McDonagh  
> Subject: RE: Network Meta-analysis  
> 
> Marian,
>  
> Also, for the stroke outcome, you have PETRO dabigatran 150 mg listed twice (rows 6 and 18).
> I'm guessing row 6 is for dabi 300 mg.
> Same question, though.
> Should I exclude the 300 mg arm?


```r
D <- D[1:(nrow(D) - 1)]
D <- D[label == "PETRO Dabigatran 150 mg", nNOAC := 169]
```

Tidy up the data.


```r
D <- tidyData(D)
D <- D[study != "ROCKET-AF"]
write.csv(D, file="mtcStrokeData.csv", row.names=FALSE)
print(xtable(D, digits=rep(0, 5)), type="html", include.rownames=FALSE)
```

<!-- html table generated in R 3.2.2 by xtable 1.7-4 package -->
<!-- Mon May 02 21:05:47 2016 -->
<table border=1>
<tr> <th> study </th> <th> treatment </th> <th> responders </th> <th> sampleSize </th>  </tr>
  <tr> <td> ARISTOTLE </td> <td> Apixaban_5_mg </td> <td align="right"> 212 </td> <td align="right"> 9120 </td> </tr>
  <tr> <td> ARISTOTLE </td> <td> Warfarin </td> <td align="right"> 265 </td> <td align="right"> 9081 </td> </tr>
  <tr> <td> ARISTOTLE-J </td> <td> Apixaban_5_mg </td> <td align="right"> 0 </td> <td align="right"> 74 </td> </tr>
  <tr> <td> ARISTOTLE-J </td> <td> Warfarin </td> <td align="right"> 3 </td> <td align="right"> 74 </td> </tr>
  <tr> <td> ENGAGE AF-TIMI </td> <td> Edoxaban_30_mg </td> <td align="right"> 253 </td> <td align="right"> 7002 </td> </tr>
  <tr> <td> ENGAGE AF-TIMI </td> <td> Edoxaban_60_mg </td> <td align="right"> 182 </td> <td align="right"> 7012 </td> </tr>
  <tr> <td> ENGAGE AF-TIMI </td> <td> Warfarin </td> <td align="right"> 232 </td> <td align="right"> 7012 </td> </tr>
  <tr> <td> J-ROCKET </td> <td> Rivaroxaban_15_mg </td> <td align="right"> 11 </td> <td align="right"> 637 </td> </tr>
  <tr> <td> J-ROCKET </td> <td> Warfarin </td> <td align="right"> 22 </td> <td align="right"> 637 </td> </tr>
  <tr> <td> Mao, 2014 </td> <td> Rivaroxaban_20_mg </td> <td align="right"> 5 </td> <td align="right"> 177 </td> </tr>
  <tr> <td> Mao, 2014 </td> <td> Warfarin </td> <td align="right"> 7 </td> <td align="right"> 176 </td> </tr>
  <tr> <td> PETRO </td> <td> Dabigatran_150_mg </td> <td align="right"> 0 </td> <td align="right"> 169 </td> </tr>
  <tr> <td> PETRO </td> <td> Warfarin </td> <td align="right"> 0 </td> <td align="right"> 70 </td> </tr>
  <tr> <td> RE-LY </td> <td> Dabigatran_110_mg </td> <td align="right"> 182 </td> <td align="right"> 6015 </td> </tr>
  <tr> <td> RE-LY </td> <td> Dabigatran_150_mg </td> <td align="right"> 134 </td> <td align="right"> 6076 </td> </tr>
  <tr> <td> RE-LY </td> <td> Warfarin </td> <td align="right"> 199 </td> <td align="right"> 6022 </td> </tr>
  <tr> <td> Weitz, 2010 </td> <td> Edoxaban_30_mg </td> <td align="right"> 1 </td> <td align="right"> 235 </td> </tr>
  <tr> <td> Weitz, 2010 </td> <td> Edoxaban_60_mg </td> <td align="right"> 1 </td> <td align="right"> 234 </td> </tr>
  <tr> <td> Weitz, 2010 </td> <td> Warfarin </td> <td align="right"> 4 </td> <td align="right"> 250 </td> </tr>
  <tr> <td> Yamashita, 2012 </td> <td> Edoxaban_30_mg </td> <td align="right"> 0 </td> <td align="right"> 131 </td> </tr>
  <tr> <td> Yamashita, 2012 </td> <td> Edoxaban_60_mg </td> <td align="right"> 0 </td> <td align="right"> 131 </td> </tr>
  <tr> <td> Yamashita, 2012 </td> <td> Warfarin </td> <td align="right"> 0 </td> <td align="right"> 129 </td> </tr>
   </table>

```r
network <- mtc.network(D)
```

Run the model using fixed-effects.



```r
M <- mtc.model(network, type="consistency", linearModel=effect)
plot(M)
```

![](mtcStroke_files/figure-html/network-1.png) 

```r
results <- mtc.run(M, n.adapt=nAdapt, n.iter=nIter, thin=thin)
```

# Summary

Direct and indirect odds ratios and 95% confidence bounds are stored in
[mtcStrokeOddsRatios.csv](mtcStrokeOddsRatios.csv).


```r
or <- combineResults()
write.csv(or, file="mtcStrokeOddsRatios.csv", row.names=FALSE)
print(xtable(or), type="html", include.rownames=FALSE)
```

<!-- html table generated in R 3.2.2 by xtable 1.7-4 package -->
<!-- Mon May 02 21:06:11 2016 -->
<table border=1>
<tr> <th> treatment </th> <th> Apixaban 5 mg </th> <th> Dabigatran 110 mg </th> <th> Dabigatran 150 mg </th> <th> Edoxaban 30 mg </th> <th> Edoxaban 60 mg </th> <th> Rivaroxaban 15 mg </th> <th> Warfarin </th>  </tr>
  <tr> <td> Apixaban 5 mg vs </td> <td>  </td> <td> 0.86 (0.65, 1.13) </td> <td> 1.19 (0.89, 1.58) </td> <td> 0.72 (0.56, 0.93) </td> <td> 1.02 (0.78, 1.33) </td> <td> 1.63 (0.77, 3.56) </td> <td> 0.78 (0.65, 0.94) </td> </tr>
  <tr> <td> Dabigatran 110 mg vs </td> <td> 1.17 (0.88, 1.54) </td> <td>  </td> <td> 1.38 (1.10, 1.74) </td> <td> 0.85 (0.64, 1.11) </td> <td> 1.19 (0.89, 1.58) </td> <td> 1.88 (0.90, 4.13) </td> <td> 0.91 (0.74, 1.12) </td> </tr>
  <tr> <td> Dabigatran 150 mg vs </td> <td> 0.84 (0.63, 1.12) </td> <td> 0.72 (0.58, 0.91) </td> <td>  </td> <td> 0.61 (0.46, 0.81) </td> <td> 0.86 (0.64, 1.15) </td> <td> 1.36 (0.64, 3.04) </td> <td> 0.66 (0.53, 0.82) </td> </tr>
  <tr> <td> Edoxaban 30 mg vs </td> <td> 1.38 (1.07, 1.78) </td> <td> 1.18 (0.90, 1.56) </td> <td> 1.64 (1.23, 2.18) </td> <td>  </td> <td> 1.40 (1.16, 1.70) </td> <td> 2.24 (1.07, 4.96) </td> <td> 1.08 (0.90, 1.30) </td> </tr>
  <tr> <td> Edoxaban 60 mg vs </td> <td> 0.98 (0.75, 1.28) </td> <td> 0.84 (0.63, 1.12) </td> <td> 1.17 (0.87, 1.57) </td> <td> 0.71 (0.59, 0.87) </td> <td>  </td> <td> 1.60 (0.76, 3.51) </td> <td> 0.77 (0.63, 0.94) </td> </tr>
  <tr> <td> Rivaroxaban 15 mg vs </td> <td> 0.61 (0.28, 1.30) </td> <td> 0.53 (0.24, 1.12) </td> <td> 0.73 (0.33, 1.55) </td> <td> 0.45 (0.20, 0.94) </td> <td> 0.63 (0.28, 1.32) </td> <td>  </td> <td> 0.48 (0.22, 1.00) </td> </tr>
  <tr> <td> Rivaroxaban 20 mg vs </td> <td> 0.87 (0.24, 2.93) </td> <td> 0.75 (0.20, 2.52) </td> <td> 1.04 (0.28, 3.53) </td> <td> 0.64 (0.17, 2.14) </td> <td> 0.89 (0.24, 3.00) </td> <td> 1.43 (0.32, 5.78) </td> <td> 0.68 (0.19, 2.27) </td> </tr>
  <tr> <td> Warfarin vs </td> <td> 1.28 (1.06, 1.54) </td> <td> 1.09 (0.89, 1.35) </td> <td> 1.52 (1.22, 1.89) </td> <td> 0.92 (0.77, 1.11) </td> <td> 1.30 (1.06, 1.58) </td> <td> 2.07 (1.00, 4.45) </td> <td>  </td> </tr>
   </table>

# Forest plots, NOAC vs NOAC



```r
noac <- unique(D[treatment != "Warfarin", treatment])
for (i in 1:length(noac)) {
  forest(relative.effect(results, noac[i], noac[1:length(noac) != i]))
}
```

![](mtcStroke_files/figure-html/forest-1.png) ![](mtcStroke_files/figure-html/forest-2.png) ![](mtcStroke_files/figure-html/forest-3.png) ![](mtcStroke_files/figure-html/forest-4.png) ![](mtcStroke_files/figure-html/forest-5.png) ![](mtcStroke_files/figure-html/forest-6.png) ![](mtcStroke_files/figure-html/forest-7.png) 

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
## Iterations = 5010:30000
## Thinning interval = 10 
## Number of chains = 4 
## Sample size per chain = 2500 
## 
## 1. Empirical mean and standard deviation for each variable,
##    plus standard error of the mean:
## 
##                                  Mean      SD  Naive SE Time-series SE
## d.Warfarin.Apixaban_5_mg     -0.24414 0.09413 0.0009413      0.0009843
## d.Warfarin.Dabigatran_110_mg -0.09051 0.10428 0.0010428      0.0011321
## d.Warfarin.Dabigatran_150_mg -0.41618 0.11174 0.0011174      0.0011174
## d.Warfarin.Edoxaban_30_mg     0.07780 0.09194 0.0009194      0.0010075
## d.Warfarin.Edoxaban_60_mg    -0.26147 0.09992 0.0009992      0.0010039
## d.Warfarin.Rivaroxaban_15_mg -0.73311 0.37714 0.0037714      0.0042991
## d.Warfarin.Rivaroxaban_20_mg -0.38620 0.62866 0.0062866      0.0069000
## 
## 2. Quantiles for each variable:
## 
##                                 2.5%      25%      50%      75%     97.5%
## d.Warfarin.Apixaban_5_mg     -0.4315 -0.30703 -0.24473 -0.18079 -0.060347
## d.Warfarin.Dabigatran_110_mg -0.2975 -0.15921 -0.08995 -0.02073  0.115644
## d.Warfarin.Dabigatran_150_mg -0.6353 -0.49155 -0.41562 -0.34128 -0.199767
## d.Warfarin.Edoxaban_30_mg    -0.1013  0.01557  0.07831  0.13985  0.258788
## d.Warfarin.Edoxaban_60_mg    -0.4566 -0.32837 -0.26193 -0.19478 -0.062582
## d.Warfarin.Rivaroxaban_15_mg -1.4930 -0.98551 -0.72989 -0.47912 -0.003088
## d.Warfarin.Rivaroxaban_20_mg -1.6727 -0.78684 -0.38116  0.03716  0.819039
## 
## 
## $DIC
##     Dbar       pD      DIC 
## 20.19910 14.19016 34.38926 
## 
## attr(,"class")
## [1] "summary.mtc.result"
```

Sampler diagnostics.


```r
gelman.plot(results)
```

![](mtcStroke_files/figure-html/gelman-1.png) 

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
## d.Warfarin.Rivaroxaban_15_mg          1          1
## d.Warfarin.Rivaroxaban_20_mg          1          1
## 
## Multivariate psrf
## 
## 1
```


```r
plot(results)
```

![](mtcStroke_files/figure-html/trace-1.png) ![](mtcStroke_files/figure-html/trace-2.png) 


```r
autocorr.plot(results$samples)
```

![](mtcStroke_files/figure-html/autocorr-1.png) ![](mtcStroke_files/figure-html/autocorr-2.png) ![](mtcStroke_files/figure-html/autocorr-3.png) ![](mtcStroke_files/figure-html/autocorr-4.png) 

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
## 1     Apixaban_5_mg          Warfarin 98.27668 95.47972       NA
## 2 Dabigatran_110_mg Dabigatran_150_mg       NA       NA       NA
## 3 Dabigatran_110_mg          Warfarin       NA       NA       NA
## 4 Dabigatran_150_mg          Warfarin  0.00000  0.00000       NA
## 5    Edoxaban_30_mg    Edoxaban_60_mg  0.00000  0.00000       NA
## 6    Edoxaban_30_mg          Warfarin 78.91836 76.95923       NA
## 7    Edoxaban_60_mg          Warfarin 63.09716 53.93105       NA
## 8 Rivaroxaban_15_mg          Warfarin       NA       NA       NA
## 9 Rivaroxaban_20_mg          Warfarin       NA       NA       NA
## 
## Global I-squared:
## -------------------------
## 
##    i2.pair  i2.cons
## 1 78.19697 55.21054
```

```r
plot(anohe)
```

```
## Analysis of heterogeneity -- convergence plots
## Unrelated Study Effects (USE) model:
```

![](mtcStroke_files/figure-html/anohe-1.png) ![](mtcStroke_files/figure-html/anohe-2.png) ![](mtcStroke_files/figure-html/anohe-3.png) ![](mtcStroke_files/figure-html/anohe-4.png) 

```
## Unrelated Mean Effects (UME) model:
```

![](mtcStroke_files/figure-html/anohe-5.png) ![](mtcStroke_files/figure-html/anohe-6.png) ![](mtcStroke_files/figure-html/anohe-7.png) ![](mtcStroke_files/figure-html/anohe-8.png) 

```
## Consistency model:
```

![](mtcStroke_files/figure-html/anohe-9.png) ![](mtcStroke_files/figure-html/anohe-10.png) 
