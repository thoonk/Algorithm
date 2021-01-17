//
//  main.swift
//  Programmers
//
//  Created by 김태훈 on 2021/01/15.
//  튜플 카카오 Level2

import Foundation

func solution(_ s:String) -> [Int] {
    
    var result = [Int]()
    
    var tuples = s.split(omittingEmptySubsequences: true, whereSeparator: { $0 == "{"}).map {
        $0.split(omittingEmptySubsequences: true, whereSeparator: {$0 == "}" || $0 == ","}).map { Int($0)! }
    }.sorted(by: { $0.count < $1.count })
    
    for tuple in tuples {
        result.append(contentsOf: Set(tuple).subtracting(result))
    }

    return result
}

print(solution("{{2},{2,1},{2,1,3},{2,1,3,4}}"))
print(solution("{{4,2,3},{3},{2,3,4,1},{2,3}}"))
