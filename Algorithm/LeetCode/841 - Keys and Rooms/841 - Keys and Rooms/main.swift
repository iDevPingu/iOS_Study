//
//  main.swift
//  841 - Keys and Rooms
//
//  Created by Ick on 2021/04/21.
//

import Foundation
class Solution {
    func canVisitAllRooms(_ rooms: [[Int]]) -> Bool {
        // 해당 방에 갈 수 있는 지에 대한 여부
        var canGo = [Bool](repeating: false, count: rooms.count)
        // 문제에서 0번 방은 무조건 열려있다고 함
        canGo[0] = true
        
        // 처음에 0번 방에 존재하는 열쇠들을 스택에 넣음
        var stack: [Int] = rooms[0]
        while !stack.isEmpty {
            let now = stack.popLast()!
            if !canGo[now] {
                // 이미 갈 수 있다고 판명난 방에 대해서는 뭔갈 할 필요 없음
                canGo[now] = true
                stack.append(contentsOf: rooms[now])
            }
        }
        
        return !canGo.contains(false)
    }
}
let a = Solution()
print(a.canVisitAllRooms([[1],[2],[3],[]]))
print(a.canVisitAllRooms([[1,3],[3,0,1],[2],[0]]))
