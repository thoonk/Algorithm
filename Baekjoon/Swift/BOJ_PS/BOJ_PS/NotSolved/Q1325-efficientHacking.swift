//
//  main.swift
//  BOJ_PS
//
//  Created by 김태훈 on 2021/04/19.
//  효율적인 해킹 BFS 시간초과,, 스위프트로 풀 수 있는지 모르겠음.

func bfs(_ startNode: Int) -> Int {
    var q = [Int]()
    var check = [Bool](repeating: false, count: n + 1)
    var cnt = 1
    q.append(startNode)
    check[startNode] = true
    
    var index = 0
    while index < q.count {
        let now = q[index]
        
        for node in graph[now] {
            if check[node] == false {
                q.append(node)
                check[node] = true
                cnt += 1
            }
        }
    }
    return cnt
}

let nm = readLine()!.split(separator: " ").map { Int(String($0))! }
let n = nm[0]
let m = nm[1]
var graph = [[Int]](repeating: [Int](), count: n + 1)
var result = [Int](repeating: 0, count: n + 1)
var maxCnt = 0

for _ in 0 ..< m {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    graph[input[1]].append(input[0])
}

for i in 1 ... n {
    result[i] = bfs(i)
    maxCnt = max(maxCnt, result[i])
}

for i in 1 ... n {
    if result[i] == maxCnt {
        print(i, terminator:" ")
    }
}
