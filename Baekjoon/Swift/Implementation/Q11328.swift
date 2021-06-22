//
//  Q11328.swift
//  BOJ_PS
//
//  Created by 김태훈 on 2021/06/22.
//  Strfry / 구현, 문자열

func strfry(_ str: [String]) {
    let first = str[0]
    let second = str[1]
    var counter = [Int](repeating: 0, count: 26)
    
    guard first.count == second.count else {
        print("Impossible")
        return
    }
    
    for s in first {
        counter[Int(s.asciiValue!) - 97] += 1
    }
    for s in second {
        counter[Int(s.asciiValue!) - 97] -= 1
    }
    
    print(counter.filter({ $0 == 0 }).count == 26 ? "Possible" : "Impossible")
}

for _ in 0 ..< Int(readLine()!)! {
    let str = readLine()!.split(separator: " ").map { String($0) }
    strfry(str)
}
