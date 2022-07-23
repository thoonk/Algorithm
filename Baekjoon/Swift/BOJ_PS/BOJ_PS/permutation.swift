//
//  permuteWirth.swift
//  BOJ_PS
//
//  Created by 김태훈 on 2021/04/26.
//  순열

func factorial(_ n: Int) -> Int {
    var result = 1
    
    for i in 1 ... n {
        result *= i
    }
    return result
}

func permuteWirth<T>(_ a: [T], _ n: Int) {
    if n == 0 {
        print(a)
    } else {
        var a = a
        permuteWirth(a, n-1)
        for i in 0 ..< n {
            a.swapAt(i, n)
            permuteWirth(a, n-1)
            a.swapAt(i, n)
        }
    }
}
