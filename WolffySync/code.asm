addi $2, $2, 0xfc01
mtc0 $2, $12
ori $4, $4, 64
sw $4, 0x7f04($0)
ori $3, $3, 11
sw $3, 0x7f00($0)
lui $0, 42298
ori $0, $0, -1804
lui $1, 42771
ori $1, $1, -6769
lui $2, 39984
ori $2, $2, 28291
lui $3, 40432
ori $3, $3, 407
lui $4, 5194
ori $4, $4, -17149
lui $5, 37064
ori $5, $5, -3339
lui $6, 25821
ori $6, $6, 29009
lui $7, 42173
ori $7, $7, 7160
mult $7, $3
mfhi $6
mflo $0
multu $1, $2
mfhi $5
mflo $4
mult $1, $6
or $7, $6, $1
add $7, $0, $1
sub $6, $3, $6
mfhi $3
mflo $5
mult $5, $2
and $0, $1, $0
sub $6, $5, $7
mfhi $5
mflo $7
multu $5, $5
or $5, $5, $3
slt $5, $6, $1
slt $0, $7, $4
mflo $0
mfhi $0
mult $3, $5
sltu $4, $7, $2
sltu $0, $6, $3
and $6, $0, $3
mflo $0
mfhi $6
multu $4, $5
mfhi $1
mflo $3
multu $5, $6
and $2, $5, $3
mflo $5
mfhi $1
mult $1, $5
mflo $4
mfhi $3
mult $6, $5
slt $5, $4, $0
add $6, $0, $6
mflo $1
mfhi $2
lui $0, 18221
ori $0, $0, -26585
lui $1, 53982
ori $1, $1, -1915
lui $2, 14424
ori $2, $2, -1249
lui $3, 50019
ori $3, $3, -18201
lui $4, 12340
ori $4, $4, -15399
lui $5, 51660
ori $5, $5, -15080
lui $6, 41755
ori $6, $6, 13172
lui $7, 39298
ori $7, $7, 17747
or $2, $1, $4
add $0, $1, $7
sltu $2, $4, $4
or $4, $3, $2
sltu $2, $1, $7
sub $5, $0, $3
sltu $1, $6, $1
and $7, $0, $5
slt $7, $7, $5
slt $0, $7, $3
sltu $6, $1, $5
sltu $6, $5, $1
and $3, $6, $7
sltu $4, $2, $7
sltu $7, $7, $7
slt $0, $2, $7
sub $1, $6, $6
add $1, $5, $4
or $7, $0, $7
and $6, $4, $0
ori $5, $2, -25890
ori $7, $4, 23055
lui $2, 45966
andi $1, $6, -15831
lui $4, 16129
addi $5, $2, 21418
lui $4, 44249
andi $7, $7, 24770
lui $2, 45480
andi $0, $1, 6752
lh $7, 10730($0)
sh $2, 15360($0)
lw $5, 6887($0)
sw $0, 15672($0)
sh $6, 4869($0)
lw $2, 1743($0)
sw $3, 7160($0)
lw $1, 15395($0)
sh $0, 4367($0)
lw $1, 6138($0)
lb $1, 2315($0)
sw $1, 414($0)
lb $7, 2731($0)
lb $4, 13317($0)
lh $4, 8389($0)
sh $7, 11044($0)
sb $3, 3582($0)
lb $5, 9601($0)
sh $4, 14773($0)
sh $5, 10961($0)

lui $1, 32
lui $3, 32
lui $4, 32
or $4, $0, $0
or $0, $0, $4
add $0, $0, $4
sub $4, $0, $0
addi $4, $0, 26522
lui $0, 37922
sb $0, 15967($0)
lb $0, 4959($0)
sub $4, $0, $0
ori $0, $0, -25531
lb $4, 12781($0)
sb $4, 1739($0)
or $4, $0, $0
h1_0:
slt $0, $0, $4
and $0, $4, $0
bne $0, $0, h1_end_0
sub $0, $4, $0
lh $4, 14172($0)
h2_0:
beq $0, $4, h2_end_0
ori $0, $4, -21680
addi $4, $0, 24929
mult $0, $0
andi $2, $6, -5460
ori $2, $6, 22552
ori $7, $0, 29372
ori $5, $7, 2782
mflo $4
mfhi $0
beq $0, $0, end_hazard_0
h1_end_0:
multu $4, $0
ori $0, $1, -17113
lui $6, 17664
addi $1, $6, 4156
ori $6, $0, -14868
mflo $0
mfhi $0
lui $0, 25291
lui $0, 4894
beq $0, $0, h2_0
h2_end_0:
ori $0, $0, 21670
andi $0, $0, 24331
end_hazard_0:
slt $0, $7, $7
sub $7, $7, $0
or $7, $7, $0
slt $0, $7, $7
andi $0, $7, -12574
andi $7, $0, 16295
sb $7, 704($0)
lw $7, 3107($0)
slt $0, $7, $7
andi $7, $7, 1807
lw $0, 4371($0)
sb $0, 4093($0)
or $0, $7, $7
h1_1:
slt $7, $7, $0
add $7, $0, $7
beq $7, $7, h1_end_1
or $7, $0, $7
lh $0, 4170($0)
h2_1:
bne $7, $0, h2_end_1
addi $7, $0, 9086
lui $0, 20893
multu $7, $7
mfhi $0
mflo $7
beq $0, $0, end_hazard_1
h1_end_1:
mult $0, $7
lui $1, 17103
andi $1, $2, -8078
mfhi $7
mflo $7
lui $7, 11658
addi $7, $7, -15036
beq $0, $0, h2_1
h2_end_1:
lui $7, 9089
addi $7, $7, 9489
end_hazard_1:
sub $6, $2, $0
sub $2, $0, $6
and $0, $2, $6
add $6, $2, $0
lui $6, 26264
andi $2, $6, 28216
sb $0, 2125($0)
lb $0, 10287($0)
and $6, $0, $2
ori $2, $0, 2717
lw $6, 16127($0)
sh $6, 803($0)
add $6, $0, $2
h1_2:
or $2, $0, $6
or $0, $6, $0
beq $2, $0, h1_end_2
and $0, $6, $2
lh $6, 6046($0)
h2_2:
beq $0, $6, h2_end_2
ori $0, $6, 20797
andi $6, $2, 6820
mult $2, $0
addi $2, $4, -18046
mflo $6
mfhi $0
beq $0, $0, end_hazard_2
h1_end_2:
multu $6, $0
ori $7, $6, -18458
mfhi $0
mflo $2
andi $0, $6, -2858
addi $2, $0, 3654
beq $0, $0, h2_2
h2_end_2:
ori $2, $2, 21923
andi $0, $0, -31628
end_hazard_2:
and $6, $1, $3
sltu $1, $3, $6
add $3, $1, $6
sub $6, $1, $3
ori $6, $3, 23329
lui $1, 48398
sw $3, 7983($0)
lw $3, 16347($0)
sub $6, $3, $1
addi $1, $3, -2078
lw $6, 8825($0)
sh $6, 9692($0)
sub $6, $3, $1
h1_3:
or $1, $3, $6
sltu $3, $6, $3
beq $1, $3, h1_end_3
sub $3, $6, $1
lw $6, 1724($0)
h2_3:
beq $3, $6, h2_end_3
ori $3, $6, -4779
addi $6, $1, 20349
mult $1, $3
ori $6, $0, 28999
mflo $6
mfhi $3
beq $0, $0, end_hazard_3
h1_end_3:
mult $6, $3
andi $6, $0, 89
ori $7, $7, -28150
ori $5, $2, -16393
mflo $3
mfhi $1
addi $3, $6, 27512
lui $1, 11495
beq $0, $0, h2_3
h2_end_3:
lui $1, 58463
lui $3, 3419
end_hazard_3:
sltu $6, $2, $3
slt $2, $3, $6
sub $3, $2, $6
sub $6, $2, $3
ori $6, $3, 13007
addi $2, $6, 4588
sh $3, 8767($0)
lb $3, 14934($0)
sltu $6, $3, $2
ori $2, $3, 13001
lb $6, 10331($0)
sw $6, 1983($0)
and $6, $3, $2
h1_4:
or $2, $3, $6
slt $3, $6, $3
bne $2, $3, h1_end_4
sub $3, $6, $2
lw $6, 12595($0)
h2_4:
beq $3, $6, h2_end_4
lui $3, 46972
andi $6, $2, 14154
multu $2, $3
andi $3, $4, -14356
mfhi $6
mflo $3
beq $0, $0, end_hazard_4
h1_end_4:
multu $6, $3
mflo $3
mfhi $2
ori $3, $6, 24304
lui $2, 21854
beq $0, $0, h2_4
h2_end_4:
lui $2, 60308
ori $3, $3, 11258
end_hazard_4:
sub $1, $4, $3
slt $4, $3, $1
add $3, $4, $1
sub $1, $4, $3
andi $1, $3, 7158
ori $4, $1, 2162
sw $3, 2346($0)
lb $3, 2016($0)
sub $1, $3, $4
lui $4, 22049
lw $1, 4276($0)
sw $1, 8364($0)
sltu $1, $3, $4
h1_5:
or $4, $3, $1
sltu $3, $1, $3
bne $4, $3, h1_end_5
sltu $3, $1, $4
lw $1, 6499($0)
h2_5:
beq $3, $1, h2_end_5
andi $3, $1, 25872
ori $1, $4, -2701
multu $4, $3
mflo $1
mfhi $3
beq $0, $0, end_hazard_5
h1_end_5:
multu $1, $3
addi $4, $1, -2272
addi $1, $2, -31926
ori $5, $4, 19236
mfhi $3
mflo $4
lui $3, 2767
andi $4, $3, -20261
beq $0, $0, h2_5
h2_end_5:
addi $4, $4, 2047
ori $3, $3, 18596
end_hazard_5:
sub $7, $2, $3
or $2, $3, $7
sub $3, $2, $7
sltu $7, $2, $3
lui $7, 42395
addi $2, $7, -8690
sb $3, 3101($0)
lb $3, 11695($0)
slt $7, $3, $2
lui $2, 56023
lw $7, 12027($0)
sw $7, 13041($0)
add $7, $3, $2
h1_6:
or $2, $3, $7
add $3, $7, $3
bne $2, $3, h1_end_6
and $3, $7, $2
lh $7, 12926($0)
h2_6:
bne $3, $7, h2_end_6
lui $3, 34719
andi $7, $2, -22734
mult $2, $3
lui $7, 38088
andi $2, $3, 27531
addi $3, $2, -28208
ori $4, $1, -20346
mflo $7
mfhi $3
beq $0, $0, end_hazard_6
h1_end_6:
mult $7, $3
andi $5, $1, 11975
andi $4, $3, -28105
ori $0, $2, 24118
lui $1, 65331
mfhi $3
mflo $2
addi $3, $7, 5646
lui $2, 36008
beq $0, $0, h2_6
h2_end_6:
ori $2, $2, -6594
ori $3, $3, 5722
end_hazard_6:
or $2, $6, $0
slt $6, $0, $2
slt $0, $6, $2
sltu $2, $6, $0
andi $2, $0, -12963
andi $6, $2, -9359
sh $0, 13295($0)
lb $0, 1489($0)
slt $2, $0, $6
addi $6, $0, 12742
lw $2, 12091($0)
sw $2, 14984($0)
sltu $2, $0, $6
h1_7:
and $6, $0, $2
sub $0, $2, $0
bne $6, $0, h1_end_7
add $0, $2, $6
lb $2, 15507($0)
h2_7:
beq $0, $2, h2_end_7
andi $0, $2, -16698
lui $2, 58753
mult $6, $0
mfhi $2
mflo $0
beq $0, $0, end_hazard_7
h1_end_7:
mult $2, $0
addi $3, $7, -29760
ori $2, $2, -28199
mflo $0
mfhi $6
lui $0, 10595
addi $6, $0, -27201
beq $0, $0, h2_7
h2_end_7:
andi $6, $6, -8452
lui $0, 46854
end_hazard_7:
slt $4, $5, $0
slt $5, $0, $4
slt $0, $5, $4
and $4, $5, $0
ori $4, $0, -5236
addi $5, $4, -10508
sb $0, 1900($0)
lh $0, 13694($0)
sub $4, $0, $5
andi $5, $0, -218
lh $4, 8540($0)
sw $4, 11844($0)
sltu $4, $0, $5
h1_8:
or $5, $0, $4
and $0, $4, $0
beq $5, $0, h1_end_8
and $0, $4, $5
lh $4, 4613($0)
h2_8:
bne $0, $4, h2_end_8
lui $0, 28216
addi $4, $5, -30113
mult $5, $0
addi $0, $7, -31355
lui $4, 7678
addi $4, $3, -28009
mfhi $4
mflo $0
beq $0, $0, end_hazard_8
h1_end_8:
multu $4, $0
addi $4, $2, -27254
lui $1, 34571
lui $6, 6345
addi $2, $6, 29205
mfhi $0
mflo $5
lui $0, 58352
andi $5, $0, -6745
beq $0, $0, h2_8
h2_end_8:
ori $5, $5, 25773
andi $0, $0, 18005
end_hazard_8:
sltu $4, $4, $7
slt $4, $7, $4
add $7, $4, $4
and $4, $4, $7
lui $4, 26094
addi $4, $4, 10370
sw $7, 7408($0)
lb $7, 10372($0)
and $4, $7, $4
addi $4, $7, 30205
lb $4, 8968($0)
sh $4, 6077($0)
slt $4, $7, $4
h1_9:
and $4, $7, $4
or $7, $4, $7
beq $4, $7, h1_end_9
sub $7, $4, $4
lw $4, 11181($0)
h2_9:
beq $7, $4, h2_end_9
lui $7, 2978
lui $4, 9978
mult $4, $7
mfhi $4
mflo $7
beq $0, $0, end_hazard_9
h1_end_9:
mult $4, $7
mfhi $7
mflo $4
lui $7, 43340
lui $4, 11449
beq $0, $0, h2_9
h2_end_9:
ori $4, $4, -10531
lui $7, 21762
end_hazard_9:
lui $1, 32
lui $4, 32
lui $2, 32

b_test_1_1st:
bne $1, $1, b_test_1_1st_then
slt $5, $4, $3
lb $4, 3241($0)
andi $3, $5, -721
b_test_1_2nd:
bne $1, $5, b_test_1_2nd_then
addi $0, $1, 5253
or $4, $0, $6
sh $2, 12711($0)
b_test_1_3rd:
beq $5, $5, b_test_1_3rd_then
addi $5, $4, 20954
slt $7, $5, $4
lh $7, 14461($0)
jal_test_1:
jal jal_test_1_then
lui $1, 14511
end_1:

sltu $3, $5, $1
ori $4, $7, -14281
lb $1, 13096($0)

b_test_2_1st:
beq $6, $5, b_test_2_1st_then
sub $3, $6, $5
lh $1, 11010($0)
lui $6, 32153
b_test_2_2nd:
bne $5, $6, b_test_2_2nd_then
lui $5, 53744
add $7, $5, $7
sb $4, 2789($0)
b_test_2_3rd:
beq $4, $4, b_test_2_3rd_then
addi $5, $0, 5170
slt $0, $6, $3
sb $6, 7022($0)
jal_test_2:
jal jal_test_2_then
addi $5, $5, -23249
end_2:

sub $3, $0, $0
lui $6, 48276
sb $5, 7675($0)

b_test_3_1st:
beq $0, $1, b_test_3_1st_then
add $6, $1, $7
lb $1, 8027($0)
ori $0, $0, 2215
b_test_3_2nd:
bne $5, $6, b_test_3_2nd_then
addi $4, $2, -1477
and $6, $3, $3
lh $4, 3137($0)
b_test_3_3rd:
bne $7, $0, b_test_3_3rd_then
ori $2, $6, -4794
slt $6, $0, $0
lb $0, 8130($0)
jal_test_3:
jal jal_test_3_then
andi $4, $2, 23081
end_3:

add $2, $4, $3
ori $0, $2, 12196
lh $6, 8565($0)

b_test_4_1st:
bne $2, $6, b_test_4_1st_then
sltu $7, $6, $5
sh $2, 10783($0)
lui $0, 56868
b_test_4_2nd:
beq $5, $0, b_test_4_2nd_then
andi $0, $4, -20766
add $1, $1, $3
sb $0, 13915($0)
b_test_4_3rd:
bne $5, $5, b_test_4_3rd_then
lui $7, 35784
add $5, $4, $5
lh $6, 7410($0)
jal_test_4:
jal jal_test_4_then
ori $2, $1, -943
end_4:

sub $1, $3, $4
andi $4, $0, -3630
sw $5, 441($0)

b_test_5_1st:
bne $5, $6, b_test_5_1st_then
sub $4, $5, $5
sb $6, 12092($0)
lui $3, 40032
b_test_5_2nd:
beq $5, $3, b_test_5_2nd_then
ori $4, $7, -29591
sltu $4, $4, $6
lw $0, 2848($0)
b_test_5_3rd:
beq $3, $3, b_test_5_3rd_then
ori $6, $4, 21171
or $1, $6, $1
sw $3, 5280($0)
jal_test_5:
jal jal_test_5_then
ori $0, $3, -17914
end_5:

add $6, $2, $6
ori $4, $0, 19590
lh $5, 910($0)

b_test_6_1st:
bne $6, $6, b_test_6_1st_then
add $1, $7, $0
lw $0, 5116($0)
addi $0, $6, 22948
b_test_6_2nd:
bne $5, $3, b_test_6_2nd_then
andi $4, $7, 9465
sub $7, $0, $3
sh $0, 15634($0)
b_test_6_3rd:
beq $0, $4, b_test_6_3rd_then
addi $5, $5, -12979
or $6, $1, $6
sb $7, 12578($0)
jal_test_6:
jal jal_test_6_then
lui $3, 12561
end_6:

or $6, $1, $7
lui $7, 56824
sw $2, 14216($0)
beq $0, $0, final

b_test_1_1st_then:
add $2, $4, $2
addi $7, $2, 11898
lb $5, 15153($0)
beq $0, $0, b_test_1_2nd
add $1, $0, $7

b_test_1_2nd_then:
sub $5, $5, $4
lui $7, 14733
lb $5, 13734($0)
beq $0, $0, b_test_1_3rd
andi $3, $0, 1935

b_test_1_3rd_then:
sltu $2, $1, $7
lui $5, 46259
lh $2, 15961($0)
jal jal_test_1
add $1, $ra, $0

jal_test_1_then:
and $3, $1, $5
andi $7, $5, -16027
sh $5, 13168($0)
addi $ra,$ra, 8
beq $5, $4, end_1
sub $7, $5, $1
addi $4, $0, 16974
lh $0, 2921($0)
jr $ra

b_test_2_1st_then:
add $7, $6, $5
andi $2, $2, 367
sw $7, 7884($0)
beq $0, $0, b_test_2_2nd
slt $7, $2, $3

b_test_2_2nd_then:
sub $6, $4, $3
andi $2, $0, -31482
lw $0, 16289($0)
beq $0, $0, b_test_2_3rd
andi $6, $6, 3111

b_test_2_3rd_then:
sltu $5, $2, $5
andi $4, $2, -3499
lh $4, 12180($0)
jal jal_test_2
add $1, $ra, $0

jal_test_2_then:
slt $1, $4, $0
andi $6, $4, -17448
sh $7, 8963($0)
addi $ra,$ra, 8
bne $6, $7, end_2
sltu $2, $5, $4
ori $7, $2, -15465
sw $2, 13302($0)
jr $ra

b_test_3_1st_then:
slt $0, $2, $7
addi $5, $0, 30269
sb $1, 5158($0)
beq $0, $0, b_test_3_2nd
add $0, $0, $1

b_test_3_2nd_then:
add $7, $1, $2
addi $7, $2, -4645
lw $1, 3383($0)
beq $0, $0, b_test_3_3rd
ori $7, $2, -22596

b_test_3_3rd_then:
sub $6, $4, $1
ori $5, $7, -5462
sw $1, 5653($0)
jal jal_test_3
add $1, $ra, $0

jal_test_3_then:
sltu $5, $5, $1
andi $4, $7, 508
sw $2, 5296($0)
addi $ra,$ra, 8
beq $0, $6, end_3
sub $5, $0, $6
lui $6, 27845
sh $1, 3941($0)
jr $ra

b_test_4_1st_then:
sltu $4, $2, $6
lui $2, 32331
lb $1, 9408($0)
beq $0, $0, b_test_4_2nd
add $7, $1, $3

b_test_4_2nd_then:
sltu $4, $1, $0
addi $0, $1, -11938
sh $0, 6333($0)
beq $0, $0, b_test_4_3rd
ori $7, $7, -12590

b_test_4_3rd_then:
and $6, $3, $5
addi $1, $2, -5653
lb $2, 8574($0)
jal jal_test_4
add $1, $ra, $0

jal_test_4_then:
or $2, $6, $5
andi $6, $4, 31089
lh $4, 9929($0)
addi $ra,$ra, 8
beq $6, $0, end_4
and $4, $5, $5
lui $2, 64843
sb $0, 9499($0)
jr $ra

b_test_5_1st_then:
and $1, $3, $4
andi $1, $3, 32544
lh $1, 8107($0)
beq $0, $0, b_test_5_2nd
sub $6, $6, $5

b_test_5_2nd_then:
slt $6, $1, $3
lui $7, 29460
sb $2, 14328($0)
beq $0, $0, b_test_5_3rd
ori $4, $3, -18703

b_test_5_3rd_then:
add $1, $1, $7
addi $7, $0, -3892
sb $3, 1286($0)
jal jal_test_5
add $1, $ra, $0

jal_test_5_then:
slt $0, $0, $0
addi $2, $0, 26522
sw $5, 14808($0)
addi $ra,$ra, 8
beq $2, $7, end_5
and $6, $4, $3
addi $0, $7, -7965
lh $2, 6397($0)
jr $ra

b_test_6_1st_then:
and $3, $4, $7
addi $2, $0, -31161
sw $3, 9228($0)
beq $0, $0, b_test_6_2nd
sub $5, $0, $2

b_test_6_2nd_then:
or $2, $7, $0
lui $0, 40874
sh $6, 16371($0)
beq $0, $0, b_test_6_3rd
ori $7, $0, 28303

b_test_6_3rd_then:
or $4, $6, $0
ori $0, $7, -17001
sw $3, 3433($0)
jal jal_test_6
add $1, $ra, $0

jal_test_6_then:
sltu $6, $1, $0
addi $7, $0, 24034
lh $6, 1106($0)
addi $ra,$ra, 8
bne $3, $3, end_6
sub $4, $6, $2
lui $1, 42511
lw $5, 15872($0)
jr $ra
final:
nop
sw $0, 0x7f04($0)
sw $0, 0x7f00($0)
