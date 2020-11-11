//
//  main.swift
//  CodingTest
//
//  Created by 김태훈 on 2020/11/11.
//  팀 결성 (서로소 집합)

import Foundation

func findParent(_ parent: inout [Int], _ x: Int) -> Int {
    if parent[x] != x {
        parent[x] = findParent(&parent, parent[x])
    }
    return parent[x]
}

func unionParent(_ parent: inout [Int], _ a: Int, _ b: Int) {
    let a = findParent(&parent, a)
    let b = findParent(&parent, b)
    if a < b {
        parent[b] = a
    } else {
        parent[a] = b
    }
}

func solution() {
    
    let nm = readLine()!.split(separator: " ").map {Int($0)!}
    let n = nm[0]
    let m = nm[1]
    
    var parent = Array(repeating: 0, count: n+1)
    
    for i in stride(from: 0, to: n+1, by: 1){
        parent[i] = i
    }
    
    for _ in stride(from: 0, to: m, by: 1){
        let opers = readLine()!.split(separator: " ").map {Int($0)!}
        let oper = opers[0]
        let a = opers[1]
        let b = opers[2]
        
        if oper == 0{
            unionParent(&parent, a, b)
        }
        else if oper == 1 {
            if findParent(&parent, a) == findParent(&parent, b) {
                print("YES")
            } else {
                print("NO")
            }
        }
    }
}
solution()

/*
7 8
0 1 3
1 1 7
0 7 6
1 7 1
0 3 7
0 4 2
0 1 1
1 1 1
*/
