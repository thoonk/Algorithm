//
//  main.swift
//  Programmers
//
//  Created by 김태훈 on 2021/01/01.
//  문자열 내 p와 y의 개수 Level1

import Foundation

func solution(_ s:String) -> Bool
{
    let s = s.lowercased()
    let pCnt = s.filter { $0 == "p" }.count
    let yCnt = s.filter { $0 == "y" }.count

    return pCnt == yCnt ? true : false
}

print(solution("pPoooyY"))
