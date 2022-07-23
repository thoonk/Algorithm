//
//  main.swift
//  BOJ_PS
//
//  Created by 김태훈 on 2021/05/07.
//  명령 프롬프트 문자열, 구현

let n = Int(readLine()!)!
var files = [[String]]()

for _ in 0 ..< n {
    files.append(Array(readLine()!).map { String($0) })
}

var comparer = files[0]
for i in 1 ..< n {
    for j in 0 ..< files[0].count {
        if comparer[j] != files[i][j] {
            comparer[j] = "?"
        }
    }
}
print(comparer.joined())
