//
//  Q12852.swift
//  BOJ_PS
//
//  Created by 김태훈 on 2021/06/04.
//  1로 만들기2 / DP

typealias DP = (cnt: Int, v: [Int])

var n = Int(readLine()!)!
var dp = [DP](repeating: (0,[1]), count: n+1)

for i in 2 ..< n+1 {
    dp[i].cnt = dp[i-1].cnt + 1
    dp[i].v = dp[i-1].v + [i]
    
    if i % 2 == 0 && dp[i/2].cnt + 1 < dp[i].cnt {
        dp[i].cnt = dp[i/2].cnt + 1
        dp[i].v = dp[i/2].v + [i]
    }
    if i % 3 == 0 && dp[i/3].cnt + 1 < dp[i].cnt {
        dp[i].cnt = dp[i/3].cnt + 1
        dp[i].v = dp[i/3].v + [i]
    }
}

print(dp[n].cnt)
for v in dp.last!.v.reversed() {
    print(v, terminator: " ")
}
