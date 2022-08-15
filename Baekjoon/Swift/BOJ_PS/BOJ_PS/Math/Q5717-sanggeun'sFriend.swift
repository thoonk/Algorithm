//
//  Q5717-sanggeun'sFriend.swift
//  BOJ_PS
//
//  Created by thoonk on 2022/08/15.
//  상근이의 친구들

while true {
    let mf = readLine()!.split(separator: " ").map { Int(String($0))! }
    let m = mf[0]
    let f = mf[1]
    
    if m == 0 && f == 0 {
        break
    }
    
    print(m + f)
}
