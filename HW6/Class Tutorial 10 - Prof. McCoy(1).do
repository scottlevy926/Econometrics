

webuse auto, clear

reg price mpg headroom trunk weight length turn, r


*Heavy vs. Light

summ weight, d

gen Heavy = 0
replace Heavy = 1 if weight > 3190

gen Light = 0
replace Light = 1 if weight<=3190


summ price if Heavy==1

summ price if Light==1

di 7067.432 - 5263.081

reg price Heavy trunk

reg price Heavy Light, nocons

reg price Heavy Light , nocons

lincom _b[Heavy] - _b[Light]

reg price Heavy  


stop
*****

price = b0 + b1Heavy + e

E(price | Heavy ==1) = b0 + b1
E(price | Heavy == 0) = b0

E(price | Heavy ==1) - E(price | Heavy == 0)

== b0 + b1 - b0

== b1


price = b0*1 + b1Heavy + b2Light + e


Heavy + Light = 1

price = b0*(Heavy + Light) + b1Heavy + b2Light + e

price = b0*Heavy + b0Light + b1Heavy + b2Light + e

price = (b0 + b1)Heavy + (b0 + b1)Light + e




