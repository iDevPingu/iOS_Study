//
//  main.swift
//  343 - Integer Break
//
//  Created by Ick on 2020/08/08.
//  Copyright © 2020 jaicoco. All rights reserved.
//

import Foundation

class Solution{
    func integerBreak(_ n: Int) -> Int {
        
        if n == 2 {
            return 1
        } else if n == 3 {
            return 2
        } else {
            let temp: Int = n - 1
            let threeCount: Int = ((temp / 3) - 1) + temp % 3
            let twoCount: Int = (n - 3 * threeCount) / 2
            var result: Int = 1
            for _ in 0..<threeCount {
                result *= 3
            }
            
            for _ in 0..<twoCount{
                result *= 2
            }
            return result
        }
    }
}

let a = Solution()
print(a.integerBreak(10))
//            let result = Int(truncating: NSDecimalNumber(decimal: pow(3,threeCount) * pow(2,twoCount)))
