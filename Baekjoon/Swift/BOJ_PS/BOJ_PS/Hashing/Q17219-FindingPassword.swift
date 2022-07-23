//
//  Q17219-FindingPassword.swift
//  BOJ_PS
//
//  Created by thoonk on 2022/02/12.
//  비밀번호 찾기

import Foundation

let nm = readLine()!.split(separator: " ").map { Int(String($0))! }

/// 저장된 사이트 주소의 수
let n = nm[0]
/// 비밀번호를 찾으려는 사이트 주소의 수
let m = nm[1]

var accounts = [String: String]()
for _ in 0..<n {
    let input = readLine()!.split(separator: " ").map { String($0) }
    let site = input[0]
    let password = input[1]
    accounts[site] = password
}

for _ in 0..<m {
    let input = readLine()!
    print(accounts[input]!)
}
