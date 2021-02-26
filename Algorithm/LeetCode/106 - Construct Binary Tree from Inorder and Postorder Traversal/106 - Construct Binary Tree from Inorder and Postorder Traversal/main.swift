//
//  main.swift
//  106 - Construct Binary Tree from Inorder and Postorder Traversal
//
//  Created by Ick on 2021/02/24.
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
    func buildTree(_ inorder: [Int], _ postorder: [Int]) -> TreeNode? {
        
        var postorderIndex: Int = postorder.count - 1
        
        func makeTree(_ nowRoot: TreeNode?, _ inorder: [Int]) -> TreeNode? {
            if postorderIndex < 0 {
                return nil
            }
            if inorder.isEmpty {
                return nil
            }
            
            nowRoot?.val = postorder[postorderIndex]
            
            var inorderIndex: Int = 0
            
            for i in 0..<inorder.count {
                if inorder[i] == postorder[postorderIndex] {
                    inorderIndex = i
                    break
                }
            }
            
            postorderIndex -= 1
        
            nowRoot?.right = makeTree(TreeNode(), Array(inorder[inorderIndex+1..<inorder.count]))
            nowRoot?.left = makeTree(TreeNode(), Array(inorder[0..<inorderIndex]))
            
            return nowRoot
        }
        
        return makeTree(TreeNode(), inorder)
    }
}
