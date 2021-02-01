//
//  main.swift
//  10816 - 숫자 카드 2
//
//  Created by Ick on 2020/07/29.
//  Copyright © 2020 Ick. All rights reserved.
//

import Foundation


let N = Int(readLine()!)
var numberCards = readLine()!.split(separator: " ").map(){Int(String($0))!}
let M = Int(readLine()!)
let sanggunCards = readLine()!.split(separator: " ").map(){Int(String($0))!}
var result = [Int]()
var hashMap = [Int: Int]()
for i in numberCards{
    if hashMap.keys.contains(i){
        hashMap[i]! += 1
    } else {
        hashMap[i] = 1
    }
}
for i in sanggunCards{
    if hashMap.keys.contains(i) {
        result.append(hashMap[i]!)
    } else {
        result.append(0)
    }
}
var answer = ""
for i in result {
    answer += String(i) + " "
}

print(answer)
//for i in sanggunCards{
//    var find: Int = BinarySearch(numberCards, i)
//    print(i, find)
//    if find == -1{
//        result.append(0)
//    } else {
//        var start: Int = 0
//        var end: Int = numberCards.count - 1
//        while (start < find - 1){
//            let temp: Int = BinarySearch(Array(numberCards[start..<find]), i)
//            if temp == -1 {
//                start = find
//                break
//            } else if temp > start {
//                start = temp
//            }
//        }
//        while (find + 1 < end){
//            let temp: Int = BinarySearch(Array(numberCards[find + 1...end]), i)
//            if temp == -1{
//                end = find
//                break
//            } else if temp < end {
//                end = temp
//            }
//
//        }
//
//        result.append(end - start + 1)
//    }
//
//}

