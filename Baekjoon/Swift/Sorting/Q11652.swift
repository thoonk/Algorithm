//
//  Q11652.swift
//  BOJ_PS
//
//  Created by 김태훈 on 2021/06/07.
//  카드 / 정렬

var cards = [Int: Int]()
for _ in 0 ..< Int(readLine()!)! {
    let n = Int(readLine()!)!
    if cards.keys.contains(n) {
        cards[n]! += 1
    } else {
        cards[n] = 1
    }
}

var res = cards.sorted { $0.value == $1.value ? $0.key < $1.key : $0.value > $1.value }
print(res.first!.key)
