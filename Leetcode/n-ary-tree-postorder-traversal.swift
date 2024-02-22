// 590. N-ary Tree Postorder Traversal
// https://leetcode.com/problems/n-ary-tree-postorder-traversal/

import Foundation

/**
 * Definition for a Node.
 * public class Node {
 *     public var val: Int
 *     public var children: [Node]
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.children = []
 *     }
 * }
 */

class Solution {
    func postorder(_ root: Node?) -> [Int] {
        var result = [Int]()
        guard let root = root else { return result }
        traversal(root, &result)
        result.append(root.val)

        return result
    }

    func traversal(_ node: Node?, _ result: inout [Int]) {
        guard let node = node else { return }
        for child in node.children {
            traversal(child, &result)
            result.append(child.val)
        }
    }
}
