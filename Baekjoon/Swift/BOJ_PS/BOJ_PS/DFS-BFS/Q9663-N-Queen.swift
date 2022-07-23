//
//  Q9663-N-Queen.swift
//  BOJ_PS
//
//  Created by thoonk on 2022/07/05.
//  N-Queen DFS 백트래킹

var n = Int(readLine()!)!

var result = 0
var columns = [Int](repeating: 0, count: n)
var visited = [Bool](repeating: false, count: n)

func dfs(x: Int) {
    if x == n {
        result += 1
        return
    }
    
    for i in 0..<n {
        if visited[i] {
            continue
        }
        
        columns[x] = i
        if !isCanAttack(x: x) {
            visited[i] = true
            dfs(x: x + 1)
            visited[i] = false
        }
    }
}

func isCanAttack(x: Int) -> Bool {
    for i in 0..<x {
        if columns[x] == columns[i] ||
            abs(columns[i] - columns[x]) == x - i {
            return true
        }
    }
    
    return false
}

dfs(x: 0)
print(result)
