//
//  Q1389 - floyd.swift
//  BOJ_PS
//
//  Created by 김태훈 on 2021/10/10.
//  케빈 베이컨의 6단계 법칙 floyd

let inf = Int(1e9)

let nm = readLine()!.split(separator: " ").map { Int(String($0))! }
let n = nm[0]
let m = nm[1]

var bacons = [Int]()
var relation = [[Int]](repeating: [Int](repeating: inf, count: n), count: n)
var res = [Int]()

for _ in 0..<m {
    let ab = readLine()!.split(separator: " ").map { Int(String($0))! }
    let a = ab[0] - 1
    let b = ab[1] - 1
    
    relation[a][b] = 1
    relation[b][a] = 1
}

for k in 0..<n {
    for a in 0..<n {
        for b in 0..<n {
            if a == b {
                relation[a][b] = 0
            } else {
                relation[a][b] = min(relation[a][b], relation[a][k] + relation[k][b])
            }
        }
    }
}

for rel in relation {
    res.append(rel.reduce(0, +))
}

for i in 0..<n {
    if res[i] == res.min() {
        print(i+1)
        break
    }
}
