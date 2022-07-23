//
//  main.swift
//  BOJ_PS
//
//  Created by 김태훈 on 2021/04/30.
//  순열의 순서 조합

let n = Int(readLine()!)!
let input = readLine()!.split(separator: " ").map { Int(String($0))! }
var fac = [Int](repeating: 0, count: 21)
var check = [Bool](repeating: false, count: 21)
var nums = [Int](repeating: 0, count: n)

fac[0] = 1
for i in 1 ... 20 {
    fac[i] = i * fac[i-1]
}

if input[0] == 1 {
    var k = input[1]
    
    for i in 0 ..< n {
        for j in 1 ... n {
            guard check[j] == false  else { continue }
            
            if k > fac[n-i-1] {
                k -= fac[n-i-1]
            } else {
                nums[i] = j
                check[j] = true
                break
            }
        }
    }
    
    nums.forEach { print($0, terminator: " ")}
} else if input[0] == 2 {
    var result = 0
    
    for i in 0 ..< n {
        nums[i] = input[i+1]
    }
    
    for i in 0 ..< n {
        for j in 1 ..< nums[i] {
            guard check[j] == false else { continue }
            result += fac[n-i-1]
        }
        check[nums[i]] = true
    }
    print(result+1)
}
