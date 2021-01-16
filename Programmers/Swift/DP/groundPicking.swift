//
//  main.swift
//  Programmers
//
//  Created by 김태훈 on 2021/01/15.
//  땅따먹기 Level2

import Foundation

func solution(_ land:[[Int]]) -> Int{
    var newLand = land
    
    for i in 1..<land.count {
        newLand[i][0] += max(newLand[i-1][1], newLand[i-1][2], newLand[i-1][3])
        newLand[i][1] += max(newLand[i-1][0], newLand[i-1][2], newLand[i-1][3])
        newLand[i][2] += max(newLand[i-1][0], newLand[i-1][1], newLand[i-1][3])
        newLand[i][3] += max(newLand[i-1][0], newLand[i-1][1], newLand[i-1][2])
    }
    return newLand.last!.max()!
}
