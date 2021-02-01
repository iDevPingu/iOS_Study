//
//  main.swift
//  Group Anagrams
//
//  Created by Ick on 2020/08/06.
//  Copyright © 2020 jaicoco. All rights reserved.
//

import Foundation


class Solution{
    func groupAnagrams(_ strs: [String]) -> [[String]]{

        var dict = [String : Array<String>]()
        
        for str in strs{
            
//            let temp = str.map{ String($0) }
            let temp = String(str.sorted())
            if dict.keys.contains(temp){
                dict[temp]?.append(str)
            } else {
                dict[temp] = [str]
            }
        }
        
        return Array(dict.values)
    }
}

let a = Solution()
print(a.groupAnagrams(["eat", "tea", "tan", "ate", "nat", "bat"]))
var b = "abda"
var c = String(b.sorted())
print(c)
