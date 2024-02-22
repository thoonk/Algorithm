// 783. Minimum Distance Between BST Nodes
// https://leetcode.com/problems/minimum-distance-between-bst-nodes/

import Foundation

/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init() { self.val = 0; self.left = nil; self.right = nil; }
 *     public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
 *     public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
 *         self.val = val
 *         self.left = left
 *         self.right = right
 *     }
 * }
 */
class Solution {
    func minDiffInBST(_ root: TreeNode?) -> Int {
        var result = Int.max
        var prev: TreeNode? = nil

        func traversal(_ node: TreeNode?) {
            guard let node = node else { return }
            traversal(node.left)
            
            if let prev = prev {
                result = min(result, node.val - prev.val)
            }

            prev = node
            traversal(node.right)
        }

        traversal(root)

        return result
    }
}

print(Solution().minDiffInBST(4)) // 1
