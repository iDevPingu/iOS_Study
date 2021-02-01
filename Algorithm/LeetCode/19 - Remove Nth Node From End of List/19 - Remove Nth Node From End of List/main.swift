//
//  main.swift
//  19 - Remove Nth Node From End of List
//
//  Created by Ick on 2021/01/20.
//

import Foundation

public class ListNode {
      public var val: Int
      public var next: ListNode?
      public init() { self.val = 0; self.next = nil; }
      public init(_ val: Int) { self.val = val; self.next = nil; }
      public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}
 
class Solution {
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        var nodeList: [ListNode?] = [head]
        var nextNode = head
        
        
        while nextNode?.next != nil {
            nodeList.append(nextNode?.next)
            nextNode = nextNode?.next
        }

        if nodeList.count == 1 {
            nextNode = nil
            return nextNode
        }
        
        // 없애야 할 노드의 인덱스
        let index = nodeList.count - n
        
        if index == 0 {
            return nodeList[1]
        } else if index == nodeList.count - 1 {
            nodeList[index - 1]?.next = nil
            return nodeList[0]
        } else {
            nodeList[index - 1]?.next = nodeList[index + 1]
            return nodeList[0]
        }
    }
}

let l5 = ListNode(5)
let l4 = ListNode(4, l5)
let l3 = ListNode(3, l4)
let l2 = ListNode(2, l3)
let l1 = ListNode(1, l2)

let a = Solution()
// 3
print(a.removeNthFromEnd(l1, 2)?.next?.next?.next?.val)
// 5
//print(a.removeNthFromEnd(l1, 2)?.next?.next?.next?.val)
