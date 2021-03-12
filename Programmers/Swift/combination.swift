//
//  main.swift
//  Programmers
//
//  Created by 김태훈 on 2021/01/09.
//  조합 함수

import Foundation

func combination(_ total: Int, _ shouldSelect: Int) -> Int {
    if total == shouldSelect || shouldSelect == 0 {
        return 1
    } else {
        return combination(total-1, shouldSelect) + combination(total-1, shouldSelect-1)
    }
}
