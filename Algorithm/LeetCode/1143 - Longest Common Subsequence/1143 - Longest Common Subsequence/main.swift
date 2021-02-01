//
//  main.swift
//  1143 - Longest Common Subsequence
//
//  Created by Ick on 2020/08/20.
//  Copyright © 2020 jaicoco. All rights reserved.
//

import Foundation

class Solution {
    func longestCommonSubsequence(_ text1: String, _ text2: String) -> Int {

        let longText = text1.count > text2.count ? Array(text1) : Array(text2)
        let shortText = text1.count > text2.count ? Array(text2) : Array(text1)
        var resultArray = [String]()
        
        for startIndex in 0..<shortText.count{
            var temp = ""
            var tempNow = startIndex
            for longIndex in 0..<longText.count{
                if tempNow >= shortText.count{
                    break
                }
                if longText[longIndex] == shortText[tempNow]{
                    temp += String(longText[longIndex])
                    tempNow += 1
                }
                
            }
            resultArray.append(temp)
        }
        
        resultArray.sort { (s1, s2) -> Bool in
            s1.count > s2.count
        }
        
        print(resultArray)
        
        return resultArray[0].count
        
    }
}

var a = Solution()
print(a.longestCommonSubsequence("ezupkr", "ubmrapg"))


