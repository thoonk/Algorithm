//
//  Q7795.swift
//  BOJ_PS
//
//  Created by 김태훈 on 2021/06/20.
//  먹을 것인가 먹힐 것인가 / 정렬

for _ in 0 ..< Int(readLine()!)! {
    let nm = readLine()!.split(separator: " ").map { Int(String($0))! }
    let n = nm[0]
    let m = nm[1]
    
    let a = readLine()!.split(separator: " ").map { Int(String($0))! }.sorted(by: >)
    let b = readLine()!.split(separator: " ").map { Int(String($0))! }.sorted()
    var res = 0
    
    for i in 0 ..< n {
        for j in 0 ..< m {
            if a[i] > b[j] {
                res += 1
            }
        }
    }
    print(res)
}
