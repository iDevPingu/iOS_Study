//
//  main.swift
//  121 - Best Time to Buy and Sell Stock
//
//  Created by Ick on 2021/02/25.
//

import Foundation

class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        var buy: Int = 0
        var result: Int = 0
        
        for cell in 0..<prices.count {
            if 0 > prices[cell] - prices[buy] {
                buy = cell
            } else {
                result = max(result, prices[cell] - prices[buy])
            }
        }
        
        return result
    }
}

let a = Solution()
print(a.maxProfit([7,1,5,3,6,4]))
print(a.maxProfit([7,6,4,3,1]))
print(a.maxProfit([1,8,6,5,2,15]))
