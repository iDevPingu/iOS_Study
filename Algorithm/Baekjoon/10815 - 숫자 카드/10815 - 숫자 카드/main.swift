//
//  main.swift
//  10815 - 숫자 카드
//
//  Created by Ick on 2020/09/22.
//  Copyright © 2020 ick. All rights reserved.
//

import Foundation

func solution(){
    let n = Int(readLine()!)!
    var secondLine = (readLine()!.split(separator: " ").map({Int(String($0))!}))
    let m = Int(readLine()!)!
    let forthLine = (readLine()!.split(separator: " ").map({Int(String($0))!}))
    var answer: [String] = []
    
    secondLine.sort()
    

    
    for i in forthLine{
        if binarySearch(0,n-1, i,secondLine) {
            answer.append("1")
        } else {
            answer.append("0")
        }
    }
    print(answer.joined(separator: " "))
}

func binarySearch(_ left: Int,_ right: Int, _ number: Int,_ array:[Int]) -> Bool{
    var result = false
    if left > right {
        return false
    }
    let middle: Int = (left + right) / 2
    if array[middle] > number {
        result = binarySearch(left, middle - 1, number,array)
    } else if array[middle] < number {
        result = binarySearch(middle + 1, right, number,array)
    } else{
        return true
    }
    return result
}
solution()
