//
//  Q9506-sumOfFactors.swift
//  BOJ_PS
//
//  Created by thoonk on 2022/08/15.
//  약수들의 합

while true {
    let n = Int(readLine()!)!
    if n == -1 {
        break
    }
    
    var divisors: [Int] = [1]
    
    for i in 2..<n {
        if n % i == 0 {
            divisors.append(i)
        }
    }
    
    var result = "\(n) = 1"
    if n == divisors.reduce(0, +) {
        for j in 1..<divisors.count {
            result += " + \(divisors[j])"
        }

        print(result)
    } else {
        print("\(n) is NOT perfect.")
    }
}
