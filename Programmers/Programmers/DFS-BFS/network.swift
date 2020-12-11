//
//  main.swift
//  Programmers
//
//  Created by 김태훈 on 2020/12/10.
//  네트워크 DFS

import Foundation


func solution(_ n:Int, _ computers:[[Int]]) -> Int {
    
    var visited = Array(repeating: false, count: n)
    var answer = 0
    
    func dfs(_ computers: [[Int]], _ v: Int, _  visited: inout [Bool]) -> Int {
        
        if (visited[v]){
            return 0
        }
        
        visited[v] = true
        
        for i in 0 ..< n {
            if computers[v][i] == 1 {
                dfs(computers, i, &visited)
            }
        }
        
        return 1
    }
    
    for i in 0 ..< n {
        if (!visited[i]) {
            answer += dfs(computers,i,&visited)
        }
    }
    
    return answer
}

print(solution(3, [[1, 1, 0], [1, 1, 0], [0, 0, 1]]))
