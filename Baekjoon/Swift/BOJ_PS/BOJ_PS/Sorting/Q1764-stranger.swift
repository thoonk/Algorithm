//
//  main.swift
//  BOJ_PS
//
//  Created by 김태훈 on 2021/04/09.
//  듣보잡 집합, 정렬

let nm = readLine()!.split(separator: " ").map { Int(String($0))! }
let n = nm[0]
let m = nm[1]

var unheardPpl = Set<String>()
var unSeenPpl = Set<String>()

for _ in 0 ..< n {
    let input = readLine()!
    unheardPpl.insert(input)
}

for _ in 0 ..< m {
    let input = readLine()!
    unSeenPpl.insert(input)
}

let stranger = unheardPpl.intersection(unSeenPpl).sorted()
print(stranger.count)
stranger.forEach {
    print($0)
}
