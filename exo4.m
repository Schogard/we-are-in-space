Corners = [ 156, 315;283, 297; 339, 270;31, 30]
A=[31, 30]
B=[339, 270]
C=[283, 297]
D=[156, 315]
Width=max(Corners(:, 1))
Height=max(Corners(:, 2))
C0= [
190, 309;
191, 309;
192, 309;
193, 309;
194, 309;
185, 308;
186, 308;
187, 308;
189, 308;
199, 308;
200, 308;
201, 308;
183, 307;
184, 307;
205, 307;
206, 307;
180, 306;
181, 306;
207, 306;
208, 306;
210, 306;
179, 305;
211, 305;
212, 305;
175, 304;
177, 304;
214, 304;
174, 303;
215, 303;
216, 303;
172, 302;
218, 302;
170, 301;
219, 301;
221, 301;
168, 300;
223, 300;
166, 299;
224, 299;
226, 298;
271, 298;
272, 298;
164, 297;
228, 297;
271, 297;
272, 297;
275, 297;
276, 297;
277, 297;
161, 296;
230, 296;
272, 296;
273, 296;
278, 296;
279, 296;
280, 296;
232, 295;
273, 295;
274, 295;
281, 295;
282, 295;
283, 295;
158, 294;
234, 294;
274, 294;
275, 294;
284, 294;
285, 294;
155, 293;
236, 293;
275, 293;
276, 293;
286, 293;
287, 293;
238, 292;
277, 292;
278, 292;
288, 292;
290, 292;
152, 291;
240, 291;
278, 291;
291, 291;
292, 291;
242, 290;
279, 290;
280, 290;
294, 290;
295, 290;
281, 289;
296, 289;
148, 288;
244, 288;
282, 288;
298, 288;
299, 288;
247, 287;
283, 287;
301, 287;
144, 286;
249, 286;
285, 286;
303, 286;
304, 286;
286, 285;
306, 285;
252, 284;
287, 284;
288, 284;
307, 284;
254, 283;
290, 283;
257, 282;
312, 282;
291, 281;
259, 280;
292, 280;
317, 280;
262, 279;
294, 279;
319, 279;
295, 278;
265, 277;
297, 277;
268, 276;
298, 276;
300, 275;
270, 274;
301, 274;
273, 273;
303, 272;
276, 271;
304, 271;
279, 270;
306, 270;
307, 269;
282, 268;
285, 267;
309, 267;
287, 266;
310, 266;
311, 265;
290, 264;
313, 264;
293, 263;
314, 263;
296, 262;
315, 262;
298, 260;
316, 260;
301, 259;
317, 259;
303, 258;
318, 258;
305, 257;
308, 257;
319, 257;
309, 256;
319, 256;
311, 255;
313, 255;
319, 255;
314, 254;
316, 254;
317, 254;
];
X=[41.2549
   42.8085
   44.3937
   46.0115
   47.6631
   33.4756
   34.8416
   36.2334
   39.0973
   55.2452
   57.0511
   58.8962
   30.4628
   31.7420
   65.1079
   67.0857
   26.5192
   27.7008
   67.4591
   69.4431
   73.5451
   25.1597
   73.7873
   75.8661
   20.7233
   22.8140
   78.1407
   19.6434
   78.2837
   80.3704
   17.6763
   82.5564
   15.8439
   82.6074
   86.8380
   14.1328
   88.9423
   12.5313
   88.8650
   90.8885
  270.4018
  278.0593
   11.1371
   92.8744
  256.7532
  263.7326
  286.3481
  294.5029
  302.9980
    9.0133
   94.8234
  250.8966
  257.5267
  294.6687
  303.0098
  311.6996
   96.7368
  245.4264
  251.7375
  303.0211
  311.5498
  320.4359
    7.1996
   98.6154
  240.3056
  246.3244
  311.4055
  320.1233
    5.3760
  100.4602
  235.5017
  241.2519
  311.2664
  319.8222
  102.2721
  236.4888
  242.1703
  311.1321
  328.2713
    3.8709
  104.0520
  232.0076
  319.2517
  327.8286
  105.8007
  227.7840
  233.0005
  327.4015
  336.1568
  228.8057
  326.9893
    2.1393
  105.0635
  224.8423
  326.5911
  335.0265
  108.7781
  221.0916
  334.4903
    0.3882
  110.4123
  222.1305
  333.9722
  342.4181
  218.5926
  341.7656
  111.5557
  215.2328
  219.6227
  332.9863
  113.1130
  220.6282
  116.6837
  339.9336
  210.0610
  115.6397
  207.1688
  346.6847
  119.0974
  208.2176
  346.0155
  205.4621
  119.9631
  206.4946
  123.3447
  203.8645
  204.8806
  122.1474
  202.3658
  125.4275
  197.6401
  126.1055
  195.4173
  129.3171
  196.4230
  194.2864
  129.8947
  133.0405
  190.2502
  134.2465
  188.3419
  186.5017
  134.7023
  187.4849
  137.7644
  185.7066
  140.8311
  183.9891
  139.2509
  178.2038
  142.2338
  176.7046
  143.3138
  175.2528
  144.3794
  150.1720
  173.8464
  149.2537
  170.2024
  150.2813
  154.2078
  166.7240
  153.2385
  157.2120
  159.2436]
Y=[  309.8177
  311.3727
  312.9595
  314.5789
  316.2320
  292.4980
  293.7762
  295.0785
  297.7583
  312.8681
  314.5579
  316.2844
  280.7777
  281.8951
  311.0409
  312.7685
  269.0715
  270.0335
  302.4030
  304.0182
  307.3579
  260.1483
  296.9808
  298.5553
  249.5529
  251.0230
  289.9286
  241.9231
  280.1135
  281.4725
  234.1565
  273.1820
  226.9214
  263.8935
  266.2363
  220.1652
  258.1656
  213.8419
  249.2568
  241.5823
  317.2709
  320.4995
  202.9161
  234.0511
  296.4751
  299.1336
  307.7482
  310.8545
  314.0904
  197.3370
  226.6592
  279.9908
  282.2564
  294.9482
  297.7984
  300.7678
  219.4027
  264.5942
  266.5124
  282.0991
  284.6913
  287.3920
  187.8237
  212.2780
  250.1810
  251.7911
  269.2007
  271.5328
  183.1877
  205.2816
  236.6600
  237.9961
  254.2647
  256.2528
  198.4099
  225.0425
  226.1699
  239.8540
  243.2549
  175.0645
  191.6597
  212.8557
  227.3078
  228.7286
  185.0278
  201.3696
  202.0684
  214.7150
  215.8880
  191.0429
  201.1876
  164.2188
  171.8013
  180.6255
  188.1214
  188.7428
  165.7176
  170.7672
  175.8656
  157.7004
  159.5872
  161.5030
  163.4209
  163.5657
  152.5137
  151.3059
  147.7033
  143.9769
  143.8191
  139.7445
  141.9230
  135.3326
  136.0605
  116.8822
  120.3281
  125.3968
  113.2226
   94.6658
  119.7097
  105.8458
   84.4094
   99.2989
  109.5134
   92.3094
  103.9444
   86.2650
   79.6293
   94.8487
   74.0382
   89.4382
   63.5317
   80.4521
   58.5897
   75.1487
   52.7922
   48.1962
   66.6700
   61.4696
   39.5137
   57.0388
   35.4088
   31.4502
   49.1838
   26.4415
   44.1146
   22.7400
   39.0380
   19.1648
   32.6392
   13.6004
   27.6949
   10.3753
   23.7273
    7.2524
   19.8125
   16.7487
    4.2269
   13.8784
    2.5299
   10.0236
    7.8473
    0.9099
    5.1189
    2.8677
    1.7167]
plot(X, Y, 'ob');
hold on;
opts = fitoptions('Method','NonlinearLeastSquares');
ft=fittype('a*sin(b*x+c)+d');
opts.StartPoint=[]
[fitResult, gof, output] = fit(X, Y, ft, opts );
plot(fitResult);