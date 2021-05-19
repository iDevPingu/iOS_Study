//
//  main.swift
//  21 - Merge Two Sorted Lists
//
//  Created by Ick on 2021/05/19.
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
    func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var l1 = l1
        var l2 = l2
        
        var nodeList: [ListNode] = []
        while l1 != nil || l2 != nil {
            if l1 == nil && l2 != nil {
                nodeList.append(l2!)
                l2 = l2?.next
                continue
            }
            if l1 != nil && l2 == nil{
                nodeList.append(l1!)
                l1 = l1?.next
                continue
            }
            if let nowL1 = l1, let nowL2 = l2 {
                if nowL1.val <= nowL2.val {
                    nodeList.append(nowL1)
                    l1 = l1?.next
                } else {
                    nodeList.append(nowL2)
                    l2 = l2?.next
                }
            }
        }
        
        if nodeList.isEmpty {
            return nil
        } else {
            for i in 0..<nodeList.count-1 {
                nodeList[i].next = nodeList[i+1]
            }
            return nodeList[0]
        }
    }
}

let a = Solution()
print(a.mergeTwoLists(nil, nil))
