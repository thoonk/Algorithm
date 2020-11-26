//
//  main.swift
//  Programmers_PS
//
//  Created by 김태훈 on 2020/11/22.
//  K번째 수 (정렬)

import Foundation

let array = [1, 5, 2, 6, 3, 7, 4]
let commands = [[2, 5, 3], [4, 4, 1], [1, 7, 3]]

func solution(_ array:[Int], _ commands:[[Int]]) -> [Int] {
    var result = [Int]()

    for i in stride(from: 0, to: commands.count, by: 1) {
        let temp = array[commands[i][0]-1 ..< commands[i][1]].sorted()
        result.append(temp[commands[i][2] - 1])
    }
    return result
}

print(solution(array, commands))
