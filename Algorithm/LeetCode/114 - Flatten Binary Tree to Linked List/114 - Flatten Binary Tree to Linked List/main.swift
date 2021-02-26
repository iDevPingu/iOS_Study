//
//  main.swift
//  114 - Flatten Binary Tree to Linked List
//
//  Created by Ick on 2021/02/25.
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
    func flatten(_ root: TreeNode?) {
        var preorder: [TreeNode?] = []
        
        func makePreorder(_ root: TreeNode?) {
            if root == nil {
                return
            }
            
            preorder.append(root)
            
            makePreorder(root?.left)
            makePreorder(root?.right)
        }
        
        makePreorder(root)
        
        if preorder.count < 2 {
            return
        }
        
        func makeTree(_ root: TreeNode?, _ index: Int) {
            if index == preorder.count {
                return
            }
            root?.left = nil
            root?.right = preorder[index]
            
            makeTree(root?.right, index + 1)
        }
        
        makeTree(root, 0)
    }
}
let a = Solution()
//let treeNode3 = TreeNode(3)
//let treeNode4 = TreeNode(4)
//let treeNode6 = TreeNode(6)
//let treeNode2 = TreeNode(2, treeNode3, treeNode4)
//let treeNode5 = TreeNode(5, nil, treeNode6)
//let treeNode1 = TreeNode(1, treeNode2, treeNode5)
let treeNode0 = TreeNode(0)
a.flatten(treeNode0)
