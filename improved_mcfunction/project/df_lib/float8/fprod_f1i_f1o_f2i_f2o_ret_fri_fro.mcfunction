

score I1 is #f1i float
score O1 is #f1o float
score I2 is #f2i float
score O2 is #f20 float
score I3 is #fri float
score O3 is #fr0 float

score O2_I1_big is #O2_I1_big float 
score O2_I1_sml is #O2_I1_sml float
score O1_I2_big is #O1_I2_big float
score O1_I2_sml is #O1_I2_sml float

score O3sml is #O3sml float
score O3big is #O3big float
score upToInt is #upToInt float
score upTobig is #upTobig float

score tmp is #tmp float
score tmp1 is #tmp1 float
score tmp2 is #tmp2 float

score uptoO3big is #uptoO3big float


#I1 = 0
#O1 = 0
#I2 = 0
#O2 = 0
#I3 = 0
#O3 = 0

O2_I1_big = O2 
O2_I1_big /= 10000
O2_I1_big *= I1

O2_I1_sml = O2 
O2_I1_sml %= 10000  
O2_I1_sml *= I1

O1_I2_big = O1 
O1_I2_big /= 10000 
O1_I2_big *= I2 

O1_I2_sml = O1 
O1_I2_sml %= 10000 
O1_I2_sml *= I2

upToInt = 0
upTobig = 0
tmp = 0

if O1_I2_sml == 10000.. :
    upTobig = O1_I2_sml
    upTobig /= 10000
    O1_I2_sml %= 10000
    O1_I2_big += upTobig

if O1_I2_big == 10000.. :
    tmp = O1_I2_big 
    tmp /= 10000
    upToInt += tmp
    O1_I2_big %= 10000

if O2_I1_sml == 10000.. :
    tmp = O2_I1_sml
    tmp /= 10000
    upTobig += tmp
    O2_I1_sml %= 10000
    O2_I1_big += upTobig

if O2_I1_big == 10000.. :
    tmp = O2_I1_big
    tmp /= 10000
    upToInt += tmp
    O2_I1_big %= 10000

O3sml = O2_I1_sml
O3sml += O1_I2_sml

O3big = O2_I1_big
O3big += O1_I2_big

if O3sml == 10000..:
    uptoO3big = O3sml 
    uptoO3big /= 10000
    O3sml %= 10000
    O3big += uptoO3big

if O3big == 10000..:
    tmp = O3big
    tmp /= 10000
    upToInt += tmp
    O3big %= 10000

O3 = O3big 
O3 *= 10000 
O3 += O3sml 
tmp1 = O1
tmp1 /= 10000
tmp2 = O2
tmp2 /= 10000
tmp = tmp1
tmp *= tmp2
O3 += tmp

I3 = I1
I3 *= I2 
I3 += upToInt



