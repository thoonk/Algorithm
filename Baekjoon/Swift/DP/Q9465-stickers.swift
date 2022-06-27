//
//  Q9465-stickers.swift
//  BOJ_PS
//
//  Created by thoonk on 2022/06/27.
//  스티커 DP

for _ in 0..<Int(readLine()!)! {
    let n = Int(readLine()!)!
    var stickers = [[Int]]()
    for _ in 0..<2 {
        let input = readLine()!.split(separator: " ").map { Int(String($0))! }
        stickers.append(input)
    }
    
    var dp = [[Int]](repeating: [Int](repeating: 0, count: n), count: 2)
    
    dp[0][0] = stickers[0][0]
    dp[1][0] = stickers[1][0]
    
    if n <= 1 {
        print(max(stickers[0][0], stickers[1][0]))
    } else {
        dp[0][1] = dp[1][0] + stickers[0][1]
        dp[1][1] = dp[0][0] + stickers[1][1]
        
        for i in 2..<n {
            let upper = stickers[0][i]
            dp[0][i] = max(dp[1][i-1] + upper, dp[1][i-2] + upper)
            let lower = stickers[1][i]
            dp[1][i] = max(dp[0][i-1] + lower, dp[0][i-2] + lower)
        }
        
        print(max(dp[0][n-1], dp[1][n-1]))
    }
}
