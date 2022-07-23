//
//  Q15652.swift
//  BOJ_PS
//
//  Created by 김태훈 on 2021/05/25.
//  N과 M (4) / 백트래킹
//  중복 허용되는 오름차순 수열

let nm = readLine()!.split(separator: " ").map { Int(String($0))! }
let n = nm[0]
let m = nm[1]
var arr = [String]()
var prev = 0

func dfs(_ cnt: Int) {
    if cnt == m {
        print(arr.joined(separator: " "))
        return
    }
    
    for i in 1 ... n {
        // 오름차순으로 만들기 위한 조건
        if prev <= i {
            prev = i
            arr.append(String(i))
            dfs(cnt+1)
            prev = 0
            arr.popLast()
        }
    }
}
dfs(0)
