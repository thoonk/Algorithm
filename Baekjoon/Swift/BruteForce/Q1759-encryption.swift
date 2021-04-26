//
//  main.swift
//  BOJ_PS
//
//  Created by 김태훈 on 2021/04/26.
//  1759 암호만들기 브루트포스, 조합

let lc = readLine()!.split(separator: " ").map { Int(String($0))! }
let l = lc[0]
let c = lc[1]

var alpha = readLine()!.split(separator: " ").map { String($0) }.sorted()
var available = [Bool](repeating: true, count: c)
var completed = ""
var vowel = Set<Character>("aeiou")

encryption(0)

func encryption(_ index: Int) {
    guard completed.count != l else {
        let vowelCnt = vowel.intersection(completed).count
        if vowelCnt >= 1 && completed.count - vowelCnt >= 2 {
            print(completed)
        }
        return
    }
    
    for i in index ..< alpha.count {
        available[i] = false
        completed.append(contentsOf: alpha[i])
        encryption(i+1)
        available[i] = true
        completed.popLast()
    }
}




