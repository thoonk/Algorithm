//
//  Q2217.swift
//  BOJ_PS
//
//  Created by 김태훈 on 2021/05/31.
//  로프 / 그리디, 정렬, 수학
//  중량 기준 오름차순 정렬하여 0부터 n-1까지 반복했을 때
//  최대 중량의 값은 i번째 로프 중량 * n-1
//  로프의 허용 무게가 낮을수록 최대한 많은 로프를 병렬로 연결해야 최대 중량이 늘어나고
//  로프의 허용 무게가 높을수록 최대한 적은 로프를 병렬로 연결해야 최대 중량이 늘어난다.
let n = Int(readLine()!)!
var ropes = [Int]()
var res = 0

for _ in 0 ..< n {
    ropes.append(Int(readLine()!)!)
}
ropes.sort()

for i in 0 ..< n {
    res = max(res, ropes[i] * (n-i))
}
print(res)
