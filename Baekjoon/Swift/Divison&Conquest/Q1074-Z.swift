//
//  main.swift
//  BOJ_PS
//
//  Created by 김태훈 on 2021/04/08.
//  Z 분할정복, 재귀

import Foundation

func solution(_ powN: Int, _ nr: Int, _ nc: Int) {
    if nr == r && nc == c {
        print(result)
        return
    }
    
    if powN == 1 {
        result += 1
        return
    }
    
    // 원하는 좌표가 포함되는 행렬이 아닐 때 방문한 걸로 치고 넘어가기 (시간 줄이기)
    if !(nr <= r && r < nr + powN && nc <= c && c < nc + powN) {
        result += powN * powN
        return
    }
    
    solution(powN / 2, nr, nc)
    solution(powN / 2, nr, nc + powN / 2)
    solution(powN / 2, nr + powN / 2, nc)
    solution(powN / 2, nr + powN / 2, nc + powN / 2)
}

let nrc = readLine()!.split(separator: " ").map { Int(String($0))! }
let n = nrc[0]
let r = nrc[1]
let c = nrc[2]
var result = 0
solution(Int(pow(2.0, Double(n))), 0, 0)


