//
//  main.swift
//  BOJ_PS
//
//  Created by 김태훈 on 2020/10/24.
//

import Foundation

let T = Int(readLine()!)!
var people = [[Int]]()

for _ in 0 ..< T {
    
    people.append(readLine()!.split(separator: " ").map {Int($0)!})
}


for i in 0 ..< T {
    var rank = 1
    for j in 0 ..< T {
        if people[i][0] < people[j][0], people[i][1] < people[j][1]{
            rank += 1
        }
    }
    print(rank, terminator: " ")
}
