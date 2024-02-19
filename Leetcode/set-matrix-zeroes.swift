// 73. Set Matrix Zeroes
// https://leetcode.com/problems/set-matrix-zeroes/

import Foundation

class Solution {
    func setZeroes(_ matrix: inout [[Int]]) {
        var rows = Set<Int>()
        var cols = Set<Int>()

        for r in matrix.indices {
            for c in matrix[0].indices {
                if matrix[r][c] == 0 {
                    rows.insert(r)
                    cols.insert(c)
                }
            }
        }

        for r in rows {
            for c in matrix[r].indices {
                matrix[r][c] = 0
            }
        }

        for c in cols {
            for r in matrix.indices {
                matrix[r][c] = 0
            }
        }
    }
}

print(Solution().setZeroes(&[[0,1,2,0],[3,4,5,2],[1,3,1,5]]))) // [[0,0,0,0],[0,4,5,0],[0,3,1,0]]
