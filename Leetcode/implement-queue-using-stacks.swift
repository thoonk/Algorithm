// 232. Implement Queue using Stacks
// https://leetcode.com/problems/implement-queue-using-stacks/

import Foundation

class MyQueue {
    
    private var array: [Int]
    
    init(array: [Int] = [Int]()) {
        self.array = array
    }
    
    func push(_ x: Int) {
        array.append(x)
    }
    
    func pop() -> Int {
        return array.removeFirst()
    }
    
    func peek() -> Int {
        return array[0]
    }
    
    func empty() -> Bool {
        return array.isEmpty
    }
}

/**
 * Your MyQueue object will be instantiated and called as such:
 * let obj = MyQueue()
 * obj.push(x)
 * let ret_2: Int = obj.pop()
 * let ret_3: Int = obj.peek()
 * let ret_4: Bool = obj.empty()
 */
