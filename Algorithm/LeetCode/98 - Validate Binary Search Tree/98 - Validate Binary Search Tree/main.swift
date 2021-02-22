//
//  main.swift
//  98 - Validate Binary Search Tree
//
//  Created by Ick on 2021/02/10.
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
    func isValidBST(_ root: TreeNode?) -> Bool {
        var result: Bool = true
        
        func checkNode(_ root: TreeNode?) {
            if root == nil {
                return
            }
            if let left = root?.left {
                if left.val > root!.val {
                    result = false
                    return
                }
            }
            checkNode(root?.left)
            if let right = root?.right {
                if right.val < root!.val {
                    result = false
                    return
                }
            }
            checkNode(root?.right)
            
        }
        
        checkNode(root)
        
        return result
    }
}

//let treeNode1 = TreeNode.init(1)
//let treeNode3 = TreeNode.init(3)
//let treeNode6 = TreeNode.init(6)
//let treeNode4 = TreeNode.init(4, treeNode3, treeNode6)
//let treeNode5 = TreeNode.init(5, treeNode1, treeNode4)
let treeNode7 = TreeNode.init(7)
let treeNode3 = TreeNode.init(3)
let treeNode6 = TreeNode.init(6, treeNode3, treeNode7)
let treeNode4 = TreeNode.init(4)
let treeNode5 = TreeNode.init(5, treeNode4, treeNode6)

let a = Solution()
print(a.isValidBST(treeNode5))

//
//let treeNode11 = TreeNode.init(1, nil, treeNode1)
//print(a.isValidBST(treeNode11))
