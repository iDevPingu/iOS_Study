//
//  main.swift
//  17 - Letter Combination of a Phone Number
//
//  Created by Ick on 2021/01/20.
//

import Foundation

class Solution {
    func letterCombinations(_ digits: String) -> [String] {
        let inputArray = digits.map({Int(String($0))!})
        
        let button: [Int: [String]] = [
            2: ["a","b","c"],
            3: ["d","e","f"],
            4: ["g","h","i"],
            5: ["j","k","l"],
            6: ["m","n","o"],
            7: ["p","q","r","s"],
            8: ["t","u","v"],
            9: ["w","x","y","z"]
        ]
        var result: [String] = []
        
        func dfs(_ temp: String, _ index: Int) {
            if index == inputArray.count {
                result.append(temp)
                return
            }
            
            for i in 0..<button[inputArray[index]]!.count {
                let next = temp + button[inputArray[index]]![i]
                dfs(next, index+1)
            }
        }
        
        if inputArray.count == 0 {
            return result
        } else if inputArray.count == 1 {
            result = button[inputArray[0]]!
            return result
        } else {
            for i in 0..<button[inputArray[0]]!.count {
                let temp: String = button[inputArray[0]]![i]
                dfs(temp,1)
            }
            return result
        }
    }
    
}

let a = Solution()
//print(a.letterCombinations("23"))
print(a.letterCombinations("345"))
