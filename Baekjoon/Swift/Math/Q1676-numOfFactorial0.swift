//
//  Q1676-numOfFactorial0.swift
//  BOJ_PS
//
//  Created by thoonk on 2022/02/15.
//  팩토리얼 0의 개수

/*
 0의 개수는 10(2 * 5)을 몇 번 곱하는가
 결국은 5로 나눈 값의 누적합이 0의 개수가 된다.
 */

var n = Int(readLine()!)!
var result = 0

while n >= 5 {
    result += n / 5
    n /= 5
}

print(result)
