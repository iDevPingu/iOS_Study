//
//  main.swift
//  7569 - 토마토
//
//  Created by Ick on 2020/09/09.
//  Copyright © 2020 ick. All rights reserved.
//

import Foundation

func solution() -> Int{
    let firstLine = readLine()!.split(separator: " ").map({Int($0)!})
    let m = firstLine[0] // 가로
    let n = firstLine[1] // 세로
    let h = firstLine[2] // 높이
    
    var tomatoBoxes: [[[Int]]] = []
    let dx = [0,0,0,0,-1,1] // 위, 아래, 상하좌우
    let dy = [0,0,-1,1,0,0]
    let dz = [1,-1,0,0,0,0]
    
    for _ in 0..<h{
        var tempBox: [[Int]] = []
        for _ in 0..<n{
            tempBox.append(readLine()!.split(separator: " ").map({Int($0)!}))
        }
        tomatoBoxes.append(tempBox)
    }
    var result = -1
    let queue: Queue = Queue([[Int]]())
    for i in 0..<h{
        for j in 0..<n{
            for k in 0..<m{
                if tomatoBoxes[i][j][k] == 1{
                    queue.push([i,j,k])
                }
            }
        }
    }
    if queue.count == m*n*h {
        return 0
    }
    
    while (queue.count != 0){
        result += 1
        for _ in 0..<queue.count{
            guard let now = queue.pop() else { fatalError() }
            for i in 0..<dx.count{
                let newX = now[2] + dx[i]
                let newY = now[1] + dy[i]
                let newZ = now[0] + dz[i]
                
                
                if (newX >= 0 && newX < m) && (newY >= 0 && newY < n) && (newZ >= 0 && newZ < h){
                    if tomatoBoxes[newZ][newY][newX] == 0 {
                        tomatoBoxes[newZ][newY][newX] = 1
                        queue.push([newZ,newY,newX])
                    }
                }
            }
        }
    }
    
    for box in tomatoBoxes{
        for row in box{
            if row.contains(0){
                return -1
            }
        }
    }
    
    return result
}

class Queue<T>{
    var enqueue: [T]
    var dequeue: [T] = []
    
    var isEmpty: Bool{
        return enqueue.isEmpty && dequeue.isEmpty
    }
    var count: Int{
        return enqueue.count + dequeue.count
    }
    
    init(_ queue:[T]){
        self.enqueue = queue
    }
    
    func push(_ n: T){
        enqueue.append(n)
    }
    
    func pop() -> T?{
        if dequeue.isEmpty{
            dequeue = enqueue.reversed()
            enqueue.removeAll()
        }
        return dequeue.popLast()
    }
    
}
print(solution())

