//
//  main.swift
//  CodingTest
//
//  Created by 김태훈 on 2020/11/02.
//  두 배열의 원소 교체

import Foundation

var nk = readLine()!.split(separator: " ").map {Int($0)!}
var a = readLine()!.split(separator: " ").map {Int($0)!}
var b = readLine()!.split(separator: " ").map {Int($0)!}

a = a.sorted()
b = b.sorted(by: >)

for i in stride(from: 0, to: nk[1], by: 1){
    if a[i] < b[i]{
       swap(&a[i], &b[i])
    }
    else{
        break
    }
}
print(a)
// reduce 함수를 이용하여 a의 모든 원소의 합을 구함
var sum = a.reduce(0, +)
print(sum)

 
