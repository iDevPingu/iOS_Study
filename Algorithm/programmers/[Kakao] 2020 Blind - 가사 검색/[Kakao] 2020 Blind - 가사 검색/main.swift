//
//  main.swift
//  [Kakao] 2020 Blind - 가사 검색
//
//  Created by Ick on 2021/05/07.
//

import Foundation

//func solution(_ words:[String], _ queries:[String]) -> [Int] {
//    var result = [Int](repeating: 0, count: queries.count)
//    for i in 0..<queries.count {
//        var count: Int = 0
//        let firstIndex = queries[i].firstIndex(of: "?")!
//        let lastIndex = queries[i].lastIndex(of: "?")!
//        for word in words {
//            if queries[i].count == word.count {
//                if firstIndex != queries[i].startIndex {
//                    let prefix = String(queries[i][queries[i].startIndex..<firstIndex])
//                    if word.hasPrefix(prefix) {
//                        count += 1
//                    }
//                } else {
//                    // 모두 물음표인 상황
//                    if lastIndex == queries[i].endIndex {
//                        count += 1
//                    } else {
//                        let suffix = String(queries[i][queries[i].index(after: lastIndex)..<queries[i].endIndex])
//                        if word.hasSuffix(suffix) {
//                            count += 1
//                        }
//                    }
//
//                }
//            }
//        }
//        result[i] = count
//    }
//
//    return result
//}
func solution(_ words:[String], _ queries:[String]) -> [Int] {
    var result = [Int](repeating: 0, count: queries.count)
    for i in 0..<queries.count {
        var count: Int = 0
        if queries[i][queries[i].startIndex] == "?" {
            for word in words {
                if word.count == queries[i].count {
                    let word = String(word.reversed())
                    let query = String(queries[i].reversed())
                    let lastIndex = query.firstIndex(of: "?")!
                    if word.hasPrefix(String(query[query.startIndex..<lastIndex])) {
                        count += 1
                    }
                }
            }
        } else {
            for word in words {
                if word.count == queries[i].count {
                    let lastIndex = queries[i].firstIndex(of: "?")!
                    if word.hasPrefix(String(queries[i][queries[i].startIndex..<lastIndex])) {
                        count += 1
                    }
                }
            }
        }
        result[i] = count
    }
    
    return result
}
print(solution(["frodo", "front", "frost", "frozen", "frame", "kakao"], ["fro??", "????o", "fr???", "fro???", "pro?"]))
