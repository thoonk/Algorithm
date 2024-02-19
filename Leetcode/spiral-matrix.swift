// 54. Spiral Matrix
// https://leetcode.com/problems/spiral-matrix/

import Foundation

class Solution {
    func spiralOrder(_ matrix: [[Int]]) -> [Int] {
        var result = [Int]()
        var m = matrix.count, n = matrix[0].count
        var r = 0, c = -1
        var direction = 1
        
        while m > 0 && n > 0 {
            for _ in 0..<n {
                c += direction
                result.append(matrix[r][c])
            }

            m -= 1
            
            for _ in 0..<m {
                r += direction
                result.append(matrix[r][c])
            }

            n -= 1
            direction *= -1
        }

        return result
    }
}

print(Solution().spiralOrder([[1,2,3],[4,5,6],[7,8,9]])) // [1,2,3,6,9,8,7,4,5]
