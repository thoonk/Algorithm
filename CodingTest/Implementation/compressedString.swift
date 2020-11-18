//
//  main.swift
//  CodingTest
//
//  Created by 김태훈 on 2020/11/18.
//  문자열 압축 (구현), 2020 카카오 코딩테스트

import Foundation

func solution(){

    let s = Array(readLine()!)
    var result = s.count
    // 반으로 나눈 후 짜를 개수를 1씩 증가
    for i in stride(from: 1, through: s.count / 2, by: 1){
        var compressed = ""
        // 앞에서 i 만큼 문자열 추출
        var prev = s.prefix(i)
        var count = 1
        // i 만큼 증가시켜서 이전 문자열과 비교
        for j in stride(from: i, to: s.count, by: i){
            // s에서 j 만큼 이동한 문자열 뺀 것
            let remain = s.suffix(s.count-j)
            // s에서 i 만큼 이동한 문자열
            let prefix = remain.prefix(i)
            // 이전 문자열과 자른 문자열과 같다면
            if prev == prefix {
                count += 1
            }
            // 다른 문자열이 나와 압축 못 한다면
            else {
                if count >= 2{
                    compressed += String(count) + prev
                } else {
                    compressed += prev
                }
                // 초기화
                prev = prefix
                count = 1
            }
        }
        // 남아 있는 문자열 더해주기
        if count >= 2 {
            compressed += String(count) + prev
        } else {
            compressed += prev
        }
        // 압축 문자열이 가장 적은 것으로
        result = min(result, compressed.count)
    }
    print(result)
}

solution()
