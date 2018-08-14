# -*- coding: utf-8 -*-

#各面接官の評価値（テストで5人）
x_eval = [2,2,3,4,2]
y_eval = [1,4,3,5,5]
z_eval = [3,2,1,4,3]

#評価値リスト
eval_list = [x_eval, y_eval, z_eval]

#初期値
lj = [1] * len(eval_list)
yi = [0] * len(x_eval)

#収束判定値
tol = 0.01

#前回と誤差0.01以内かどうかのフラグ
yi_flag = 0
lj_flag = 0

#分母分子
denom = 0
numer = 0

#全てのyiとljの誤差が0.01に収まるまで繰り返し
while (yi_flag == 0 and lj_flag == 0):
    
    #前回の結果をコピー
    last_yi = yi[:]
    last_lj = lj[:]

    """y1の計算"""
    #面接者の数繰り返し
    for i in range(len(x_eval)):
        
        #評価者の数繰り返し
        for j in range(len(eval_list)):
            #分子計算
            numer = numer + (lj[j] * eval_list[j][i])
            #分母計算
            denom = denom + lj[j]     
        
        #面接者i人目のy1算出
        yi[i] = numer / denom
        
        #分子分母リセット
        denom = 0
        numer = 0
    
    #誤差チェック
    for k in range(len(yi)):
        yi_flag = 1
        if abs(yi[k] - last_yi[k]) > tol:
            yi_flag = 0
            break

    """ljの計算"""
    #分母計算
    denom = len(x_eval)
    
    #評価者の数繰り返し
    for j in range(len(eval_list)):
        
        #面接者の数繰り返し
        for i in range(len(x_eval)):
            
            #分子計算
            numer = numer + (eval_list[j][i] - yi[i])**2
        
        #評価者j人目のlj算出
        lj[j] = numer / denom
        
        #分子リセット
        numer = 0
    #分母リセット
    denom = 0

    #誤差チェック
    for k in range(len(lj)):
        lj_flag = 1
        if abs(lj[k] - last_lj[k]) > tol:
            lj_flag = 0
            break
    print(yi)
    print(lj)

