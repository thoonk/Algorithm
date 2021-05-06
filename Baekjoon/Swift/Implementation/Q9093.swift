//
//  main.swift
//  BOJ_PS
//
//  Created by 김태훈 on 2021/05/06.
//  단어 뒤집기 / 문자열

let t = Int(readLine()!)!

for _ in 0 ..< t {
    let strs = readLine()!.split(separator: " ").map { String($0) }
    var reversedStrs = [String]()
    for str in strs {
        reversedStrs.append(String(str.reversed()))
    }
    print(reversedStrs.joined(separator: " "))
}
