//
//  main.swift
//  BOJ_PS
//
//  Created by 김태훈 on 2021/04/07.
//  체스판 다시 칠하기 BruteForce

let nm = readLine()!.split(separator: " ").map { Int(String($0))! }
let n = nm[0]
let m = nm[1]
var board = [[String]]()
for _ in 0 ..< n {
    let input = Array(readLine()!).map { String($0) }
    board.append(input)
}
var minCnt = Int.max

for i in 0 ..< n - 7 {
    for j in 0 ..< m - 7 {
        var cntW = 0
        var cntB = 0
        
        // W일 때
        for k in i ..< i + 8 {
            for l in j ..< j + 8 {
                if (k + l - i - j) % 2 == 0 {
                    if board[k][l] == "B" {
                        cntW += 1
                    }
                } else {
                    if board[k][l] == "W" {
                        cntW += 1
                    }
                }
            }
        }
        
        // B일 때
        for k in i ..< i + 8 {
            for l in j ..< j + 8 {
                if (k + l - i - j) % 2 == 0 {
                    if board[k][l] == "W" {
                        cntB += 1
                    }
                } else {
                    if board[k][l] == "B" {
                        cntB += 1
                    }
                }
            }
        }
        
        minCnt = min(minCnt, cntW, cntB)
    }
}
print(minCnt)
