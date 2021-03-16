//
//  main.swift
//  437 - Path Sum III
//
//  Created by Ick on 2021/03/15.
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
    func pathSum(_ root: TreeNode?, _ sum: Int) -> Int {
        guard let root = root else {
            return 0
        }
        
        return findPath(root, sum) + pathSum(root.left, sum) + pathSum(root.right, sum)
    }
    
    func findPath(_ root: TreeNode?, _ sum: Int) -> Int {
        guard let root = root else {
            return 0
        }
        var result = 0
        if sum == root.val {
            result += 1
        }
        result += findPath(root.left, sum - root.val)
        result += findPath(root.right, sum - root.val)
        
        return result
    }
}

let treeNode11 = TreeNode(11)
let treeNode3m = TreeNode(-3, nil, treeNode11)
let treeNode2m = TreeNode(-2)
let treeNode1 = TreeNode(1)
let treeNode2 = TreeNode(2, nil, treeNode1)
let treeNode3b = TreeNode(3)
let treeNode3a = TreeNode(3, treeNode3b, treeNode2m)
let treeNode5 = TreeNode(5, treeNode3a, treeNode2)
let treeNode10 = TreeNode(10, treeNode5, treeNode3m)

let a = Solution()
print(a.pathSum(treeNode10, 8))
