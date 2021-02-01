//
//  main.swift
//  1920 - 수찾기
//
//  Created by Ick on 2020/07/28.
//  Copyright © 2020 Ick. All rights reserved.
//

import Foundation



let N = Int(readLine()!)
var firstArray: Array<Int> = [Int]()
firstArray = readLine()!.split(separator: " ").map(){Int(String($0))!}
firstArray.sort()

let M = Int(readLine()!)
var secondArray: Array<Int> = [Int]()
secondArray = readLine()!.split(separator: " ").map(){Int(String($0))!}

var result = [Int]()

for i in 0..<secondArray.count {
    result.append(binarySearch(firstArray,secondArray[i]))
}

for i in 0..<result.count{
    print(result[i])
}

func binarySearch(_ firstArray: [Int], _ temp: Int) -> Int{

    if temp < firstArray[0] {
        return 0
    } else if temp > firstArray[firstArray.count - 1]{
        return 0
    } else {
        var start: Int = 0
        var end: Int = firstArray.count - 1
        var mid: Int = (end + start) / 2
        while (end-start >= 0) {
            if firstArray[mid] == temp {
                return 1
            } else if (firstArray[mid] < temp){
                start = mid + 1
            } else if (firstArray[mid] > temp){
                end = mid - 1
            }
            
            mid = (start + end) / 2
        }
    }

    return 0
}
