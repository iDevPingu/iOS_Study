//
//  main.swift
//  [Kakao] 2020 Intern - 보석 쇼핑
//
//  Created by Ick on 2021/02/21.
//

import Foundation

//func solution(_ gems:[String]) -> [Int] {
//    let gemsSet = Set(gems)
//    var dict: [String: Int] = [:]
//
//    var result: [Int] = []
//
//    var left: Int = 0
//    var right: Int = 0
//
//    while left < gems.count || right < gems.count {
//        for i in 0..<gems.count {
//            if let gemCount = dict[gems[i]] {
//                dict[gems[i]] = gemCount + 1
//            } else {
//                dict[gems[i]] = 1
//            }
//            // 갯수가 맞다면 더 효율적인 방법이 있는지 찾기 위해 left 증가
//            if dict.count == gemsSet.count {
//                if result.isEmpty {
//                    result = [left, right]
//                } else {
//                    if result[1] - result[0] > left - right {
//                        result = [left, right]
//                    } else {
//                        if let value = dict[gems[i]] {
//                            if value == 1 {
//                                dict[gems[i]] = nil
//                            } else {
//                                dict[gems[i]] = value - 1
//                            }
//                        }
//                        left += 1
//                        if left >= gems.count {
//                            break
//                        }
//                    }
//                }
//                // 맞지 않는 경우
//            } else {
//                right += 1
//                if right >= gems.count {
//                    break
//                }
//            }
//        }
//    }
//
//
//    return result
//}

func solution(_ gems:[String]) -> [Int] {
    let gemCount = Set(gems).count
    var gemMap: [String: Int] = [:]
    gemMap[gems[0]] = 1
    var left: Int = 0
    var right: Int = 0
    var result: [Int] = [0, gems.count - 1]
    
    while left < gems.count && right < gems.count {
        if gemMap.count == gemCount {
            if right - left < result[1] - result[0] {
                result = [left, right]
            }
            if gemMap[gems[left]] == 1 {
                gemMap[gems[left]] = nil
            } else {
                gemMap[gems[left]]! -= 1
            }
            left += 1
        } else {
            right += 1
            if right == gems.count {
                break
            }
            if let count = gemMap[gems[right]] {
                gemMap[gems[right]] = count + 1
            } else {
                gemMap[gems[right]] = 1
            }
        }
    }
    
    return [result[0] + 1, result[1] + 1]
}

print(solution(["DIA", "RUBY", "RUBY", "DIA", "DIA", "EMERALD", "SAPPHIRE", "DIA"]))
print(solution(["AA", "AB", "AC", "AA", "AC"]))
print(solution(["XYZ", "XYZ", "XYZ"]))
print(solution(["ZZZ", "YYY", "NNNN", "YYY", "BBB"]))
print(solution(["DIA", "EM", "EM", "RUB", "DIA"]))
