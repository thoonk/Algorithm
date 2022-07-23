//
//  combination.swift
//  BOJ_PS
//
//  Created by 김태훈 on 2021/04/26.
//

// n개 중 k개를 뽑는 모든 경우의 수 출력
func combos<T>(elements: ArraySlice<T>, k: Int) -> [[T]] {
    if k == 0 {
        return [[]]
    }
    
    guard let first = elements.first else { return [] }
    
    let head = [first]
    let subcombos = combos(elements: elements, k: k - 1)
    var ret = subcombos.map { head + $0 }
    ret += combos(elements: elements.dropFirst(), k: k)
    
    return ret
}

// n개 중 k개를 뽑는 모든 경우의 수 출력(개수)
func numOfCombos(_ n: Int, _ k: Int) -> Int {
    if n == k || k == 0 {
        return 1
    } else {
        return numOfCombos(n-1, k) + numOfCombos(n-1, k-1)
    }
}
