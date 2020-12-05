//
//  main.swift
//  BOJ_PS
//
//  Created by 김태훈 on 2020/11/28.
//  Q15686 치킨 배달 (DFS)

import Foundation

func solution() {
    
    let nm = readLine()!.split(separator: " ").map {Int(String($0))!}
    let n = nm[0]
    let m = nm[1]
    var city = Array(repeating: Array(repeating: 0, count: n), count: n)
    var home = [(Int, Int)]()
    var chicken = [(Int, Int)]()
    var result = Int.max
    
    for i in 0 ..< n {
        city[i] = readLine()!.split(separator: " ").map {Int(String($0))!}
    }
    
    for i in 0 ..< n {
        for j in 0 ..< n {
            if city[i][j] == 1 {
                home.append((i+1,j+1))
            } else if city[i][j] == 2 {
                chicken.append((i+1,j+1))
            }
        }
    }
    var selected = [Bool](repeating: false, count: chicken.count)

    func computeDistance(idx: Int, selectCnt: Int){
        if selectCnt == m {
            var temp = 0
            for i in 0 ..< home.count {
                var minValue = Int.max
                for j in 0 ..< chicken.count {
                    if selected[j] == true {
                        minValue = min(minValue, abs(home[i].0 - chicken[j].0) + abs(home[i].1 - chicken[j].1))
                    }
                }
                temp += minValue
            }
            result = min(result, temp)
            return
        }
        if idx == chicken.count {
            return
        }

        selected[idx] = true
        computeDistance(idx: idx+1, selectCnt: selectCnt+1)
        selected[idx] = false
        computeDistance(idx: idx+1, selectCnt: selectCnt)
    }
    computeDistance(idx: 0, selectCnt: 0)
    print(result)
}
solution()


