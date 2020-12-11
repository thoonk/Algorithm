//
//  main.swift
//  Programmers
//
//  Created by 김태훈 on 2020/12/11.
//  단어변환 DFS

import Foundation

func solution(_ begin:String, _ target:String, _ words:[String]) -> Int {
    var visited = Array(repeating: false, count: words.count)
    var answer = Int.max
    
    func dfs(_ now: String, _ cnt: Int) {
        
        if now == target {
            answer = min(answer, cnt)
            return
        }
        
        for i in 0 ..< words.count {
            if !visited[i], zip(now, words[i]).filter({$0 != $1}).count == 1 {
                visited[i] = true
                dfs(words[i], cnt+1)
                visited[i] = false
            }
        }
    }
    
    dfs(begin, 0)
    return answer
}

print(solution("hit", "cog", ["hot", "dot", "dog", "lot", "log", "cog"]))
