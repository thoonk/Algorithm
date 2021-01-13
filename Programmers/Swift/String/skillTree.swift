//
//  main.swift
//  Programmers
//
//  Created by 김태훈 on 2021/01/13.
//  스킬트리 Level2

import Foundation

func solution(_ skill:String, _ skill_trees:[String]) -> Int {
    
    var result = 0
    
    for skills in skill_trees {
        let lst = skills.filter { skill.contains($0) }
        let check = skill.prefix(lst.count)
        
        result += lst == check ? 1 : 0
    }
    
    return result
}
