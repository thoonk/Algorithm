//
//  main.swift
//  Programmers
//
//  Created by 김태훈 on 2020/12/11.
//  여행 경로 (DFS)

import Foundation

func solution(_ tickets:[[String]]) -> [String] {
    
    var visited = Array(repeating: false, count: tickets.count)
    var start = "ICN"
  
    let sortedTickets = tickets.sorted(by: { $0[1] < $1[1] })
    var route = [String]()
    var result = [String]()
    print(sortedTickets)
    func dfs(_ cnt: Int, _ visited: inout [Bool], _ start: String) {
        route.append(start)
        if cnt == tickets.count {
            result = route
            return
        }
        if result.isEmpty {
            for i in 0..<tickets.count {
                if sortedTickets[i][0] == start, !visited[i] {
                    visited[i] = true
                    dfs(cnt+1, &visited, sortedTickets[i][1])
                    visited[i] = false
                }
            }
        }
        route.removeLast()
    }
    dfs(0, &visited, start)
    return result
}
print(solution([["ICN", "SFO"], ["ICN", "ATL"], ["SFO", "ATL"], ["ATL", "ICN"], ["ATL","SFO"]]))
//[["ICN", "A"], ["ICN", "B"], ["B", "ICN"]]
//[["ICN", "SFO"], ["ICN", "ATL"], ["SFO", "ATL"], ["ATL", "ICN"], ["ATL","SFO"]]
