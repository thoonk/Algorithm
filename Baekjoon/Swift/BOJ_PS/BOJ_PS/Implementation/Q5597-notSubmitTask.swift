//
//  main.swift
//  BOJ_PS
//
//  Created by 김태훈 on 2021/03/31.
//  과제 안 내신 분..? 구현

var rollBook = [Bool](repeating: false, count: 31)
var student = [Int]()

for _ in 0..<28 {
    let input = Int(readLine()!)!
    rollBook[input] = true
}

for i in 1..<31 {
    if rollBook[i] == false {
        student.append(i)
    }
}

student.forEach {
    print($0)
}
