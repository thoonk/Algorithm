//
//  Q10102-ballot_counting.swift
//  BOJ_PS
//
//  Created by thoonk on 2022/08/02.
//  개표 / 문자열

let v = Int(readLine()!)!
let votes = Array(readLine()!.map { String($0) })

if votes.filter({ $0 == "A" }).count > v / 2 {
    print("A")
} else if votes.filter({ $0 == "B"}).count > v / 2 {
    print("B")
} else {
    print("Tie")
}
