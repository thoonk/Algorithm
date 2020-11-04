//
//  main.swift
//  CodingTest
//
//  Created by 김태훈 on 2020/11/03.
//

import Foundation

// 메모리제이션
var d = Array(repeating: 0, count: 100)

func fibo(_ x: Int) -> Int{
    if x == 1 || x == 2{
        return 1
    }
    
    if d[x] != 0{
        return d[x]
    }
    d[x] = fibo(x-1) + fibo(x-2)
    return d[x]
}
print(fibo(99))



