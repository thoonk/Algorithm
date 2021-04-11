//
//  main.swift
//  BOJ_PS
//
//  Created by 김태훈 on 2021/04/11.
//  색종이 만들기 분할 정복, 재귀

typealias Paper = (white: Int, blue: Int)

func solution(_ n: Int, _ r: Int, _ c: Int) {
    let checkColor = coloredPaper[r][c]
    
    for i in r ..< r + n {
        for j in c ..< c + n {
            if checkColor != coloredPaper[i][j] {
                solution(n/2, r, c)
                solution(n/2, r, c + n/2)
                solution(n/2, r + n/2, c)
                solution(n/2, r + n/2, c + n/2)
                return
            }
        }
    }
    
    if checkColor == 0 {
        paperCnt.white += 1
    } else {
        paperCnt.blue += 1
    }
    return
}

let N = Int(readLine()!)!
var coloredPaper = [[Int]]()
var paperCnt: Paper = (0, 0)

for _ in 0 ..< N {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    coloredPaper.append(input)
}

solution(N, 0, 0)
print(paperCnt.white)
print(paperCnt.blue)
