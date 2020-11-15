//
//  main.swift
//  CodingTest
//
//  Created by 김태훈 on 2020/11/13.
//  만들 수 없는 금액 (그리디)

import Foundation

func solution(){
    let n = Int(readLine()!)!
    
    var coin = readLine()!.split(separator: " ").map {Int($0)!}
    coin.sort()
    
    var result = 1
    
    for i in coin {
        
        if result < i {
            break
        }
        result += i
    }
    print(result)
}

solution()

/*
5
3 2 1 1 9
*/
