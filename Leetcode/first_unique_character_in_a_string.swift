// 387. First Unique Character in a String / https://leetcode.com/problems/first-unique-character-in-a-string/

import Foundation

func firstUniqChar(_ s: String) -> Int {
    let dict = s.reduce(into: [:]) { $0[$1, default: 0] += 1 }

    for (i, char) in s.enumerated() {
        if dict[char] == 1 {
            return i
        }
    }
    return -1
}

print(firstUniqChar("loveleetcode")) // 2
