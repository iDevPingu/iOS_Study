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
        
        func checkNode(_ nowNode: TreeNode?) -> Bool {
            var result: Bool = false
            guard let nowVal = nowNode?.val else { return true }
            
            if nowNode?.left == nil && nowNode?.right == nil {
                return true
            }
            
            guard let leftVal = nowNode?.left?.val else {
                guard let rightVal = nowNode?.right?.val else {
                    return true
                }
                if nowVal >= rightVal {
                    return false
                } else {
                    return true
                }
            }
            
            if nowVal <= leftVal {
                return false
            }
            
            guard let rightVal = nowNode?.right?.val else {
                guard let leftVal = nowNode?.left?.val else {
                    return true
                }
                if nowVal <= leftVal {
                    return false
                } else {
                    return true
                }
            }
            
            if nowVal >= rightVal {
                return false
            }
            
            result = checkNode(nowNode?.left) && checkNode(nowNode?.right)
            
            return result
        }
        
        let result = checkNode(root)
        
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
