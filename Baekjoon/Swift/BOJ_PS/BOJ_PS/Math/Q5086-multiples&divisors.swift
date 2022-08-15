//
//  Q5086-multiples&divisors.swift
//  BOJ_PS
//
//  Created by thoonk on 2022/08/15.
//  약수와 배수

while true {
    let nm = readLine()!.split(separator: " ").map { Int(String($0))! }
    let n = nm[0]
    let m = nm[1]
   
    if n == 0 && m == 0 {
        break
    }
    
    if n % m == 0 {
        print("multiple")
    } else if m % n == 0 {
        print("factor")
    } else {
        print("neither")
    }
}
