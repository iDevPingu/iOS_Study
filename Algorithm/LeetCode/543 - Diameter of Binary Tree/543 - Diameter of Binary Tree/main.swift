//
//  main.swift
//  543 - Diameter of Binary Tree
//
//  Created by pingu on 2021/11/03.
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
    func diameterOfBinaryTree(_ root: TreeNode?) -> Int {
        var currentLeftNode = root?.left
        var currentRightNode = root?.right

        var mostLeft: Int = 0
        var mostRight: Int = 0
        
        while currentLeftNode != nil {
            mostLeft += 1
            currentLeftNode = currentLeftNode?.left
        }
        
        while currentRightNode != nil {
            mostRight += 1
            currentRightNode = currentRightNode?.right
        }
        
        return mostLeft + mostRight
    }
}
