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
    // 주어진 식에서 연산자와 숫자를 나눈다.
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
    
    // 연산자가 중복해서 들어있을 수 있기 때문에 중복제거
    let operatorList = Array(Set(operators))
    // 우선순위 조합들을 넣을 배열
    var prioritys: [[String]] = []
    var stack: [String] = []
    var visited: [Bool] = [Bool](repeating: false, count: operatorList.count)
    // 모든 연산자 우선순위를 만드는 dfs 함수
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
    
    // 결과를 저장할 값
    var nowResult: Int64 = Int64.min
    // 아까 만든 연산자 우선순위조합으로 모든 경우를 계산해본다
    for priority in prioritys {
        var nowNum = num
        // 식에 포함된 연산자를 가지고 옴
        var nowOperators = operators
        // 연산자 우선순위에 맞게 모두 처리
        for p in priority {
            var i = 0
            var tempNum = nowNum
            var tempOperators = nowOperators
            // 우선순위에 맞게 계산한다
            while i < tempOperators.count {
                if p == tempOperators[i] {
                    if p == "+" {
                        // 현재 i, i+1 위치의 값을 더한 값을 i에 저장
                        tempNum[i] = tempNum[i] + tempNum[i+1]
                        // i+1에 위치한 값은 제거
                        tempNum.remove(at: i+1)
                        // i위치의 연산자도 사용했기 때문에 제거
                        tempOperators.remove(at: i)
                        // i값 1 감소
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
                // 현재 우선순위 연산자를 모두 계산한 뒤엔 i값 1 증가
                i += 1
            }
            nowNum = tempNum
            nowOperators = tempOperators
        }
        // 현재 계산된 값과 기존 값을 비교해서 최대값을 저장
        nowResult = max(nowResult, abs(nowNum[0]))
    }
    
    return nowResult
}
//print(solution("100-200*300-500+20"))
//print(solution("50*6-3*2"))
//print(solution("2-990-5+2"))
print(solution("1+1+1+1+1"))
