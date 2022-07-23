//
//  Q1431.swift
//  BOJ_PS
//
//  Created by 김태훈 on 2021/06/03.
//  시리얼 번호 / 정렬

var serials = [String]()
for _ in 0 ..< Int(readLine()!)! {
    serials.append(readLine()!)
}

func getSum(_ s: String) -> Int {
    let str = Array(s).map { String($0) }
    var sum = 0
    for char in str {
        if Int(char) != nil {
            sum += Int(char)!
        }
    }
    return sum
}

serials.sort {
    if $0.count == $1.count {
        if getSum($0) == getSum($1) {
            return $0 < $1
        } else {
            return getSum($0) < getSum($1)
        }
    } else {
        return $0.count < $1.count
    }
}

serials.forEach { print($0) }
