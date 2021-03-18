//
//  main.swift
//  230 - Kth Smallest Element in a BST
//
//  Created by Ick on 2021/03/17.
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
    func kthSmallest(_ root: TreeNode?, _ k: Int) -> Int {
        var values: [Int] = []
        
        func makeInorder(_ root: TreeNode?, _ count: Int) -> [Int] {
            if root == nil {
                return []
            }
            if count == k {
                return []
            }
            let left: [Int] = makeInorder(root?.left, count + 1)
            let mid: [Int] = [root!.val]
            let right: [Int] = makeInorder(root?.right, count + 1)
            
            return left + mid + right
        }
        values = makeInorder(root, 0)
        print(values)
        return values[k-1]
    }
}
