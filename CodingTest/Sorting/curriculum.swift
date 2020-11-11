//
//  main.swift
//  CodingTest
//
//  Created by 김태훈 on 2020/11/11.
//  커리큘럼 (위상 정렬)

import Foundation

func solution(){
    let n = Int(readLine()!)!
    
    var indegree = Array(repeating: 0, count: n+1)
    var graph = Array(repeating: [Int](), count: n+1)
    
    var time = Array(repeating: 0, count: n+1)
    
    for i in stride(from: 1, to: n+1, by: 1){
        let data = readLine()!.split(separator: " ").map {Int($0)!}
        time[i] = data[0]
        
        for x in stride(from: 1, to: data.count-1, by: 1){
            indegree[i] += 1
            graph[data[x]].append(i)
        }
    }
    
    func topologySort() {
        var result = time
        var q = [Int]()
        
        for i in stride(from: 1, to: n+1, by: 1){
            if indegree[i] == 0{
                q.append(i)
            }
        }
        
        while !q.isEmpty{
            let now = q.removeFirst()
            
            for i in graph[now]{
                result[i] = max(result[i], result[now] + time[i])
                indegree[i] -= 1
                
                if indegree[i] == 0 {
                    q.append(i)
                }
            }
        }
        for i in stride(from: 1, to: n+1, by: 1){
            print(result[i])
        }
    }
    topologySort()
}
solution()
