//
//  main.swift
//  BOJ_PS
//
//  Created by 김태훈 on 2020/12/06.
//  Q14888 연산자 끼워넣기 (DFS)

import Foundation

func solution() {
    
    let n = Int(readLine()!)!
    let nums = readLine()!.split(separator: " ").map {Int(String($0))!}
    let oper = readLine()!.split(separator: " ").map {Int(String($0))!}
    var plus = oper[0]
    var minus = oper[1]
    var multiply = oper[2]
    var divide = oper[3]
    
    var maxResult = Int.min
    var minResult = Int.max
    
    func dfs(opCnt: Int, result: Int) {
        // 연산에 모든 피연산자가 다 쓰였다면 최대, 최소 값 갱신
        if opCnt == n {
            maxResult = max(maxResult, result)
            minResult = min(minResult, result)
        }
        
        if plus > 0 {
            plus -= 1
            dfs(opCnt: opCnt+1, result: result + nums[opCnt])
            plus += 1
        }
        if minus > 0 {
            minus -= 1
            dfs(opCnt: opCnt+1, result: result - nums[opCnt])
            minus += 1
        }
        if multiply > 0 {
            multiply -= 1
            dfs(opCnt: opCnt+1, result: result * nums[opCnt])
            multiply += 1
        }
        if divide > 0 {
            divide -= 1
            dfs(opCnt: opCnt+1, result: result / nums[opCnt])
            divide += 1
        }
        
    }
    
    dfs(opCnt: 1, result: nums[0])
    print(maxResult, minResult)
    
}

solution()
