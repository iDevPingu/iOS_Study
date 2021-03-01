//
//  main.swift
//  138 - Copy List with Random Pointer
//
//  Created by Ick on 2021/02/28.
//

import Foundation

public class Node {
    public var val: Int
    public var next: Node?
    public var random: Node?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
        self.random = nil
    }
}

class Solution {
    func copyRandomList(_ head: Node?) -> Node? {
        if head == nil {
            return nil
        }
        if head?.random == nil {
            return nil
        }
        let result = Node(head!.val)
        let random = Node(head!.random!.val)
        result.random = random
        
        result = copyRandomList(head?.next)
        
        return result
    }
}
let node7 = Node(7)
let node13 = Node(13)
let node11 = Node(11)
let node10 = Node(10)
let node1 = Node(1)

node7.next = node13
node13.next = node11
node13.random = node7

node11.next = node10
node11.random = node1

node10.next = node1
node10.random = node11

node1.random = node7

let a = Solution()
print(a.copyRandomList(node7))
