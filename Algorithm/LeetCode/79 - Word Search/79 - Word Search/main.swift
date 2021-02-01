//
//  main.swift
//  79 - Word Search
//
//  Created by Ick on 2021/02/01.
//

import Foundation
class Solution {
    func exist(_ board: [[Character]], _ word: String) -> Bool {
        
        let dx: [Int] = [0,0,-1,1]
        let dy: [Int] = [-1,1,0,0]
        
        let m = board[0].count
        let n = board.count
        var visited: [[Bool]] = [[Bool]](repeating: [Bool](repeating: false, count: m), count: n)

        let goal = word.map({Character(extendedGraphemeClusterLiteral: $0)})
        var now: [Character] = []
        var stack: [[Int]] = []
        var result: Bool = false
        
        func dfs() {
            if stack.isEmpty {
                return
            }
            if result {
                return
            }
            let nowIndex = stack.popLast()!
            let nowChar = board[nowIndex[1]][nowIndex[0]]
            if !visited[nowIndex[1]][nowIndex[0]] {
                // 현재 값이 목표값과 같다면
                if nowChar == goal[now.count] {
                    now.append(nowChar)
                    visited[nowIndex[1]][nowIndex[0]] = true
                    if now == goal {
                        result = true
                        stack = []
                        return
                    }
                    for i in 0..<4{
                        let newX = nowIndex[0] + dx[i]
                        let newY = nowIndex[1] + dy[i]
                        
                        if newX < 0 || newY < 0 || newX > m-1 || newY > n-1 {
                            continue
                        } else {
                            // 만약 이번 재귀에서 방문한 적이 없다면 스택에 넣은뒤 dfs 수행.
                            if !visited[newY][newX] {
                                stack.append([newX,newY])
                                dfs()
                                if result {
                                    break
                                }
                                visited[newY][newX] = false
                            }
                        }
                    }
                    // 만약 위의 반복문에서 답을 찾지 못했다면 이번 재귀에서 넣은 값은 절대로 답이 될 수 없으니 빼준다.
                    let _ = now.popLast()!
                } else {
                    return
                }
            } else {
                return
            }
        }
        for i in 0..<n {
            for j in 0..<m {
                stack.append([j,i])
                dfs()
                visited[i][j] = false
                // 현재 값들은 정답이 절대 아니므로 비워준다.
                now = []
            }
        }
        
        return result
    }
}

let a = Solution()
print(a.exist([["A","B","C","E"],["S","F","C","S"],["A","D","E","E"]], "ABCCED"))
print(a.exist([["A","B","C","E"],["S","F","C","S"],["A","D","E","E"]], "SEE"))
print(a.exist([["A","B","C","E"],["S","F","C","S"],["A","D","E","E"]], "ABCB"))
print(a.exist([["A"]], "A"))
print(a.exist([["C","A","A"],
               ["A","A","A"],
               ["B","C","D"]], "AAB"))
