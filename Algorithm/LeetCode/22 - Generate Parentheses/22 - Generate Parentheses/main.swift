//
//  main.swift
//  22 - Generate Parentheses
//
//  Created by Ick on 2021/01/22.
//

import Foundation

class Solution {
    func generateParenthesis(_ n: Int) -> [String] {
        var result: [String] = []
        var stack: [String] = []
        
        func dfs(_ count: Int, _ max: Int) {
            if stack.count == n * 2 {
                result.append(stack.joined())
                let _ = stack.popLast()
                return
            }
            for i in 0..<2 {
                if i == 0 && max < n{
                    stack.append("(")
                    dfs(count + 1, max + 1)
                } else if i == 1 {
                    if count >= 1 {
                        stack.append(")")
                        dfs(count - 1, max)
                        let _ = stack.popLast()
                    } else {
                        let _ = stack.popLast()
                    }
                }
            }
        }
        
        stack.append("(")
        dfs(1, 1)
        
        return result
    }
}

let a = Solution()
print(a.generateParenthesis(3))
print(a.generateParenthesis(1))
