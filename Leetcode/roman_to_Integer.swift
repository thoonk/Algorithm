// 13. Roman to Integer / https://leetcode.com/problems/roman-to-integer/

import Foundation

func romanToInt(_ s: String) -> Int {
    var result = 0, prev = 0
    let dic: [Character: Int] = [
        "I": 1,
        "V": 5,
        "X": 10,
        "L": 50,
        "C": 100,
        "D": 500,
        "M": 1000
    ]
    
    for char in s {
        if let num = dic[char] {
            result += (num <= prev) ? prev : -prev
            prev = num
        }
    }
    result += prev
    return result
}

print(romanToInt("MCMXCIV")) // 1994
