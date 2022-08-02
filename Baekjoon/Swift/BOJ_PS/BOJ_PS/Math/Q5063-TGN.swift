//
//  Q5063-TGN.swift
//  BOJ_PS
//
//  Created by thoonk on 2022/08/02.
//  TGN / 수학

for _ in 0..<Int(readLine()!)! {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    let r = input[0]
    let e = input[1]
    let c = input[2]
    
    let revenue = e - c
    
    if r < revenue {
        print("advertise")
    } else if r > revenue {
        print("do not advertise")
    } else {
        print("does not matter")
    }
}
