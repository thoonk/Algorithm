//
//  main.swift
//  Programmers
//
//  Created by 김태훈 on 2021/01/02.
//  크레인 인형 뽑기 게임 2019 카카오 Level1

import Foundation

func solution(_ board:[[Int]], _ moves:[Int]) -> Int {
    
    var stack = [Int]()
    var cnt = 0
    var board = board
    for m in moves {
        for i in 0..<board.count {
            let now = board[i][m-1]
            if now == 0 { continue }
            if !stack.isEmpty, stack.last == now {
                stack.removeLast()
                cnt += 1
            } else {
                stack.append(board[i][m-1])
            }
            board[i][m-1] = 0
            break
        }
    }
    return cnt * 2
}

print(solution([[0,0,0,0,0],[0,0,1,0,3],[0,2,5,0,1],[4,2,4,4,2],[3,5,1,3,1]], [1,5,3,5,1,2,1,4]))
