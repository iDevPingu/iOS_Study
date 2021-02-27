//
//  main.swift
//  [Kakao] 2019 Winter Intern - 불량 사용자
//
//  Created by Ick on 2021/02/27.
//

import Foundation

func solution(_ user_id:[String], _ banned_id:[String]) -> Int {
    var banList: [[String]] = [[String]](repeating: [], count: banned_id.count)
    
//    var result: [[String] : Int] = [:]
    var result: Set<Set<String>> = []
    for ban in 0..<banned_id.count {
        let banId = banned_id[ban]
        for user in 0..<user_id.count {
            let userId = user_id[user]
            if banId.count == userId.count {
                for i in 0..<banId.count {
                    if banId[banId.index(banId.startIndex, offsetBy: i)] == "*" {
                        if i == banId.count - 1 {
                            banList[ban].append(userId)
                        }
                    } else if banId[banId.index(banId.startIndex, offsetBy: i)] == userId[userId.index(userId.startIndex, offsetBy: i)] {
                        if i == banId.count - 1 {
                            banList[ban].append(userId)
                        }
                    } else {
                        break
                    }
                }
            }
        }
    }
    var visited: [String: Bool] = [:]
    var temp: [String] = []
    for userId in user_id {
        visited[userId] = false
    }
    func dfs(_ index: Int) {
        if temp.count == banned_id.count {
            result.insert(Set(temp))
            return
        }
        if index > banList.count {
            return
        }
        for i in 0..<banList[index].count {
            if visited[banList[index][i]]! {
                continue
            }
            visited[banList[index][i]]! = true
            temp.append(banList[index][i])
            dfs(index + 1)
            visited[banList[index][i]]! = false
            temp.removeLast()
        }
    }
    dfs(0)
    print(banList)
    print(result)
    return result.count
}

//print(solution(["frodo", "fradi", "crodo", "abc123", "frodoc"], ["fr*d*", "abc1**"]))
//print(solution(["frodo", "fradi", "crodo", "abc123", "frodoc"], ["*rodo", "*rodo", "******"]))
print(solution(["frodo", "fradi", "crodo", "abc123", "frodoc"], ["fr*d*", "*rodo", "******", "******"]))
