//
//  main.swift
//  BOJ_PS
//
//  Created by 김태훈 on 2021/02/18.
//  바이러스 BFS

func solution() -> Int {
    
    let n = Int(readLine()!)!
    let e = Int(readLine()!)!
    var network = [[Int]](repeating: [Int](), count: n+1)
    var infected = [Bool](repeating: false, count: n+1)
    var cnt = 0
    
    for _ in 0..<e {
        let edge = readLine()!.split(separator: " ").map { Int(String($0))! }
        network[edge[0]].append(edge[1])
        network[edge[1]].append(edge[0])
    }
    
    var q = [Int]()
    var index = 0
    let start = 1
    infected[start] = true
    q.append(start)
    
    while index<q.count {
        
        let now = q[index]
        index += 1
        
        for node in network[now] {
            if infected[node] == false {
                infected[node] = true
                cnt += 1
                q.append(node)
            }
        }
    }
    
    return cnt
}

print(solution())
