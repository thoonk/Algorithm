//
//  main.swift
//  BOJ_PS
//
//  Created by 김태훈 on 2021/04/29.
//  N과 M(1) 순열
/*
 1부터 N까지 자연수 중에서 중복 없이 M개를 고른 수열
 check를 통해 사용한 수 체크하고 arr에 n개를 넣고 m개를 뽑는다.
*/

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
        guard !check[i] else { continue }
        
        check[i] = true
        arr[cnt] = i
        dfs(cnt + 1)
        check[i] = false
    }
}
dfs(0)
