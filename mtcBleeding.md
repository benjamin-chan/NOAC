# NOAC network meta-analysis: Bleeding
Benjamin Chan  
`r Sys.time()`  

[Back](README.md) to main page.

Read data.


```r
D <- readSheet("Bleeding")
D <- D[!is.na(label)]
D <- D[,
       `:=` (nWarfarin = as.numeric(nWarfarin),
             yWarfarin = as.numeric(yWarfarin))]
```

Hard-code data corrections and additions to the PETRO study.

> From: Marian McDonagh  
> Sent: Friday, March 11, 2016 4:17 PM  
> To: Benjamin Chan  
> Subject: Re: Network Meta-analysis  
> 
> Hi Ben,  
> Yes, I was noticing the Dabi 300mg problem.
> We should definitely exclude that dose as it is not used (too much bleeding).
> There were three dabi 150 arms (with varying aspirin doses).
> Since the aspirin made no difference, and other studies allow its use, we can use all 3 arms.
> But, the major bleeding events were still 0 across those.
> The total N for that is actually 169.
> And of course the 70 patients on warfarin with no events also.


```r
D <- D[label != "PETRO Dabigatran 300 mg"]
D <- D[label == "PETRO Dabigatran 150 mg", nNOAC := 169]
```

Tidy up the data and bias the warfarin arm of ROCKET-AF to be similar to the Rivaroxaban arm.


```r
D <- tidyData(D)
D <- biasROCKETAF()
write.csv(D, file="mtcBleedingData.csv", row.names=FALSE)
print(xtable(D, digits=rep(0, 5)), type="html", include.rownames=FALSE)
```

<!-- html table generated in R 3.2.2 by xtable 1.7-4 package -->
<!-- Fri Mar 11 20:33:04 2016 -->
<table border=1>
<tr> <th> study </th> <th> treatment </th> <th> responders </th> <th> sampleSize </th>  </tr>
  <tr> <td> ARISTOTLE </td> <td> Apixaban_5_mg </td> <td align="right"> 327 </td> <td align="right"> 9088 </td> </tr>
  <tr> <td> ARISTOTLE </td> <td> Warfarin </td> <td align="right"> 462 </td> <td align="right"> 9052 </td> </tr>
  <tr> <td> ARISTOTLE-J </td> <td> Apixaban_5_mg </td> <td align="right"> 0 </td> <td align="right"> 74 </td> </tr>
  <tr> <td> ARISTOTLE-J </td> <td> Warfarin </td> <td align="right"> 1 </td> <td align="right"> 74 </td> </tr>
  <tr> <td> ENGAGE AF-TIMI </td> <td> Edoxaban_30_mg </td> <td align="right"> 254 </td> <td align="right"> 7034 </td> </tr>
  <tr> <td> ENGAGE AF-TIMI </td> <td> Edoxaban_60_mg </td> <td align="right"> 418 </td> <td align="right"> 7035 </td> </tr>
  <tr> <td> ENGAGE AF-TIMI </td> <td> Warfarin </td> <td align="right"> 524 </td> <td align="right"> 7036 </td> </tr>
  <tr> <td> PETRO </td> <td> Dabigatran_150_mg </td> <td align="right"> 0 </td> <td align="right"> 169 </td> </tr>
  <tr> <td> PETRO </td> <td> Warfarin </td> <td align="right"> 0 </td> <td align="right"> 70 </td> </tr>
  <tr> <td> RE-LY </td> <td> Dabigatran_110_mg </td> <td align="right"> 322 </td> <td align="right"> 6015 </td> </tr>
  <tr> <td> RE-LY </td> <td> Dabigatran_150_mg </td> <td align="right"> 375 </td> <td align="right"> 6076 </td> </tr>
  <tr> <td> RE-LY </td> <td> Warfarin </td> <td align="right"> 397 </td> <td align="right"> 6022 </td> </tr>
  <tr> <td> ROCKET-AF </td> <td> Rivaroxaban_20_mg </td> <td align="right"> 395 </td> <td align="right"> 7081 </td> </tr>
  <tr> <td> ROCKET-AF </td> <td> Warfarin </td> <td align="right"> 396 </td> <td align="right"> 7090 </td> </tr>
  <tr> <td> Weitz, 2010 </td> <td> Edoxaban_30_mg </td> <td align="right"> 0 </td> <td align="right"> 235 </td> </tr>
  <tr> <td> Weitz, 2010 </td> <td> Edoxaban_60_mg </td> <td align="right"> 1 </td> <td align="right"> 234 </td> </tr>
  <tr> <td> Weitz, 2010 </td> <td> Warfarin </td> <td align="right"> 1 </td> <td align="right"> 250 </td> </tr>
  <tr> <td> Yamashita, 2012 </td> <td> Edoxaban_30_mg </td> <td align="right"> 0 </td> <td align="right"> 131 </td> </tr>
  <tr> <td> Yamashita, 2012 </td> <td> Edoxaban_60_mg </td> <td align="right"> 2 </td> <td align="right"> 131 </td> </tr>
  <tr> <td> Yamashita, 2012 </td> <td> Warfarin </td> <td align="right"> 0 </td> <td align="right"> 129 </td> </tr>
   </table>

```r
D <- D[!is.na(responders)]
network <- mtc.network(D)
```

Run the model using fixed-effects.



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
print(xtable(or), type="html", include.rownames=FALSE)
```

<!-- html table generated in R 3.2.2 by xtable 1.7-4 package -->
<!-- Fri Mar 11 20:33:33 2016 -->
<table border=1>
<tr> <th> treatment </th> <th> Apixaban 5 mg </th> <th> Dabigatran 110 mg </th> <th> Dabigatran 150 mg </th> <th> Edoxaban 30 mg </th> <th> Edoxaban 60 mg </th> <th> Rivaroxaban 20 mg </th> <th> Warfarin </th>  </tr>
  <tr> <td> Apixaban 5 mg vs </td> <td>  </td> <td> 0.87 (0.70, 1.07) </td> <td> 0.74 (0.61, 0.92) </td> <td> 1.49 (1.21, 1.84) </td> <td> 0.88 (0.72, 1.06) </td> <td> 0.69 (0.56, 0.85) </td> <td> 0.69 (0.60, 0.80) </td> </tr>
  <tr> <td> Dabigatran 110 mg vs </td> <td> 1.16 (0.94, 1.43) </td> <td>  </td> <td> 0.86 (0.74, 1.00) </td> <td> 1.72 (1.39, 2.15) </td> <td> 1.01 (0.83, 1.24) </td> <td> 0.80 (0.65, 0.98) </td> <td> 0.80 (0.69, 0.93) </td> </tr>
  <tr> <td> Dabigatran 150 mg vs </td> <td> 1.34 (1.09, 1.65) </td> <td> 1.16 (1.00, 1.36) </td> <td>  </td> <td> 2.00 (1.62, 2.48) </td> <td> 1.18 (0.97, 1.44) </td> <td> 0.93 (0.76, 1.14) </td> <td> 0.93 (0.80, 1.08) </td> </tr>
  <tr> <td> Edoxaban 30 mg vs </td> <td> 0.67 (0.54, 0.83) </td> <td> 0.58 (0.47, 0.72) </td> <td> 0.50 (0.40, 0.62) </td> <td>  </td> <td> 0.59 (0.50, 0.69) </td> <td> 0.47 (0.38, 0.57) </td> <td> 0.46 (0.40, 0.54) </td> </tr>
  <tr> <td> Edoxaban 60 mg vs </td> <td> 1.14 (0.94, 1.39) </td> <td> 0.99 (0.80, 1.21) </td> <td> 0.85 (0.70, 1.03) </td> <td> 1.70 (1.45, 2.00) </td> <td>  </td> <td> 0.79 (0.65, 0.96) </td> <td> 0.79 (0.69, 0.90) </td> </tr>
  <tr> <td> Rivaroxaban 20 mg vs </td> <td> 1.45 (1.18, 1.78) </td> <td> 1.25 (1.02, 1.53) </td> <td> 1.07 (0.88, 1.32) </td> <td> 2.15 (1.74, 2.66) </td> <td> 1.26 (1.04, 1.54) </td> <td>  </td> <td> 1.00 (0.87, 1.15) </td> </tr>
  <tr> <td> Warfarin vs </td> <td> 1.44 (1.25, 1.67) </td> <td> 1.25 (1.07, 1.46) </td> <td> 1.07 (0.93, 1.25) </td> <td> 2.15 (1.85, 2.52) </td> <td> 1.27 (1.11, 1.45) </td> <td> 1.00 (0.87, 1.15) </td> <td>  </td> </tr>
   </table>

# Forest plots, NOAC vs NOAC



```r
noac <- unique(D[treatment != "Warfarin", treatment])
for (i in 1:length(noac)) {
  forest(relative.effect(results, noac[i], noac[1:length(noac) != i]))
}
```

![](mtcBleeding_files/figure-html/forest-1.png) ![](mtcBleeding_files/figure-html/forest-2.png) ![](mtcBleeding_files/figure-html/forest-3.png) ![](mtcBleeding_files/figure-html/forest-4.png) ![](mtcBleeding_files/figure-html/forest-5.png) ![](mtcBleeding_files/figure-html/forest-6.png) 

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
##                                   Mean      SD  Naive SE Time-series SE
## d.Warfarin.Apixaban_5_mg     -0.368119 0.07562 0.0007562      0.0007787
## d.Warfarin.Dabigatran_110_mg -0.222908 0.07664 0.0007664      0.0008967
## d.Warfarin.Dabigatran_150_mg -0.071945 0.07435 0.0007435      0.0007635
## d.Warfarin.Edoxaban_30_mg    -0.767351 0.07917 0.0007917      0.0010366
## d.Warfarin.Edoxaban_60_mg    -0.236343 0.06782 0.0006782      0.0006867
## d.Warfarin.Rivaroxaban_20_mg -0.001221 0.07242 0.0007242      0.0007373
## 
## 2. Quantiles for each variable:
## 
##                                 2.5%      25%       50%      75%    97.5%
## d.Warfarin.Apixaban_5_mg     -0.5151 -0.41891 -0.367322 -0.31729 -0.22073
## d.Warfarin.Dabigatran_110_mg -0.3761 -0.27471 -0.222809 -0.17179 -0.07199
## d.Warfarin.Dabigatran_150_mg -0.2199 -0.12120 -0.071731 -0.02245  0.07362
## d.Warfarin.Edoxaban_30_mg    -0.9252 -0.82158 -0.766026 -0.71275 -0.61452
## d.Warfarin.Edoxaban_60_mg    -0.3689 -0.28228 -0.236198 -0.19110 -0.10199
## d.Warfarin.Rivaroxaban_20_mg -0.1432 -0.04939 -0.002324  0.04721  0.14014
## 
## 
## $DIC
##     Dbar       pD      DIC 
## 19.66423 13.38199 33.04622 
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
## 1     Apixaban_5_mg          Warfarin 98.50215 79.28030       NA
## 2 Dabigatran_110_mg Dabigatran_150_mg       NA       NA       NA
## 3 Dabigatran_110_mg          Warfarin       NA       NA       NA
## 4 Dabigatran_150_mg          Warfarin  0.00000  0.00000       NA
## 5    Edoxaban_30_mg    Edoxaban_60_mg 94.39879 86.75541       NA
## 6    Edoxaban_30_mg          Warfarin  0.00000  0.00000       NA
## 7    Edoxaban_60_mg          Warfarin 38.56286 88.82470       NA
## 8 Rivaroxaban_20_mg          Warfarin       NA       NA       NA
## 
## Global I-squared:
## -------------------------
## 
##    i2.pair  i2.cons
## 1 86.07656 61.78027
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
