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

Tidy up the data and exclude the ROCKET-AF study.


```r
D <- tidyData(D)
D <- D[study != "ROCKET-AF"]
write.csv(D, file="mtcBleedingData.csv", row.names=FALSE)
print(xtable(D, digits=rep(0, 5)), type="html", include.rownames=FALSE)
```

<!-- html table generated in R 3.2.2 by xtable 1.7-4 package -->
<!-- Mon May 02 21:08:12 2016 -->
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
<!-- Mon May 02 21:08:30 2016 -->
<table border=1>
<tr> <th> treatment </th> <th> Apixaban 5 mg </th> <th> Dabigatran 110 mg </th> <th> Dabigatran 150 mg </th> <th> Edoxaban 30 mg </th> <th> Edoxaban 60 mg </th> <th> Warfarin </th>  </tr>
  <tr> <td> Apixaban 5 mg vs </td> <td>  </td> <td> 0.86 (0.70, 1.07) </td> <td> 0.74 (0.60, 0.91) </td> <td> 1.49 (1.21, 1.83) </td> <td> 0.88 (0.72, 1.07) </td> <td> 0.69 (0.60, 0.80) </td> </tr>
  <tr> <td> Dabigatran 110 mg vs </td> <td> 1.16 (0.93, 1.43) </td> <td>  </td> <td> 0.86 (0.74, 1.00) </td> <td> 1.73 (1.39, 2.15) </td> <td> 1.01 (0.83, 1.24) </td> <td> 0.80 (0.69, 0.93) </td> </tr>
  <tr> <td> Dabigatran 150 mg vs </td> <td> 1.35 (1.09, 1.66) </td> <td> 1.16 (1.00, 1.36) </td> <td>  </td> <td> 2.01 (1.63, 2.48) </td> <td> 1.18 (0.97, 1.44) </td> <td> 0.93 (0.80, 1.08) </td> </tr>
  <tr> <td> Edoxaban 30 mg vs </td> <td> 0.67 (0.55, 0.82) </td> <td> 0.58 (0.47, 0.72) </td> <td> 0.50 (0.40, 0.61) </td> <td>  </td> <td> 0.59 (0.50, 0.69) </td> <td> 0.46 (0.40, 0.54) </td> </tr>
  <tr> <td> Edoxaban 60 mg vs </td> <td> 1.14 (0.94, 1.38) </td> <td> 0.99 (0.80, 1.21) </td> <td> 0.85 (0.69, 1.03) </td> <td> 1.70 (1.46, 1.99) </td> <td>  </td> <td> 0.79 (0.69, 0.90) </td> </tr>
  <tr> <td> Warfarin vs </td> <td> 1.44 (1.25, 1.67) </td> <td> 1.25 (1.07, 1.45) </td> <td> 1.07 (0.93, 1.24) </td> <td> 2.15 (1.85, 2.51) </td> <td> 1.27 (1.11, 1.45) </td> <td>  </td> </tr>
   </table>

# Forest plots, NOAC vs NOAC



```r
noac <- unique(D[treatment != "Warfarin", treatment])
for (i in 1:length(noac)) {
  forest(relative.effect(results, noac[i], noac[1:length(noac) != i]))
}
```

![](mtcBleeding_files/figure-html/forest-1.png) ![](mtcBleeding_files/figure-html/forest-2.png) ![](mtcBleeding_files/figure-html/forest-3.png) ![](mtcBleeding_files/figure-html/forest-4.png) ![](mtcBleeding_files/figure-html/forest-5.png) 

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
## d.Warfarin.Apixaban_5_mg     -0.36764 0.07328 0.0007328      0.0007423
## d.Warfarin.Dabigatran_110_mg -0.22098 0.07792 0.0007792      0.0009123
## d.Warfarin.Dabigatran_150_mg -0.07013 0.07484 0.0007484      0.0007568
## d.Warfarin.Edoxaban_30_mg    -0.76730 0.07732 0.0007732      0.0009380
## d.Warfarin.Edoxaban_60_mg    -0.23592 0.06876 0.0006876      0.0006874
## 
## 2. Quantiles for each variable:
## 
##                                 2.5%     25%      50%      75%    97.5%
## d.Warfarin.Apixaban_5_mg     -0.5103 -0.4174 -0.36705 -0.31775 -0.22359
## d.Warfarin.Dabigatran_110_mg -0.3713 -0.2742 -0.22175 -0.16788 -0.06802
## d.Warfarin.Dabigatran_150_mg -0.2177 -0.1200 -0.06938 -0.01963  0.07417
## d.Warfarin.Edoxaban_30_mg    -0.9204 -0.8190 -0.76634 -0.71533 -0.61680
## d.Warfarin.Edoxaban_60_mg    -0.3706 -0.2817 -0.23703 -0.18857 -0.10129
## 
## 
## $DIC
##     Dbar       pD      DIC 
## 17.62041 11.33445 28.95486 
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
## 1     Apixaban_5_mg          Warfarin 99.07724 72.00945       NA
## 2 Dabigatran_110_mg Dabigatran_150_mg       NA       NA       NA
## 3 Dabigatran_110_mg          Warfarin       NA       NA       NA
## 4 Dabigatran_150_mg          Warfarin  0.00000  0.00000       NA
## 5    Edoxaban_30_mg    Edoxaban_60_mg 95.43381 82.76788       NA
## 6    Edoxaban_30_mg          Warfarin 40.70606  0.00000       NA
## 7    Edoxaban_60_mg          Warfarin 65.47564 84.34868       NA
## 
## Global I-squared:
## -------------------------
## 
##    i2.pair  i2.cons
## 1 91.33637 52.46948
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

![](mtcBleeding_files/figure-html/anohe-5.png) ![](mtcBleeding_files/figure-html/anohe-6.png) 

```
## Consistency model:
```

![](mtcBleeding_files/figure-html/anohe-7.png) ![](mtcBleeding_files/figure-html/anohe-8.png) 
