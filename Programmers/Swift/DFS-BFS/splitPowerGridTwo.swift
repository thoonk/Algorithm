// 전력망을 둘로 나누기 / 86971

import Foundation

func solution(_ n:Int, _ wires:[[Int]]) -> Int {
    var graph = [[Int]](repeating: [Int](), count: n + 1)
    var result = n
    
    for wire in wires {
        graph[wire[0]].append(wire[1])
        graph[wire[1]].append(wire[0])
    }
    
    func bfs(start: Int, visited: inout [Bool]) -> Int {
        var q: [Int] = [start]
        var index = 0
        visited[start] = true
        var connected = 1
        
        while index < q.count {
            let now = q[index]
            index += 1
            
            for node in graph[now] {
                if visited[node] == false {
                    visited[node] = true
                    q.append(node)
                    connected += 1
                }
            }
        }
        
        return connected
    }
    
    for wire in wires {
        var visited = [Bool](repeating: false, count: n + 1)
        visited[wire[1]] = true
        var connected = bfs(start: wire[0], visited: &visited)
        connected = abs(connected - (n - connected))
        result = min(result, connected)
    }
    
    return result
}

print(solution(9, [[1,3],[2,3],[3,4],[4,5],[4,6],[4,7],[7,8],[7,9]])) // 3

func solution2(_ n:Int, _ wires:[[Int]]) -> Int {
    var graph = [[Int]](repeating: [Int](), count: n + 1)
    var result = n
    
    for wire in wires {
        graph[wire[0]].append(wire[1])
        graph[wire[1]].append(wire[0])
    }
    
    func dfs(start: Int, visited: inout [Bool]) -> Int {
        var connected = 1
        visited[start] = true
        
        for node in graph[start] {
            if visited[node] == false {
                connected += dfs(start: node, visited: &visited)
            }
        }
        
        return connected
    }
    
    for wire in wires {
        var visited = [Bool](repeating: false, count: n + 1)
        visited[wire[1]] = true
        var connected = dfs(start: wire[0], visited: &visited)
        connected = abs(connected - (n - connected))
        result = min(result, connected)
    }
    
    return result
}

print(solution2(9, [[1,3],[2,3],[3,4],[4,5],[4,6],[4,7],[7,8],[7,9]])) // 3
