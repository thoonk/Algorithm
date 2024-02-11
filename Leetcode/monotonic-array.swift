// 896. Monotonic Array / https://leetcode.com/problems/monotonic-array/

import Foundation

func isMonotonic(_ nums: [Int]) -> Bool {
    var isAsc = true
    var isDesc = true
    
    for i in 1..<nums.count {
        isAsc = isAsc && nums[i] >= nums[i-1]
        isDesc = isDesc && nums[i] <= nums[i-1]
    }
    
    return isAsc || isDesc
}

func isMonotonic2(_ nums: [Int]) -> Bool {
    return nums == nums.sorted(by: <) || nums == nums.sorted(by: >)
}

print(isMonotonic([1,2,2,3])) // true
print(isMonotonic2([1,2,2,3])) // true
