//
//  main.swift
//  BOJ_PS
//
//  Created by 김태훈 on 2021/04/24.
//  패션왕 신해빈 해싱, 문자열

let t = Int(readLine()!)!

for _ in 0 ..< t {
    let n = Int(readLine()!)!
    var daily = [String: Int]()
    
    for _ in 0 ..< n {
        let input = readLine()!.split(separator: " ").map { String($0) }
        let key = input[1]
        let value = daily[key] ?? 1
        daily[key] = value + 1
    }
    print(daily.reduce(1) { $0 * $1.value } - 1)
}
