//
//  main.swift
//  1991 - 트리 순회
//
//  Created by Ick on 2020/09/29.
//  Copyright © 2020 ick. All rights reserved.
//

import Foundation

class BinaryTreeNode {
    var value: String
    var leftChild: String?
    var rightChild: String?
    
    init(data: String){
        self.value = data
    }
}



func solution(){
    let n = Int(readLine()!)!
    var tree: [String: BinaryTreeNode] = [:]
    let root = "A"
    for _ in 0..<n{
        let line = readLine()!.split(separator: " ").map({String($0)})
        if line[0] == root{
            tree[line[0]] = BinaryTreeNode(data: line[0])
            if line[1] != "." {
                tree[line[0]]?.leftChild = line[1]
                tree[line[1]] = BinaryTreeNode(data: line[1])
            }
            if line[2] != "." {
                tree[line[0]]?.rightChild = line[2]
                tree[line[2]] = BinaryTreeNode(data: line[2])
            }
        } else {
            if line[1] != "." {
                tree[line[0]]?.leftChild = line[1]
                tree[line[1]] = BinaryTreeNode(data: line[1])
            }
            if line[2] != "." {
                tree[line[0]]?.rightChild = line[2]
                tree[line[2]] = BinaryTreeNode(data: line[2])
            }
        }
    }
    var result1 = ""
    var result2 = ""
    var result3 = ""
    
    func preorder(_ node :BinaryTreeNode) {
        result1 += node.value
        if node.leftChild != nil {
            preorder(tree[node.leftChild!]!)
        }
        if node.rightChild != nil {
            preorder(tree[node.rightChild!]!)
        }
    }
    func inorder(_ node: BinaryTreeNode){
        if node.leftChild != nil{
            inorder(tree[node.leftChild!]!)
        }
        result2 += node.value
        if node.rightChild != nil {
            inorder(tree[node.rightChild!]!)
        }
    }
    func postorder(_ node: BinaryTreeNode) {
        if node.leftChild != nil {
            postorder(tree[node.leftChild!]!)
        }
        if node.rightChild != nil {
            postorder(tree[node.rightChild!]!)
        }
        result3 += node.value
    }
    preorder(tree[root]!)
    inorder(tree[root]!)
    postorder(tree[root]!)
    print(result1)
    print(result2)
    print(result3)
}

solution()
