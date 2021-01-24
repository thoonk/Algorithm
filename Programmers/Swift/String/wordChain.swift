//
//  main.swift
//  Programmers
//
//  Created by 김태훈 on 2021/01/23.
//  영어 끝말잇기 Level2

import Foundation

func solution(_ n:Int, _ words:[String]) -> [Int] {
    
    var temp = [String]()
    temp.append(words[0])
        
    for i in 1..<words.count {
        let lastWord = temp[temp.count-1]
        if temp.contains(words[i]) || words[i][words[i].startIndex] != lastWord[lastWord.index(before: lastWord.endIndex)] {
            if (i+1)%n != 0 {
                return [(i+1)%n, (i+1)/n+1]
            } else {
                return [n, (i+1)/n]
            }
        } else {
            temp.append(words[i])
        }
    }
    
    return [0,0]
}

print(solution(2, ["hello", "one", "even", "never", "now", "world", "draw"]))
