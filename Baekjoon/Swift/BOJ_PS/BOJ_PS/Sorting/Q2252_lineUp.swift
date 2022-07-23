//
//  main.swift
//  BOJ_PS
//
//  Created by 김태훈 on 2020/11/12.
//  Q2252 줄세우기 (위상 정렬)

import Foundation

func solution(){
    
    let nm = readLine()!.split(separator: " ").map {Int($0)!}
    let n = nm[0]
    let m = nm[1]
    
    var indegree = Array(repeating: 0, count: n+1)
    var graph = Array(repeating: [Int](), count: n+1)
    
    for _ in stride(from: 0, to: m, by: 1){
        let ab = readLine()!.split(separator: " ").map {Int($0)!}
        graph[ab[0]].append(ab[1])
        indegree[ab[1]] += 1
    }
    
    func topologySorting() {
        var result = [Int]()
        var q = [Int]()
        
        for i in stride(from: 1, to: n+1, by: 1){
            
            if indegree[i] == 0 {
                q.append(i)
            }
        }
        
        while !q.isEmpty {
            let now = q.removeFirst()
            result.append(now)
            
            for i in graph[now] {
                indegree[i] -= 1
                if indegree[i] == 0{
                    q.append(i)
                }
            }
        }
        for i in result {
            print(i, terminator: " ")
        }
    }
    topologySorting()
}
solution()
