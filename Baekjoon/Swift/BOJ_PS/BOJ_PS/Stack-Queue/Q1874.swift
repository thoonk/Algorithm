//
//  Q1874.swift
//  BOJ_PS
//
//  Created by 김태훈 on 2021/05/13.
//  스택 수열 / 스택

func solution() {
    var stack = [Int]()
    var res = [String]()
    var cnt = 1
    var isPossible = true
    
    for _ in 0 ..< Int(readLine()!)! {
        let num = Int(readLine()!)!
        while cnt <= num {
            stack.append(cnt)
            res.append("+")
            cnt += 1
        }
        
        if stack.last == num {
            stack.popLast()
            res.append("-")
        } else {
            isPossible = false
            break
        }
    }
    
    isPossible == false ? print("NO") : res.forEach { print($0) }
}

solution()
