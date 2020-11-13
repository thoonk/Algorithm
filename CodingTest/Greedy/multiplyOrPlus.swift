//
//  main.swift
//  CodingTest
//
//  Created by 김태훈 on 2020/11/13.
//  곱하기 혹은 더하기 (그리디)

import Foundation

func solution(){
    
    var nums = Array(readLine()!).map {Int(String($0))!}
    
    var result = 0
    for i in nums {
        
        if i <= 1 || result <= 1  {
            result += i
        } else{
            result *= i
        }
    }
    print(result)
}
solution()
