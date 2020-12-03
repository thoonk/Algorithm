//
//  main.swift
//  CodingTest
//
//  Created by 김태훈 on 2020/11/20.
//  Q18532 특정 거리의 도시 찾기 (BFS)

import Foundation

let input = readLine()!.split(separator: " ").map {Int(String($0))!}
let n = input[0]
let m = input[1]
let k = input[2]
let x = input[3]

var graph = Array(repeating: [Int](), count: n+1)
for _ in stride(from: 0, to: m, by: 1){
    let data = readLine()!.split(separator: " ").map {Int(String($0))!}
    graph[data[0]].append(data[1])
}
var distance = Array(repeating: -1, count: n+1)
distance[x] = 0

var q = [Int]()
q.append(x)

var idx = 0
while idx < q.count{
    let now = q[idx]
    idx += 1
    for next in graph[now] {
        if distance[next] == -1{
            distance[next] = distance[now] + 1
            q.append(next)
        }
    }
}

var result = [Int]()
for i in 1 ..< n+1 {
    if distance[i] == k {
        result.append(i)
    }
}

if result.isEmpty {
    print(-1)
} else {
    for i in result {
        print(i)
    }
}


/*
4 4 2 1
1 2
1 3
2 3
2 4
*/
