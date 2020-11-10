//
//  main.swift
//  CodingTest
//
//  Created by 김태훈 on 2020/11/10.
//  최적화된 서로소 집합 알고리즘

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

func solution() {
    // 노드의 개수와 간선(union연산)의 개수 입력
    let ve = readLine()!.split(separator: " ").map {Int($0)!}
    let v = ve[0]
    let e = ve[1]
    // 부모 테이블 초기화
    var parent = Array(repeating: 0, count: v+1)
    // 부모 테이블 상에서, 부모를 자기 자신으로 초기화
    for i in stride(from: 1, to: v+1, by: 1){
        parent[i] = i
    }
    // union 연산 각각 수행
    for _ in stride(from: 0, to: e, by: 1) {
        let ab = readLine()!.split(separator: " ").map {Int($0)!}
        unionParent(&parent, ab[0], ab[1])
    }
    // 각 원소가 속한 집합 출력
    print("각 원소가 속한 집합: ", terminator: " ")
    for i in stride(from: 1, to: v+1, by: 1){
        print(findParent(&parent, i), terminator: " ")
    }
    print()
    // 부모 테이블 내용 출력
    print("부모 테이블: ", terminator:" ")
    for i in stride(from: 1, to: v+1, by: 1){
        print(parent[i], terminator: " ")
    }
}
solution()

/*
6 4
1 4
2 3
2 4
5 6
*/
