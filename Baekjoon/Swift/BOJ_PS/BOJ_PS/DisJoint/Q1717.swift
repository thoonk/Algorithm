//
//  main.swift
//  BOJ_PS
//
//  Created by 김태훈 on 2021/05/04.
//  집합의 표현 / 서로소(분리) 집합

let nm = readLine()!.split(separator: " ").map { Int(String($0))! }
let n = nm[0]
let m = nm[1]
var parent = [Int](repeating: 0, count: n+1)

for i in 1 ..< n+1 {
    parent[i] = i
}

func find(_ x: Int) -> Int {
    if parent[x] != x {
        parent[x] = find(parent[x])
    }
    return parent[x]
}

func union(_ a: Int, _ b: Int) {
    let a = find(a)
    let b = find(b)
    
    if a < b {
        parent[b] = a
    } else {
        parent[a] = b
    }
}

for _ in 0 ..< m {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    
    if input[0] == 0 {
        union(input[1], input[2])
    } else {
        if find(input[1]) == find(input[2]) {
            print("YES")
        } else{
            print("NO")
        }
    }
}
