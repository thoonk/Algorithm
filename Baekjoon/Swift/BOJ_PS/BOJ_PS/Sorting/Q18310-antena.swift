//
//  main.swift
//  BOJ_PS
//
//  Created by 김태훈 on 2020/12/07.
//  Q18310 안테나 정렬

import Foundation

func solution() {
    
    let n = Int(readLine()!)!
    var homes = [Int]()
    
    homes.append(contentsOf: readLine()!.split(separator: " ").map {Int(String($0))!})
    homes.sort()
    
    print(homes[(n-1)/2])
}

solution()
