//
//  main.swift
//  Programmers
//
//  Created by 김태훈 on 2021/01/27.
//  뉴스 클러스터링 카카오 Level2 

import Foundation

func solution(_ str1:String, _ str2:String) -> Int {
    
    var set1 = [String]()
    var set2 = [String]()
    var intersect = [String]()
    var union = [String]()
    
    for i in 0..<str1.count-1 {
        let first = String(str1[str1.index(str1.startIndex, offsetBy: i)]).lowercased()
        let second = String(str1[str1.index(str1.startIndex, offsetBy: i+1)]).lowercased()
        if isAlpha(first, second) {
            set1.append(first+second)
        }
    }
    
    for i in 0..<str2.count-1 {
        let first = String(str2[str2.index(str2.startIndex, offsetBy: i)]).lowercased()
        let second = String(str2[str2.index(str2.startIndex, offsetBy: i+1)]).lowercased()
        if isAlpha(first, second) {
            let temp = first+second
            set2.append(temp)
            if set1.contains(temp) {
                intersect.append(temp)
                set1.remove(at: set1.firstIndex(of: temp)!)
                set2.remove(at: set2.firstIndex(of: temp)!)
            }
        }
    }
    
    union = set1 + set2 + intersect

    return union.isEmpty ? 65536 : Int(Double(intersect.count)/Double(union.count)*65536)
}

func isAlpha(_ a: String, _ b: String) -> Bool {
    return a >= "a" && a <= "z" && b >= "a" && b <= "z"
}

print(solution("FRANCE", "french"))
print(solution("aa1+aa2", "AAAA12"))
print(solution("E=M*C^2", "e=m*c^2"))
