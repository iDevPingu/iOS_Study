//
//  main.swift
//  678 - Valid Parenthesis String
//
//  Created by Ick on 2020/08/29.
//  Copyright © 2020 ick. All rights reserved.
//

import Foundation

class Solution{
    func checkValidString(_ s: String) -> Bool{
        
        var leftWild: Int = 0
        for word in s{
            if word == ")" {
                if leftWild == 0 {
                    return false
                }
                leftWild -= 1
            } else{
                leftWild += 1
            }
        }
        
        var left: Int = 0
        for word in s{
            if word == "("{
                left += 1
            } else {
                left = max(0, left - 1)
            }
        }
        
        
        
        return left == 0
    }
}

let a = Solution()
print(a.checkValidString("()(*)*)"))
print(a.checkValidString("(())((())()()(*)(*()(())())())()()((()())((()))(*"))

var b = "ABC"
for (i,word) in b.enumerated(){
    print(i)
    print(word)
}
