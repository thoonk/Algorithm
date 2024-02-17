// 1491. Average Salary Excluding the Minimum and Maximum Salary / https://leetcode.com/problems/average-salary-excluding-the-minimum-and-maximum-salary

import Foundation

func average(_ salary: [Int]) -> Double {
    return Double(salary.reduce(0, +) - salary.max()! - salary.min()!) / Double(salary.count - 2)
}

print(average([4000,3000,1000,2000])) // 2500.00000
