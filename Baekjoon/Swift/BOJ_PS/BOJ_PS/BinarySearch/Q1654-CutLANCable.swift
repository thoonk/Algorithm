//
//  Q1654-CutLANCable.swift
//  BOJ_PS
//
//  Created by thoonk on 2022/01/19.
//

let kn = readLine()!.split(separator: " ").map { Int(String($0))! }
let k = kn[0]
let n = kn[1]

var cables = [Int]()

for _ in 0..<k {
    cables.append(Int(readLine()!)!)
}

func solution() -> Int {
    var start = 1
    var end = cables.max()!

    while start <= end {
        let mid = (start + end) / 2
        var numOfCables = 0
        
        for cable in cables {
            numOfCables += cable / mid
        }
        
        if numOfCables >= n {
            start = mid + 1
        } else {
            end = mid - 1
        }
    }
    return end
}

print(solution())
