//
//  main.swift
//  BOJ_PS
//
//  Created by 김태훈 on 2021/04/18.
//  괄호 문자열, 스택

func solution(pss: [String]) -> Bool {
    var cnt = 0
    for ps in pss {
        if ps == "(" {
            cnt += 1
        }
        // ")"일 때
        else {
            if cnt == 0 {
                return false
            } else {
                cnt -= 1
            }
        }
    }
    return cnt == 0 ? true : false
}

for _ in 0 ..< Int(readLine()!)! {
    let input = Array(readLine()!).map { String($0) }
    let result = solution(pss: input)
    
    print(result ? "YES" : "NO")
}

