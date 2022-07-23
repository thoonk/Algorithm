//
//  Q1439.swift
//  BOJ_PS
//
//  Created by 김태훈 on 2021/06/08.
//  하노이 탑 이동 순서 / 재귀

var s = Array(readLine()!).map { Int(String($0))! }
var cnt: (zero: Int, one: Int) = (0,0)

func counting(for n: Int) {
    if n == 0 {
        cnt.zero += 1
    } else {
        cnt.one += 1
    }
}

counting(for: s.first!)
for i in 1 ..< s.count {
    guard s[i] != s[i-1] else { continue }
    counting(for: s[i])
}
print(min(cnt.zero, cnt.one))
