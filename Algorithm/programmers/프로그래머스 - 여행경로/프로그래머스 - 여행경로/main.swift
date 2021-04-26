//
//  main.swift
//  프로그래머스 - 여행경로
//
//  Created by Ick on 2021/04/26.
//

import Foundation
class Ticket {
    var index: Int
    var start: String
    var end: String
    init(index: Int, start: String, end: String) {
        self.index = index
        self.start = start
        self.end = end
    }
}

extension Ticket: Comparable {
    static func < (lhs: Ticket, rhs: Ticket) -> Bool {
        return lhs.end < rhs.end
    }
    
    static func == (lhs: Ticket, rhs: Ticket) -> Bool {
        return lhs.index == rhs.index
    }
    
    
}

func solution(_ tickets:[[String]]) -> [String] {
    // 도착지를 알파벳 순서로 정렬한다.
    let tickets = tickets.sorted { $0[1] < $1[1] }
    // 티켓의 사용여부를 기록
    var visited = [Bool](repeating: false, count: tickets.count)
    
    var result: [String] = []
    
    func dfs(start: String) {
        // 현재 방문한 도시 수가 티켓 수와 같다면 지금 도착한 곳이 마지막 여행지
        if result.count == tickets.count {
            result.append(start)
            return
        }
        for i in 0..<tickets.count {
            if tickets[i][0] == start && !visited[i] {
                visited[i] = true
                result.append(start)
                dfs(start: tickets[i][1])
                // 정답을 이미 구했다면 return
                if result.count == tickets.count + 1 {
                    return
                }
                result.removeLast()
                visited[i] = false
            }
        }
    }
    
    // 시작은 항상 "ICN"이라고 문제에서 주어짐
    dfs(start: "ICN")
    
    return result
}

print(solution([["ICN", "JFK"], ["HND", "IAD"], ["JFK", "HND"]])) // ["ICN", "JFK", "HND", "IAD"]
print(solution([["ICN", "SFO"], ["ICN", "ATL"], ["SFO", "ATL"], ["ATL", "ICN"], ["ATL","SFO"]])) // ["ICN", "ATL", "ICN", "SFO", "ATL", "SFO"]
print(solution([["ICN", "AAA"], ["ICN", "AAA"], ["ICN", "AAA"], ["AAA", "ICN"], ["AAA", "ICN"], ["AAA", "ICN"]])) //
print(solution([["ICN", "A"], ["A","B"], ["A","C"], ["C", "A"] ,["B", "D"]]))
