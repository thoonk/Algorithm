//
//  main.swift
//  CodingTest
//
//  Created by 김태훈 on 2020/11/17.
//  문자열 재정렬 (구현)

import Foundation

func solution(){
    var s = Array(readLine()!)
    var str = [String]()
    var sum: Int = 0
    
    for i in s {
        if i.isAlpha() == true{
            str.append(String(i))
        } else {
            sum = sum + Int(String(i))!
        }
    }
    str.sort()
    str.append(String(sum))
    
    for i in str{
        print(i, terminator: "")
    }
}

solution()

extension Character{
    func isAlpha() -> Bool {
        switch self {
        case "a"..."z":
            return true
        case "A"..."Z":
            return true
        default:
            return false
        }
    }
}

// K1KA5CB7
