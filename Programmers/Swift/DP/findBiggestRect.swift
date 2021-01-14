//
//  main.swift
//  Programmers
//
//  Created by 김태훈 on 2021/01/14.
//  가장 큰 정사각형 찾기 Level2 DP

import Foundation

func solution(_ board:[[Int]]) -> Int
{
    var board = board
    var result = 0
    
    if board.count == 1 {
        return 1
    }
    
    for i in 1..<board.count {
        for j in 1..<board[i].count {
            if board[i][j] != 0 {
                board[i][j] += min(board[i-1][j], board[i][j-1], board[i-1][j-1])
                result = max(result, board[i][j])
            }
        }
    }
    
    return result * result
}
