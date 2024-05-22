// 222. Count Complete Tree Nodes
// https://leetcode.com/problems/count-complete-tree-nodes/

import Foundation

class Solution {
    func countNodes(_ root: TreeNode?) -> Int {
        guard let root = root else { return 0 }
        
        var leftDepth = 0
        var rightDepth = 0
        var leftNode = root
        var rightNode = root
        
        while let left = leftNode.left {
            leftDepth += 1
            leftNode = left
        }
        
        while let right = rightNode.right {
            rightDepth += 1
            rightNode = right
        }
        
        if leftDepth == rightDepth {
            return (1 << (leftDepth + 1)) - 1
        } else {
            return 1 + countNodes(root.left) + countNodes(root.right)
        }
    }
}
