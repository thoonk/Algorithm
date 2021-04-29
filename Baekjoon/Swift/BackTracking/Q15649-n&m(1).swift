//
//  main.swift
//  BOJ_PS
//
//  Created by 김태훈 on 2021/04/29.
//  N과 M(1) 순열

let nm = readLine()!.split(separator: " ").map { Int(String($0))! }
let n = nm[0]
let m = nm[1]

var arr = [Int](repeating: 0, count: m)
var check = [Bool](repeating: false, count: n+1)

func dfs(_ cnt: Int) {
    if cnt == m {
        for i in 0 ..< m {
            print(arr[i], terminator: " ")
        }
        print()
        return
    }
    
    for i in 1 ... n {
        if check[i] {
            continue
        }
        
        check[i] = true
        arr[cnt] = i
        dfs(cnt + 1)
        check[i] = false
    }
}

dfs(0)
