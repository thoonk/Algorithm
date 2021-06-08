//
//  Q11729.swift
//  BOJ_PS
//
//  Created by 김태훈 on 2021/06/08.
//  하노이 탑 이동 순서 / 재귀
/*
 a, b, c가 순서대로 있을 때 c로 모든 원판을 옮겨야 하니
 n-1개의 원판을 a -> b, 마지막 원판을 a -> c로 옮긴다.
 그리고 또 n-1개를 옮기는건 n-1-1개와 마지막 원판을 옮기는 것의 문제로 나뉘어진다.
 */
var n = Int(readLine()!)!
var cnt = 1
var res = ""
func hanoi(_ n: Int, _ start: Int, _ via: Int, _ to: Int) {
    if n == 1 {
        res += "\(start) \(to)\n"
    } else {
        hanoi(n-1, start, to, via)
        res += "\(start) \(to)\n"
        hanoi(n-1, via, start, to)
    }
}
func solution() {
    for _ in 0 ..< n-1 {
        cnt = cnt * 2 + 1
    }
    print(cnt)
    hanoi(n, 1, 2, 3)
    res.removeLast()
    print(res)
}
solution()
