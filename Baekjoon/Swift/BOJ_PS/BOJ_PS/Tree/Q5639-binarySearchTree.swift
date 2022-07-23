//
//  main.swift
//  BOJ_PS
//
//  Created by 김태훈 on 2021/04/28.
//  이진 검색 트리 트리, 재귀

var nodes = [Int]()

while let input = readLine(), let n = Int(input) {
    nodes.append(n)
}
postorder(start: 0, end: nodes.count)

func postorder(start: Int, end: Int) {
    guard start < end else { return }
    
    let upperIndex = upperBounds(start: start, end: end, target: nodes[start])
    postorder(start: start+1, end: upperIndex)
    postorder(start: upperIndex, end: end)
    print(nodes[start])
}

func upperBounds(start: Int, end: Int, target: Int) -> Int {
    var start = start
    var end = end
    
    while start < end {
        let mid = (start + end) / 2
        
        if nodes[mid] <= target {
            start = mid + 1
        } else {
            end = mid
        }
    }
    return end
}
