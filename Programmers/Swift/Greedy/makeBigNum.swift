//
//  main.swift
//  Programmers
//
//  Created by 김태훈 on 2020/11/27.
//  큰 수 만들기 (그리디)

import Foundation

func solution(_ number:String, _ k:Int) -> String {
    let len = number.count
    let arr = number.map {String($0)}
    var result = [String]()
    var cnt = 0

    for i in 0 ..< len{
        // 빼는 횟수가 K보다 크면 안됨
        // result의 마지막이 arr[i]보다 작으면 계속 반복하기 때문에 비면 안됨
        while cnt < k && !result.isEmpty && result.last! < arr[i] {
            result.removeLast()
            cnt += 1
        }
        // 카운트가 k와 같아지기 전까지 arr[i] 추가
        if cnt < k {
            result.append(arr[i])
        }
        // 같아질 경우 더 이상 삭제를 할 수 없기 때문에 나머지 부분 추가
        else {
            result.append(contentsOf: arr[i...])
            break
        }
    }
    return String(result.joined().prefix(len-k))
}

print(solution("4177252841", 4))
