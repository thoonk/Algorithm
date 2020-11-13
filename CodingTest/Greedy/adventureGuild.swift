//
//  main.swift
//  CodingTest
//
//  Created by 김태훈 on 2020/11/13.
//  모험가 길드 (그리디 알고리즘)
//  공포도가 X인 모험가는 반드시 X명 이상으로 구성한 모험가 그룹에 참여해야 여행 떠날 수 있도록 규정함

import Foundation

func solution(){
    let n = Int(readLine()!)!
    
    var people = readLine()!.split(separator: " ").map {Int($0)!}
    people.sort()
    
    var result = 0
    var cnt = 0
    
    for i in people{
        cnt += 1
        if cnt >= i {
            result += 1
            cnt = 0
        }
    }
    print(result)
}
solution()

/*
5
2 3 1 2 2
*/
