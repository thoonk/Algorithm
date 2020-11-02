//
//  main.swift
//  CodingTest
//
//  Created by 김태훈 on 2020/11/02.
//  성적이 낮은 순서로 학생 출력하기

import Foundation

let N = Int(readLine()!)!
var dic = [String:Int]()

for _ in stride(from: 0, to: N, by: 1){
    let nums = readLine()!.split(separator: " ")
    dic.updateValue(Int(nums[1])!, forKey: String(nums[0]))
}
// dic에 저장된 값에 따라 정렬 후 할당
let result = dic.sorted() {$0.1 < $1.1}

// 정렬된 dic의 키 값만 출력
for i in result {
    print(i.key, terminator: " ")
}
