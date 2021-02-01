//
//  main.swift
//  20 - Valid Parentheses
//
//  Created by Ick on 2021/01/22.
//

import Foundation

class Solution {
    func isValid(_ s: String) -> Bool {
        
        if s.count % 2 == 1 {
            return false
        }
        
        var stack: [Character] = []
        
        for char in s {
            switch char {
            case "(":
                stack.append(char)
            case "{":
                stack.append(char)
            case "[":
                stack.append(char)
            case ")":
                if stack.popLast() == "(" {
                    continue
                } else {
                    return false
                }
            case "}":
                if stack.popLast() == "{" {
                    continue
                } else {
                    return false
                }
            case "]":
                if stack.popLast() == "[" {
                    continue
                } else {
                    return false
                }
            default:
                return false
            }
        }
        if stack.isEmpty {
            return true
        } else {
            return false
        }
    }
}

let a = Solution()
print(a.isValid("()"))
print(a.isValid("()[]{}"))
print(a.isValid("(]"))
print(a.isValid("([)]"))
print(a.isValid("{[]}"))
print(a.isValid("(){}}{"))
