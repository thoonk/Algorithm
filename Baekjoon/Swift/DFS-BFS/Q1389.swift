//
//  Q1389.swift
//  BOJ_PS
//
//  Created by 김태훈 on 2021/10/10.
//  케빈 베이컨의 6단계 법칙 BFS

let nm = readLine()!.split(separator: " ").map { Int(String($0))! }
let n = nm[0]
let m = nm[1]

var bacons = [Int]()
var relation = [[Int]](repeating: [Int](), count: n)
var res = [Int]()

for _ in 0..<m {
    let ab = readLine()!.split(separator: " ").map { Int(String($0))! }
    let a = ab[0] - 1
    let b = ab[1] - 1
    
    relation[a].append(b)
    relation[b].append(a)
}

func getBaconSum(_ v: Int) -> Int {
    var q = [Int]()
    var visited = [Int](repeating: -1, count: n)

    visited[v] = 0
    q.append(v)
        
    while !q.isEmpty {
        let now = q.removeFirst()
        
        for i in relation[now] {
            if visited[i] == -1 {
                q.append(i)
                visited[i] = visited[now] + 1
            }
        }
    }
    
    var cnt = 0
    for i in 0..<n {
        if visited[i] != -1 {
            cnt += visited[i]
        }
    }
    
    return cnt
}

func solution() {
    for i in 0..<n {
        bacons.append(getBaconSum(i))
    }

    for i in 0..<n {
        if bacons[i] == bacons.min() {
            res.append(i)
        }
    }
    
    print(res.min()! + 1)
}

solution()
