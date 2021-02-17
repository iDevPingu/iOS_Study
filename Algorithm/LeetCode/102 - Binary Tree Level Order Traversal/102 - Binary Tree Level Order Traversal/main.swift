//
//  main.swift
//  102 - Binary Tree Level Order Traversal
//
//  Created by Ick on 2021/02/17.
//

import Foundation

public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init() {
        self.val = 0
        self.left = nil
        self.right = nil
    }
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}

class Solution {
    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        var result: [[Int]] = []
        if root == nil {
            return []
        }
        func checkLevel(level: Int, node: TreeNode?) {
            if node == nil {
                return
            }
            guard let val = node?.val else { return }
            if level == result.count {
                result.append([val])
            } else {
                result[level].append(val)
            }
            checkLevel(level: level + 1, node: node?.left)
            checkLevel(level: level + 1, node: node?.right)
        }
        checkLevel(level: 0, node: root)
        
        return result
    }
}

let treeNode15 = TreeNode(15)
let treeNode7 = TreeNode(7)
let treeNode9 = TreeNode(9)
let treeNode20 = TreeNode(20, treeNode15, treeNode7)
let treeNode3 = TreeNode(3, treeNode9, treeNode20)

let a = Solution()
print(a.levelOrder(treeNode3))
