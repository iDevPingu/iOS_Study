//
//  main.swift
//  [Kakao] 2021 Blind - 순위 검색
//
//  Created by Ick on 2021/02/26.
//

import Foundation

func solution(_ info:[String], _ query:[String]) -> [Int] {
    var result: [Int] = []
    var peopleInfo: [[String]] = []
    var querySplit: [[String]] = []
    for i in 0..<info.count {
        peopleInfo.append(info[i].split(separator: " ").map({String($0)}))
    }
    for i in 0..<query.count {
        var temp: [String] = []
        let _ = query[i].split(separator: " ").map { (word) -> String in
            if word != "and" {
                temp.append(String(word))
            }
            return ""
        }
        querySplit.append(temp)
    }
    
    for queryIndex in 0..<querySplit.count {
        let nowQuery = querySplit[queryIndex]
        var pass: Int = 0
        for peopleIndex in 0..<peopleInfo.count {
            let people = peopleInfo[peopleIndex]
            for spec in 0..<nowQuery.count {
                // 코테 점수
                if spec == 4 {
                    if Int(nowQuery[spec])! <= Int(people[spec])! {
                        pass += 1
                    }
                } else {
                    if nowQuery[spec] == "-" {
                        continue
                    } else {
                        if nowQuery[spec] == people[spec] {
                           continue
                        } else {
                            break
                        }
                    }
                }
            }
        }
        result.append(pass)
    }
    
    return result
}

print(solution(["java backend junior pizza 150","python frontend senior chicken 210","python frontend senior chicken 150","cpp backend senior pizza 260","java backend junior chicken 80","python backend senior chicken 50"], ["java and backend and junior and pizza 100","python and frontend and senior and chicken 200","cpp and - and senior and pizza 250","- and backend and senior and - 150","- and - and - and chicken 100","- and - and - and - 150"]))
