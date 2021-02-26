//
//  main.swift
//  102 - Binary Tree Level Order Traversal
//
//  Created by Ick on 2021/02/17.
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
    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        var result: [[Int]] = []
        if root == nil {
            return []
        }
        func checkLevel(level: Int, node: TreeNode?) {
            if node == nil {
                return
            }
            guard let val = node?.val else { return }
            
            // 현재 레벨에 해당하는 배열이 아직 없다면 지금 노드가
            // 해당 레벨의 가장 왼쪽 노드이므로 새로운 배열 행성
            if level == result.count {
                result.append([val])
                // 현재 레벨에 해당하는 배열이 있다면 거기에 바로 추가
            } else {
                result[level].append(val)
            }
            // 왼쪽, 오른쪽을 나눠서 재귀함수 수행
            checkLevel(level: level + 1, node: node?.left)
            checkLevel(level: level + 1, node: node?.right)
        }
        checkLevel(level: 0, node: root)
        
        return result
    }
}

let treeNode15 = TreeNode(15)
let treeNode7 = TreeNode(7)
let treeNode9 = TreeNode(9)
let treeNode20 = TreeNode(20, treeNode15, treeNode7)
let treeNode3 = TreeNode(3, treeNode9, treeNode20)

let a = Solution()
print(a.levelOrder(treeNode3))
