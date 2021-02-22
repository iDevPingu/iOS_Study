//
//  main.swift
//  94 - Binary Tree Inorder Traversl
//
//  Created by Ick on 2021/02/08.
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
    func inorderTraversal(_ root: TreeNode?) -> [Int] {
        if root == nil {
            return []
        }
        
        let leftTree = inorderTraversal(root?.left)
        let rootNode = [root!.val]
        let rightTree = inorderTraversal(root?.right)
        
        return leftTree + rootNode + rightTree
    }
}

let a = Solution()
let treeNode6 = TreeNode.init(6)
let treeNode5 = TreeNode.init(5)
let treeNode4 = TreeNode.init(4)
let treeNode3 = TreeNode.init(3, nil, treeNode6)
let treeNode2 = TreeNode.init(2, treeNode4, treeNode5)
let treeNode1 = TreeNode.init(1, treeNode2, treeNode3)
print(a.inorderTraversal(treeNode1))
