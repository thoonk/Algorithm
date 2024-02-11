// 1822. Sign of the Product of an Array / https://leetcode.com/problems/sign-of-the-product-of-an-array/

import Foundation

func arraySign(_ nums: [Int]) -> Int {
    guard nums.contains(0) == false else { return 0 }
    return nums.filter { $0 < 0 }.count % 2 == 0 ? 1 : -1
}

print(arraySign([-1,-2,-3,-4,3,2,1])) // 1
