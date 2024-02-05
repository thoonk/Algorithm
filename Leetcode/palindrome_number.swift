// 9.Palindrome Number / https://leetcode.com/problems/palindrome-number/

import Foundation

func isPalindrome(_ x: Int) -> Bool {
    let arr = Array(String(x))

    for i in 0..<arr.count {
        let mid = arr.count / 2
        
        for i in 0..<mid {
            if arr[i] != arr[arr.count - 1 - i] {
                return false
            }
        }
    }

    return true
}

print(isPalindrome(121)) // true
