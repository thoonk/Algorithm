// 1572. Matrix Diagonal Sum / https://leetcode.com/problems/matrix-diagonal-sum/

import Foundation

func diagonalSum(_ mat: [[Int]]) -> Int {
    var result = 0
    var i = 0
    let count = mat.count

    while i < count {
        result += mat[i][i]
        result += mat[i][count - 1 - i]

        i += 1
    }

    if count % 2 == 1 {
        result -= mat[count / 2][count / 2]
    }

    return result
}

print(diagonalSum([[1,2,3],[4,5,6],[7,8,9]])) // 25
