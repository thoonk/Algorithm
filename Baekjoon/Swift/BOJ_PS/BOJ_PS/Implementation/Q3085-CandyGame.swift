//
//  Q3085-CandyGame.swift
//  BOJ_PS
//
//  Created by thoonk on 2022/07/23.
//

func countEdible(candies: [[String]], n: Int) -> Int {
    var maxCount = 1
    
    for i in 0..<n {
        var count = 1
        for j in 1..<n {
            if candies[i][j-1] == candies[i][j] {
                count += 1
            } else {
                count = 1
            }
            
            if count > maxCount {
                maxCount = count
            }
        }
        
        count = 1
        for j in 1..<n {
            if candies[j-1][i] == candies[j][i] {
                count += 1
            } else {
                count = 1
            }
            
            if count > maxCount {
                maxCount = count
            }
        }
    }
    
    return maxCount
}

let n = Int(readLine()!)!
var candies = [[String]]()
var result = 0

for _ in 0..<n {
    let candy = Array(readLine()!.map { String($0) })
    candies.append(candy)
}

for i in 0..<n {
    for j in 0..<n {
        if j+1 < n {
            candies[i].swapAt(j, j+1)
            
            let maxCount = countEdible(candies: candies, n: n)
            if maxCount > result {
                result = maxCount
            }
            
            candies[i].swapAt(j, j+1)
        }
        
        if i+1 < n {
            var temp = candies[i][j]
            candies[i][j] = candies[i+1][j]
            candies[i+1][j] = temp
            
            let maxCount = countEdible(candies: candies, n: n)
            if maxCount > result {
                result = maxCount
            }
            
            temp = candies[i+1][j]
            candies[i+1][j] = candies[i][j]
            candies[i][j] = temp
        }
    }
}

print(result)


