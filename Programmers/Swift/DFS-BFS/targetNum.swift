//
//  main.swift
//  Programmers
//
//  Created by 김태훈 on 2020/12/10.
//  타겟 넘버 DFS

import Foundation

func solution(_ numbers:[Int], _ target:Int) -> Int {
    
    var cnt = 0

    func dfs(_ index: Int, _ result: Int) {
                
        if index == numbers.count {
            if target == result {
               cnt += 1
            }
            return
        }

        dfs(index+1, result + numbers[index])
        dfs(index+1, result - numbers[index])
    }
    
    dfs(0,0)
    return cnt
}

print(solution([1, 1, 1, 1, 1], 3))
