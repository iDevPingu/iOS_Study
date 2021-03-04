//
//  main.swift
//  199 - Binary Tree Right Side View
//
//  Created by Ick on 2021/03/05.
//

import Foundation

public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    
    public init() {
        self.val = 0
    }
    public init(_ val: Int) {
        self.val = val
    }
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}

// Queue로 푸는 것 고민해보기!
class Solution {
    func rightSideView(_ root: TreeNode?) -> [Int] {
        if root == nil {
            return []
        }
        var result: [[Int]] = []
        
        func makeLevelValueArray(_ root: TreeNode?, _ level: Int) {
            if root == nil {
                return
            }
            if result.count == level {
                result.append([root!.val])
            } else if result.count > level {
                result[level].append(root!.val)
            }
            makeLevelValueArray(root?.left, level + 1)
            makeLevelValueArray(root?.right, level + 1)
        }
        makeLevelValueArray(root, 0)
        var output: [Int] = []
        for i in 0..<result.count {
            output.append(result[i].removeLast())
        }
        return output
    }
}


