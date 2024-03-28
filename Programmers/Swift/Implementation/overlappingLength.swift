// 겹치는 선분의 길이 120876

import Foundation

func solution(_ lines:[[Int]]) -> Int {
    let sets = lines.map { line -> Set<Int> in
        return Set(line.min()!..<line.max()!)
    }
    
    return sets[0].intersection(sets[1])
        .union(sets[0].intersection(sets[2]))
        .union(sets[1].intersection(sets[2]))
        .count
}

func solution2(_ lines:[[Int]]) -> Int {
    var result = 0
    var dp = [Int](repeating: 0, count: 200)
    
    for line in lines {
        for i in line[0]..<line[1] {
            dp[i+100] += 1
        }
    }
    
    return dp.filter({ $0 > 1}).count
}

let lines = [[0, 1], [2, 5], [3, 9]]
print(solution(lines) // 2
print(solution2(lines) // 2
