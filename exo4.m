Corners = [ 156, 315;283, 297; 339, 270;31, 30]
A=[31, 30]
B=[339, 270]
C=[283, 297]
D=[156, 315]
Width=max(Corners(:, 1))
Height=max(Corners(:, 2))
C1= [
152, 304;
154, 304;
156, 304;
158, 303;
160, 303;
162, 302;
164, 301;
166, 300;
168, 299;
170, 298;
233, 297;
234, 297;
235, 297;
236, 297;
237, 297;
238, 297;
172, 296;
233, 296;
239, 296;
240, 296;
174, 295;
241, 295;
242, 295;
232, 294;
244, 294;
246, 294;
271, 294;
272, 294;
176, 293;
232, 293;
247, 293;
271, 293;
273, 293;
274, 293;
232, 292;
249, 292;
271, 292;
272, 292;
276, 292;
291, 292;
292, 292;
179, 291;
232, 291;
251, 291;
273, 291;
279, 291;
280, 291;
293, 291;
294, 291;
232, 290;
253, 290;
273, 290;
274, 290;
281, 290;
293, 290;
296, 290;
181, 289;
233, 289;
255, 289;
275, 289;
283, 289;
285, 289;
294, 289;
295, 289;
257, 288;
276, 288;
286, 288;
296, 288;
297, 288;
183, 287;
233, 287;
259, 287;
277, 287;
288, 287;
298, 287;
233, 286;
278, 286;
290, 286;
299, 286;
186, 285;
262, 285;
279, 285;
292, 285;
294, 285;
301, 285;
302, 285;
234, 284;
264, 284;
281, 284;
296, 284;
303, 284;
188, 283;
234, 283;
266, 283;
282, 283;
297, 283;
304, 283;
269, 282;
283, 282;
299, 282;
305, 282;
307, 282;
191, 281;
234, 281;
271, 281;
284, 281;
301, 281;
303, 281;
308, 281;
285, 280;
304, 280;
309, 280;
310, 280;
194, 279;
235, 279;
274, 279;
286, 279;
306, 279;
307, 279;
310, 279;
311, 279;
276, 278;
287, 278;
309, 278;
310, 278;
311, 278;
312, 278;
197, 277;
235, 277;
278, 277;
288, 277;
311, 277;
312, 277;
280, 276;
282, 276;
289, 276;
235, 275;
284, 275;
290, 275;
200, 274;
286, 274;
287, 274;
290, 274;
235, 273;
288, 273;
289, 273;
290, 273;
203, 272;
235, 272;
206, 270;
235, 270;
209, 268;
235, 268;
234, 267;
212, 266;
215, 265;
233, 265;
218, 264;
232, 264;
221, 263;
231, 263;
223, 262;
225, 262;
228, 262;
229, 262;
];

X=[    0.4849
    1.7369
    3.8822
    7.5136
   50.7357
   51.9693
   53.2216
   55.7843
   57.0956
    8.9828
   48.8329
   58.8200
   61.5128
  108.3707
  110.5953
  112.8650
   47.0353
   63.2207
  103.7054
  112.3372
  114.6039
  164.9430
  168.4017
  171.9476
   10.5400
   45.3344
   64.9047
  101.3555
  116.3113
  159.8375
  169.9091
  173.4338
  218.9322
  223.7965
  233.9664
  281.6392
  288.5364
  344.5166
   12.6273
   43.7226
   66.5653
   99.1296
  117.9881
  122.6442
  155.0726
  171.3832
  178.4778
  210.7939
  215.3449
  229.8003
  234.9061
  269.0524
  275.4067
  281.9760
  288.7716
  295.8054
  343.7923
   42.1932
   97.0181
  124.2821
  153.5743
  179.8762
  211.9449
  235.8208
  269.5572
  288.9996
  295.9275
  326.2062
  343.0932
   14.0809
   67.0921
   95.0125
  125.8906
  152.1387
  177.6976
  208.7178
  231.7121
  241.8583
  258.2505
  264.0567
  296.0459
  317.9872
  325.8341
   40.3084
   70.0353
   94.8519
  127.4705
  150.7621
  179.0575
  201.5588
  205.6509
  237.5792
  264.6093
  289.4352
  317.7585
  325.4740
   15.4773
   38.0398
   71.6045
   92.9784
  129.0226
  146.7019
  180.3884
  187.4761
  202.7324
  296.2721
  317.5369
   73.1527
   91.1929
  130.5476
  145.4993
  185.1706
  192.3822
  199.9518
  249.3614
  303.1305
  310.1073
   17.4788
   36.4487
   89.4895
  129.7267
  134.4104
  141.7855
  189.9635
  193.5877
   74.8235
   77.5724
   87.8625
  133.5190
  135.8769
  138.2803
   19.4238
   34.9791
   77.6758
   84.8144
   20.7082
   79.1443
   80.5320
   22.6537
   31.2850
   24.6011
   28.1201
   29.5787
   25.8576]
Y=[  190.1487
  190.5292
  186.9363
  179.6069
  188.1835
  188.4283
  188.6768
  189.1853
  189.4455
  175.9113
  182.5126
  184.1669
  184.6130
  192.3751
  192.7436
  193.1196
  177.1551
  179.3235
  184.7471
  185.9035
  186.2071
  192.9509
  193.4143
  193.8893
  168.4909
  172.0859
  174.1080
  177.8743
  179.4195
  183.9168
  184.9575
  185.3217
  190.0227
  190.5253
  191.5761
  196.5018
  197.2145
  202.9986
  164.9915
  167.2823
  168.9651
  171.3642
  172.7535
  173.0965
  175.4855
  176.6871
  177.2098
  179.5905
  179.9258
  180.9907
  181.3669
  183.8825
  184.3506
  184.8345
  185.3352
  185.8534
  189.3886
  162.7239
  165.1888
  166.4146
  167.7316
  168.9141
  170.3560
  171.4294
  172.9462
  173.8203
  174.1318
  175.4932
  176.2524
  157.9352
  158.8443
  159.3231
  159.8526
  160.3027
  160.7410
  161.2730
  161.6673
  161.8413
  162.1224
  162.2220
  162.7705
  163.1468
  163.2813
  154.2620
  153.9705
  153.7271
  153.4073
  153.1789
  152.9014
  152.6807
  152.6406
  152.3275
  152.0625
  151.8190
  151.5413
  151.4656
  151.1565
  150.3456
  149.1392
  148.3710
  147.0755
  146.4400
  145.2293
  144.9745
  144.4262
  141.0641
  140.2998
  144.3724
  143.2666
  140.8543
  139.9378
  137.5061
  137.0640
  136.6000
  133.5713
  130.2754
  129.8478
  144.5828
  142.9531
  138.3967
  134.9401
  134.5377
  133.9042
  129.7654
  129.4541
  135.1770
  134.8752
  133.7454
  128.7323
  128.4734
  128.2095
  138.1943
  136.1253
  130.4463
  129.4968
  135.0155
  125.9249
  125.7090
  131.7458
  130.2138
  128.4730
  127.7734
  127.4834
  125.3493]
plot(X, Y, 'ob');
hold on;
%to find frequency, approximate as a 12deg polyn
[Xsort, index]=sort(X)
Ysort=Y(index)
polyn = polyfit(Xsort,Ysort,20);
plot(Xsort,polyval(polyn,Xsort));

%find the points where the polyn is mean(Y)
polyn(end)=polyn(end)-mean(Y)
sols=roots(polyn)
Xmax=max(X);

sols=sols(find(0<sols & sols<Xmax & conj(sols)==sols)) %check if solutions are in domain and real
dist=sols(end)-sols(end-1)


hold on;
opts = fitoptions('Method','NonlinearLeastSquares');
ft=fittype('a*sin(b*x+c)+d');
[sortY, index]=sort(Y, 'descend');
freq=dist
opts.StartPoint=[abs((max(Y)-min(Y))/2), pi/abs(freq), Y(1), mean(Y)]
[fitResult, gof, output] = fit(X, Y, ft, opts );
plot(fitResult);
hold off;