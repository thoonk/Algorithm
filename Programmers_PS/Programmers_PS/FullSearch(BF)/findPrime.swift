//
//  main.swift
//  Programmers_PS
//
//  Created by 김태훈 on 2020/11/25.
//  소수 찾기 Level2 (완전 탐색) 

import Foundation


func solution(_ numbers:String) -> Int {
    var result: Set<Int> = []
    var cnt = 0
    
    func makeNums(str: String, prefix: String, result: inout Set<Int>){
        if prefix != ""{
            result.insert(Int(prefix)!)
        }
        
        for i in 0 ..< str.count {
            let index1 = str.index(str.startIndex, offsetBy: i)
            let index2 = str.index(str.startIndex, offsetBy: i+1)
            
            makeNums(str: String(str[str.startIndex..<index1] + str[index2..<str.endIndex]) , prefix: prefix + String(str[index1]), result: &result)
        }
    }

    func isPrime(num: Int) -> Bool {
        if num < 2 {
            return false
        } else {
            for i in 2 ..< num {
                if num % i == 0 {
                    return false
                }
            }
        }
        return true
    }
    
    makeNums(str: numbers, prefix: "", result: &result)
    
    for i in result {
        if isPrime(num: i){
            cnt += 1
        }
    }
    
    return cnt
}
print(solution("011"))
