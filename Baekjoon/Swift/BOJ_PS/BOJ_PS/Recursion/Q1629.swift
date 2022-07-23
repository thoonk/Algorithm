//
//  Q1629.swift
//  BOJ_PS
//
//  Created by 김태훈 on 2021/05/25.
//  곱셈 / 분할정복, 재귀
/*
 a^b를 구하는 식에서
 b가 짝수일 때, a^(b/2) * a^(b/2)
 b가 홀수일 때, a^(b/2) * a^(b/2) * a
 */
let nums = readLine()!.split(separator: " ").map { Int(String($0))! }

func oprt(_ a: Int, _ b: Int, _ c: Int) -> Int {
    if b == 1 {
        return a % c
    }
    var temp = oprt(a, b/2, c)
    temp = temp * temp % c
    guard b % 2 == 1 else { return temp }
    return temp * a % c
}

print(oprt(nums[0], nums[1], nums[2]))
