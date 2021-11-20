//
//  Q11050-BinomialCoefficient .swift
//  BOJ_PS
//
//  Created by 김태훈 on 2021/11/20.
//  이항계수1 수학 구현

let input = readLine()!.split(separator: " ").map { Int(String($0))! }

func factorial(_ n: Int) -> Int {
    if n <= 1 {
        return 1
    }
    
    return n * factorial(n-1)
}

print(factorial(input[0]) / (factorial(input[0]-input[1]) * factorial(input[1])))
