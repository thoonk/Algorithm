//
//  main.swift
//  BOJ_PS
//
//  Created by 김태훈 on 2020/11/28.
//  Q15686 치킨 배달 (DFS)

typealias Coord = (r: Int, c: Int)

let nm = readLine()!.split(separator: " ").map { Int(String($0))! }
let n = nm[0]
let m = nm[1]
var city = [[Int]]()
var home = [Coord]()
var chicken = [Coord]()
var selected = [Bool](repeating: false, count: chicken.count)
var result = Int.max

func computeDist(_ s1: Coord, _ s2: Coord) -> Int {
    abs(s1.0 - s2.0) + abs(s1.1 - s2.1)
}

func solution(_ index: Int, _ selectedCnt: Int) {
    if selectedCnt == m {
        var tempSum = 0
        for i in 0 ..< home.count {
            var minVal = Int.max
            for j in 0 ..< chicken.count {
                if selected[j] == true {
                    minVal = min(minVal, computeDist(home[i], chicken[j]))
                }
            }
            tempSum += minVal
        }
        result = min(result, tempSum)
        return
    }
    
    if index == chicken.count {
        return
    }
    
    selected[index] = true
    solution(index + 1, selectedCnt + 1)
    selected[index] = false
    solution(index + 1, selectedCnt)
}

for i in 0 ..< n {
    city.append(readLine()!.split(separator: " ").map { Int(String($0))! })
}

for r in 0 ..< n {
    for c in 0 ..< n {
        if city[r][c] == 1 {
            home.append((r+1, c+1))
        } else if city[r][c] == 2 {
            chicken.append((r+1, c+1))
        }
    }
}

solution(0, 0)
print(result)
