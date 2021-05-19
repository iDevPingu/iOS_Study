//
//  main.swift
//  101 - Symmetric Tree
//
//  Created by Ick on 2021/05/19.
//

import Foundation

public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init() { self.val = 0; self.left = nil; self.right = nil; }
    public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}
class Solution {
    func isSymmetric(_ root: TreeNode?) -> Bool {
        
        func isSymmetrics(_ left: TreeNode?, _ right: TreeNode?) -> Bool {
            if left == nil && right == nil { return true }
            if left == nil || right == nil { return false }
            if left?.val != right?.val { return false }
            
            return isSymmetrics(left?.left, right?.right) && isSymmetrics(left?.right, right?.left)
        }
        
        return isSymmetrics(root, root)
    }
}

let a = Solution()

let treeNode33 = TreeNode(3)
let treeNode3 = TreeNode(3)
let treeNode22 = TreeNode(2, nil, treeNode33)
let treeNode2 = TreeNode(2, treeNode3, nil)
let treeNode1 = TreeNode(1, treeNode2, treeNode22)


print(a.isSymmetric(treeNode1))
