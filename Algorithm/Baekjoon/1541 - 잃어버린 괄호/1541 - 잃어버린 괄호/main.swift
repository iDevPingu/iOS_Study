//
//  main.swift
//  1541 - 잃어버린 괄호
//
//  Created by Ick on 2020/08/26.
//  Copyright © 2020 ick. All rights reserved.
//

import Foundation

func solution() -> Int{
    let expression = readLine()!
    
    var result = 0
    var tempSum = 0
    var minusAppearMoreThanOnce = false
    var nowNum : String = ""
    for offset in 0..<expression.count{
        let nowChar = String(expression[expression.index(expression.startIndex, offsetBy: offset)])
        if nowChar == "+"{
            if !minusAppearMoreThanOnce {
                result += Int(nowNum) ?? 0
                result += tempSum
                nowNum = ""
                tempSum = 0
            } else if minusAppearMoreThanOnce{
                tempSum += Int(nowNum) ?? 0
                nowNum = ""
            }
            
        } else if nowChar == "-"{
            if !minusAppearMoreThanOnce {
                minusAppearMoreThanOnce = true
                result += Int(nowNum) ?? 0
                result += tempSum
                nowNum = ""
                tempSum = 0
            } else if minusAppearMoreThanOnce{
                result -= Int(nowNum) ?? 0
                result -= tempSum
                nowNum = ""
                tempSum = 0
            }
        } else {
            nowNum += nowChar
        }
        
        if offset == expression.count - 1{
            if !minusAppearMoreThanOnce{
                result += Int(nowNum) ?? 0
                result += tempSum
            } else if minusAppearMoreThanOnce {
                result -= Int(nowNum) ?? 0
                result -= tempSum
            }
        }
    }
    return result
}

print(solution())
