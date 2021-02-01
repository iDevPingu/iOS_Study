//
//  main.swift
//  1081 - Smallest Subsequence of Distinct
//
//  Created by Ick on 2020/08/14.
//  Copyright © 2020 jaicoco. All rights reserved.
//

import Foundation
//
//class Solution {
//    func smallestSubsequence(_ text: String) -> String {
//        var stringCount = [UInt8: Int]()
//
//        var tempString = ""
//        var result: String = ""
//        for index in 0..<text.count{
//            guard let ascii = text[text.index(text.startIndex, offsetBy: index)].asciiValue else { return "" }
//            if stringCount.keys.contains(ascii) {
//                if let temp = stringCount[ascii] {
//                    stringCount[ascii] = temp + 1
//                }
//            } else {
//                stringCount[ascii] = 1
//            }
//        }
//
////        var insertLast: Int = 0
//        var tempStringCount = [UInt8: Int]()
//        for index in 0..<text.count{
//            let now = text[text.index(text.startIndex, offsetBy: index)]
//            guard let nowAscii = now.asciiValue else { fatalError() }
//            if stringCount.keys.contains(nowAscii){
//                if nowAscii == stringCount.keys.min(){
//                    stringCount[nowAscii] = nil
//                    tempStringCount.removeAll()
//                    tempString = ""
//                    result += String(now)
//                    print(index)
//                    print(now)
//                } else if stringCount[nowAscii] == 1{
//                    for tempIndex in 0..<tempString.count{
//                        guard let tempAscii = tempString[tempString.index(tempString.startIndex,offsetBy: tempIndex)].asciiValue else { fatalError() }
//                        if tempStringCount.keys.contains(tempAscii){
//                            if let a = tempStringCount[tempAscii] {
//                                tempStringCount[tempAscii] = a + 1
//                            }
//                        } else {
//                            tempStringCount[tempAscii] = 1
//                        }
//                    }
//                    for tempIndex in 0..<tempString.count{
//
//                        let tempNow = tempString[tempString.index(tempString.startIndex, offsetBy: tempIndex)]
//                        guard let tempAscii = tempNow.asciiValue else { fatalError() }
//                        if stringCount.keys.contains(tempAscii) {
//
//                            if tempAscii < nowAscii  {
//                                if tempAscii == tempStringCount.keys.min(){
//                                    result += String(tempNow)
//                                    print(index)
//                                    print(tempNow)
//                                    tempStringCount[tempAscii] = nil
//                                    stringCount[tempAscii] = nil
//                                } else if tempStringCount[tempAscii] == 1{
//                                    result += String(tempNow)
//                                    print(index)
//                                    print(tempNow)
//                                    tempStringCount[tempAscii] = nil
//                                    stringCount[tempAscii] = nil
//                                }
//                            }
//
//                        }
//                    }
//                    tempStringCount.removeAll()
//                    tempString = ""
//                    if stringCount.keys.contains(nowAscii){
//                        result += String(now)
//                        print(index)
//                        print(now)
//                        stringCount[nowAscii] = nil
//                        }
//
//                } else {
//                    if stringCount.keys.contains(nowAscii){
//                        tempString += String(now)
//                    }
//                    if let a = stringCount[nowAscii]{
//                        stringCount[nowAscii] = a - 1
//                    }
//
//                }
//            }
//        }
//
//        return result
//    }
//}

class Solution {
    func smallestSubsequence(_ text: String) -> String {
        
        var a = Array(text)
        var counts = Array(repeating: 0, count: 26)
        for i in 0..<a.count {
            let index = Int(a[i].asciiValue! - Character("a").asciiValue!)
            counts[index] += 1
        }
                        
        var stack = [Character]()
        var set = Set<Character>()
        for i in 0..<a.count {
            let index = Int(a[i].asciiValue! - Character("a").asciiValue!)
            
            while let top = stack.last, a[i].asciiValue! < top.asciiValue!, counts[Int(top.asciiValue! - Character("a").asciiValue!)] > 0, set.contains(a[i]) == false {
                print(top)
                stack.removeLast()
                set.remove(top)
            }
            
            if set.contains(a[i]) == false {
                stack.append(a[i])
                set.insert(a[i])
            }
            counts[index] -= 1
        }
        
        return String(stack)
    }
}

//var a = "bbeeccaa"
//let e = Set([a.index(a.startIndex, offsetBy: 2)...a.index(a.startIndex,offsetBy: 5)])
//print(a[a.index(a.startIndex, offsetBy: 2)...a.index(a.startIndex,offsetBy: 5)])

//var a = "cdadabcc"
//var c = "degbgjchgibedhgcdicccdhjjcegicgjejfbhijedbafgjigff"
var e = "cdadabcc"

////var d = "fbhdbdgadeighfcefdgccchbcigcaebchegeebagbhfcbhfdib"
var b = Solution()
print(b.smallestSubsequence(e))
//print(b.smallestSubsequence(c))
////print(b.smallestSubsequence(d))
//print(b.smallestSubsequence(a))


 
