//
//  Q17626-fourSquares.swift
//  BOJ_PS
//
//  Created by thoonk on 2022/06/18.
//  Four Squares DP

/*
 n의 최소 제곱수를 구하는 것이 핵심.
 n까지 모든 수의 제곱수를 구하여 n의 최소 제곱수를 구해야 함.
 그렇기에 DP를 이용해서 인덱스를 n까지의 수로 기준을 잡고 n까지의 모든 제곱수를 DP에 저장하는 방식
 
 9의 최소 제곱수를 구한다면,
 - 8의 최소 제곱수 + 1의 최소 제곱수
 - 5의 최소 제곱수 + 4의 최소 제곱수
 - 3의 최소 제곱수 + 0의 최소 제곱수
 
 n보다 작거나 같은 제곱수를 찾고 (n-제곱수)를 인덱스로 가진 최소 제곱수 값에 1을 더해줘서 n의 값을 구함.
 */

var n = Int(readLine()!)!
var dp = [Int](repeating: 0, count: n + 1)
dp[1] = 1

for i in 2..<n + 1 {
    var minValue = Int.max
    var j = 1
    
    while (j * j) <= i {
        minValue = min(minValue, dp[i - (j * j)])
        j += 1
    }
    
    dp[i] = minValue + 1
}

print(dp[n])

