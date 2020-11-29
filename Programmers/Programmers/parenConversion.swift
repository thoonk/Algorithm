//
//  main.swift
//  Programmers
//
//  Created by 김태훈 on 2020/11/29.
//  2020카카오 괄호 변환 (구현)

import Foundation

func solution(_ p:String) -> String {
    let w = Array(p).map {String($0)}
    var result = ""
    
    if p == "" {
        return ""
    }
    
    let index = balancedString(w)
    var u = w[w.startIndex...index].map {String($0)}
    var v = w[index+1..<w.endIndex]

    if isRight(u) == true{
        result = u.joined() + solution(v.joined())
    }
    else {
        result = "("
        result += solution(v.joined())
        result += ")"
        
        u.removeFirst()
        u.removeLast()
        
        for i in 0 ..< u.count{
            if u[i] == "("{
                u[i] = ")"
            } else {
                u[i] = "("
            }
        }
        result += u.joined()
    }
    
    
    return result
}

func balancedString(_ w: [String]) -> Int{
    var cnt = 0
    for i in 0 ..< w.count {
        if w[i] == "(" {
            cnt += 1
        } else {
            cnt -= 1
        }
        if cnt == 0 {
            return i
        }
    }
    return -1
}

func isRight(_ w: [String]) -> Bool {
    var cnt = 0
    for i in 0 ..< w.count {
        if w[i] == "(" {
            cnt += 1
        } else {
            if cnt == 0 {
                return false
            }
        }
    }
    return true
}

print(solution("()))((()"))
