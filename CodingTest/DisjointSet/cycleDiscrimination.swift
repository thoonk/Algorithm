//
//  main.swift
//  CodingTest
//
//  Created by 김태훈 on 2020/11/10.
//  서로소 집합을 활용한 사이클 판별

import Foundation

// 특정 원소가 속한 집합 찾기 (경로 압축 기법)
func findParent(_ parent: inout [Int], _ x: Int)-> Int {
    // 루트 노드가 아니라면, 루트 노드를 찾을 때까지 재귀적으로 호출
    if parent[x] != x {
        parent[x] = findParent(&parent, parent[x])
    }
    return parent[x]
}
// 두 원소가 속한 집합 합치기
func unionParent(_ parent: inout [Int], _ a: Int, _ b: Int) {
    let a = findParent(&parent, a)
    let b = findParent(&parent, b)
    if a < b {
        parent[b] = a
    } else{
        parent[a] = b
    }
}

func solution(){
    let ve = readLine()!.split(separator: " ").map {Int($0)!}
    let v = ve[0]
    let e = ve[1]
    
    var parent = Array(repeating: 0, count: v+1)
    
    for i in stride(from: 1, to: v+1, by: 1) {
        parent[i] = i
    }
    // 사이클 발생 여부
    var cycle = false
    
    for _ in stride(from: 0, to: e, by: 1){
        let ab = readLine()!.split(separator: " ").map {Int($0)!}
        // 사이클 발생한 경우 종료
        if findParent(&parent, ab[0]) == findParent(&parent, ab[1]){
            cycle = true
            break
        }
        // 사이클이 발생하지 않았다면 union 수행
        else {
            unionParent(&parent, ab[0], ab[1])
        }
    }
    
    if cycle{
        print("사이클이 발생하였습니다.")
    } else {
        print("사이클이 발생하지 않았습니다.")
    }
    
}
solution()


/*
3 3
1 2
1 3
2 3
*/
