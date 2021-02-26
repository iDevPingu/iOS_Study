//
//  main.swift
//  [Kakao] 2021 Bilnd - 메뉴 리뉴얼
//
//  Created by Ick on 2021/02/26.
//

import Foundation

func solution(_ orders:[String], _ course:[Int]) -> [String] {
    
    // 음식의 조합을 저장할 딕셔너리
    var dishCombinations: [Int: [[String] : Int]] = [:]
    // 각 코스별 최대 주문수
    var courseMax: [Int] = [Int](repeating: 0, count: course.count)
    for c in course {
        dishCombinations[c] = [:]
    }
    
    var splitOrders: [[String]] = []
    
    for order in orders {
        let splitOrder = order.map({String($0)}).sorted()
        splitOrders.append(splitOrder)
    }
    
    // 컴비네이션을 만들기 위한 임시 배열
    var temp: [String] = []
    
    func combination(orderIndex: Int, courseIndex: Int, index: Int) {
        if temp.count == course[courseIndex] {
            if let count = dishCombinations[course[courseIndex]]![temp] {
                dishCombinations[course[courseIndex]]![temp] = count + 1
                courseMax[courseIndex] = max(count + 1, courseMax[courseIndex])
            } else {
                dishCombinations[course[courseIndex]]![temp] = 1
                courseMax[courseIndex] = max(1, courseMax[courseIndex])
            }
            return
        }
        if index >= orders[orderIndex].count {
            return
        }
        for i in index..<splitOrders[orderIndex].count {
            temp.append(splitOrders[orderIndex][i])
            combination(orderIndex: orderIndex, courseIndex: courseIndex, index: i + 1)
            temp.removeLast()
        }
    }
    for orderIndex in 0..<splitOrders.count {
        for courseIndex in 0..<course.count {
            combination(orderIndex: orderIndex, courseIndex: courseIndex, index: 0)
        }
    }
    
    var result: [String] = []
    
    for courseIndex in 0..<course.count {
        // 최소 2번 이상 주문해야하는 조건이 있기 때문에
        if courseMax[courseIndex] < 2 {
            continue
        }
        let combinations = dishCombinations[course[courseIndex]]!
        for key in combinations.keys {
            if combinations[key] == courseMax[courseIndex] {
                result.append(key.joined())
            }
        }
    }
    result.sort()
    
    return result
}
print(solution(["ABCFG", "AC", "CDE", "ACDE", "BCFG", "ACDEH"], [2,3,4]))
print(solution(["ABCDE", "AB", "CD", "ADE", "XYZ", "XYZ", "ACD"], [2,3,5]))
print(solution(["XYZ", "XWY", "WXA"], [2,3,4]))
