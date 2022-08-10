//
//  Q10886-0=notcute:1=cute.swift
//  BOJ_PS
//
//  Created by thoonk on 2022/08/10.
//  0 = not cute / 1 = cute 구현

let n = Int(readLine()!)!
var count = 0

for _ in 0..<n {
    let input = Int(readLine()!)!
    if input == 1 {
        count += 1
    }
}

if count > n / 2 {
    print("Junhee is cute!")
} else {
    print("Junhee is not cute!")
}
