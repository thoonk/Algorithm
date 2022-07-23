//
//  Q11501.swift
//  BOJ_PS
//
//  Created by 김태훈 on 2021/07/12.
//  주식 / DP

for _ in 0 ..< Int(readLine()!)! {
    let n = Int(readLine()!)!
    let stock = readLine()!.split(separator: " ").map { Int(String($0))! }
    var maxStock = 0
    var res = 0
    
    for i in stride(from: n-1, to: -1, by: -1) {
        if stock[i] > maxStock {
            maxStock = stock[i]
        } else {
            res += maxStock - stock[i]
        }
    }
    print(res)
}
