//
//  main.swift
//  [Kakao] 2020 Intern - 수식 최대화
//
//  Created by Ick on 2021/02/21.
//

import Foundation

func solution(_ expression:String) -> Int64 {
    var num: [Int64] = []
    var operators: [String] = []
    var temp: String = ""
    for i in expression {
        if i == "-" || i == "+" || i == "*" {
            num.append(Int64(temp)!)
            operators.append(String(i))
            temp = ""
        } else {
            temp += String(i)
        }
    }
    
    num.append(Int64(temp)!)
    
    let operatorList = Array(Set(operators))
    var prioritys: [[String]] = []
    var stack: [String] = []
    var visited: [Bool] = [Bool](repeating: false, count: operatorList.count)
    func dfs() {
        if stack.count == operatorList.count {
            prioritys.append(stack)
            return
        }
        for i in 0..<operatorList.count {
            if !visited[i] {
                stack.append(operatorList[i])
                visited[i] = true
                dfs()
                stack.removeLast()
                visited[i] = false
            }
        }
    }
    
    dfs()
    
    var nowResult: Int64 = Int64.min
    for priority in prioritys {
        var nowNum = num
        var nowOperators = operators
        for p in priority {
            var i = 0
            var tempNum = nowNum
            var tempOperators = nowOperators
            while i < tempOperators.count {
                if p == tempOperators[i] {
                    if p == "+" {
                        tempNum[i] = tempNum[i] + tempNum[i+1]
                        tempNum.remove(at: i+1)
                        tempOperators.remove(at: i)
                        i -= 1
                    } else if p == "-" {
                        tempNum[i] = tempNum[i] - tempNum[i+1]
                        tempNum.remove(at: i+1)
                        tempOperators.remove(at: i)
                        i -= 1
                    } else if p == "*" {
                        tempNum[i] = tempNum[i] * tempNum[i+1]
                        tempNum.remove(at: i+1)
                        tempOperators.remove(at: i)
                        i -= 1
                    }
                }
                
                i += 1
            }
            nowNum = tempNum
            nowOperators = tempOperators
        }
        
        nowResult = max(nowResult, abs(nowNum[0]))
    }
    
    return nowResult
}
//print(solution("100-200*300-500+20"))
//print(solution("50*6-3*2"))
//print(solution("2-990-5+2"))
print(solution("1+1+1+1+1"))
