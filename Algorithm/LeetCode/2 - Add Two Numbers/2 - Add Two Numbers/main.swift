//
//  main.swift
//  2 - Add Two Numbers
//
//  Created by Ick on 2021/01/09.
//

import Foundation

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() {
        self.val = 0
        self.next = nil
    }
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
    public init(_ val: Int, _ next: ListNode?) {
        self.val = val
        self.next = next
    }
}

func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
    
    var l1 = l1
    var l2 = l2
    var prev = ListNode(0)
    var carry = 0
    let head = prev
    
    while (l1 != nil || l2 != nil || carry != 0) {
        let cur = ListNode(0)
        var l1val = 0
        var l2val = 0
        
        if l1 == nil {
            l1val = 0
        } else {
            l1val = l1!.val
        }
        
        if l2 == nil {
            l2val = 0
        } else {
            l2val = l2!.val
        }
        
        let sum = l1val + l2val + carry
        cur.val = sum % 10
        carry = sum / 10
        prev.next = cur
        prev = cur
        
        if l1 == nil {
            l1 = nil
        } else {
            l1 = l1!.next
        }
        
        if l2 == nil {
            l2 = nil
        } else {
            l2 = l2!.next
        }
    }
    
    return head.next
}
//let l7 = ListNode(4)
//let l6 = ListNode(6, l7)
//let l5 = ListNode(5, l6)
//
//let l4 = ListNode(9)
//let l3 = ListNode(4, l4)
//let l2 = ListNode(6, l3)
//let l1 = ListNode(5, l2)
let l11 = ListNode(9)
let l10 = ListNode(9, l11)
let l9 = ListNode(9, l10)
let l8 = ListNode(9, l9)

let l7 = ListNode(9)
let l6 = ListNode(9, l7)
let l5 = ListNode(9, l6)
let l4 = ListNode(9, l5)
let l3 = ListNode(9, l4)
let l2 = ListNode(9, l3)
let l1 = ListNode(9, l2)

print(addTwoNumbers(l1, l8))
