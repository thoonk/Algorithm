//
//  Q11656.swift
//  BOJ_PS
//
//  Created by 김태훈 on 2021/06/20.
//  접미사 배열 / 정렬, 문자열

var s = readLine()!
var suffixArr = [String]()

for i in 1 ... s.count {
    suffixArr.append(String(s.suffix(i)))
}
suffixArr.sort()
suffixArr.forEach { print($0) }
