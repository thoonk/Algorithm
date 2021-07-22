//
//  Q1182.swift
//  BOJ_PS
//
//  Created by 김태훈 on 2021/07/22.
//  부분수열의 합 / 백트래킹

let ns = readLine()!.split(separator: " ").map{ Int(String($0))! }
let n = ns[0]
let s = ns[1]

var seq = readLine()!.split(separator: " ").map{ Int(String($0))! }
var cnt = 0

func dfs(_ i: Int, _ sum: Int) {
    if i == n {
        return
    }
    if sum + seq[i] == s {
       cnt += 1
    }
    
    dfs(i + 1, sum + seq[i])
    dfs(i + 1, sum)
}

dfs(0,0)
print(cnt)
