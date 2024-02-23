// 412. Fizz Buzz
// https://leetcode.com/problems/fizz-buzz/

import Foundation

class Solution {
    func fizzBuzz(_ n: Int) -> [String] {
        var result = [String]()

        for i in 1...n {
            if i.isMultiple(of: 3) && i.isMultiple(of: 5) { result.append("FizzBuzz") }
            else if i.isMultiple(of: 3) { result.append("Fizz") }
            else if i.isMultiple(of: 5) { result.append("Buzz") }
            else { result.append(String(i)) }
        }

        return result
    }
}

print(Solution().fizzBuzz(3)) // ["1","2","Fizz"]

