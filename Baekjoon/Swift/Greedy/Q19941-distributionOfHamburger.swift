//
//  main.swift
//  BOJ_PS
//
//  Created by 김태훈 on 2021/03/30.
//  햄버거 분배 그리드

let nk = readLine()!.split(separator: " ").map { Int(String($0))! }
let n = nk[0]
let k = nk[1]
var table = Array(readLine()!).map { String($0) }

solution()

func solution() {
    var cnt = 0
    for i in 0..<n {
        if table[i] == "P" {
            for j in stride(from: i-k, through: i+k, by: 1) {
                if 0<=j && j<n && table[j] == "H" {
                    table[j] = "Ate"
                    cnt += 1
                    break
                }
            }
        }
    }
    print(cnt)
}

