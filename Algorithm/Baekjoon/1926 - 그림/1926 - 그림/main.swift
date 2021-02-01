//
//  main.swift
//  1926 - 그림
//
//  Created by Ick on 2021/01/01.
//

import Foundation

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

func solution() {
    let firstLine = readLine()!.split(separator: " ").map({Int(String($0))!})
    let n = firstLine[0]
    let m = firstLine[1]
    var pictures: [[Int]] = []
        
    for _ in 0..<n {
        pictures.append(readLine()!.split(separator: " ").map({Int(String($0))!}))
    }
    
    var numberOfPicture: Int = 0
    var largestPicture: Int = 0
    
    var visited: [[Bool]] = [[Bool]](repeating: [Bool](repeating: false, count: m), count: n)

    let dx: [Int] = [0,0,-1,1]
    let dy: [Int] = [-1,1,0,0]
    var stack: [[Int]] = []
    for i in 0..<n {
        for j in 0..<m {
            if pictures[i][j] == 1 && !visited[i][j]{
                numberOfPicture += 1
                var tempSize = 0
                stack.append([i,j])
                while(!stack.isEmpty) {
                    let now = stack.popLast()!
                    if visited[now[0]][now[1]] {
                        continue
                    } else {
                        tempSize += 1
                        visited[now[0]][now[1]] = true
                        for k in 0..<dx.count {
                            let newX = now[1] + dx[k]
                            let newY = now[0] + dy[k]
                            
                            if newX < 0 || newY < 0 || newX > m-1 || newY > n-1 {
                                continue
                            } else {
                                if !visited[newY][newX] && pictures[newY][newX] == 1 {
                                    stack.append([newY,newX])
                                }
                            }
                        }
                    }
                }
                if tempSize > largestPicture {
                    largestPicture = tempSize
                }
            }
        }
    }
    
    print(numberOfPicture)
    print(largestPicture)
}

solution()

