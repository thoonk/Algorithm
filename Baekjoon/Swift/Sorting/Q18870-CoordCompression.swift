//
//  main.swift
//  BOJ_PS
//
//  Created by 김태훈 on 2021/04/14.
//  좌표 압축 정렬

let n = Int(readLine()!)!
var input = readLine()!.split(separator: " ").map { Int(String($0))! }
var setX = Array(Set(input))
var dic = [Int: Int]()

setX.sort()


for (i, value) in setX.enumerated(){
    dic[value] = i
}

for x in input {
    print(dic[x]!, terminator: " ")
}
