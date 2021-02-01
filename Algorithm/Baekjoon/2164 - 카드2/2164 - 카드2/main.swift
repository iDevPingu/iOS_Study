//
//  main.swift
//  2164 - 카드2
//
//  Created by Ick on 2020/08/21.
//  Copyright © 2020 ick. All rights reserved.
//

import Foundation

class Queue{
    var enqueue: [Int]
    var dequeue: [Int] = []
    
    var isEmpty: Bool{
        return enqueue.isEmpty && dequeue.isEmpty
    }
    var count: Int{
        return enqueue.count + dequeue.count
    }
    
    init(_ queue:[Int]){
        self.enqueue = queue
    }
    
    func push(_ n: Int){
        enqueue.append(n)
    }
    
    func pop() -> Int?{
        if dequeue.isEmpty{
            dequeue = enqueue.reversed()
            enqueue.removeAll()
        }
        return dequeue.popLast()
    }
    
}

let n = Int(readLine()!)!
var temp = [Int]()
for card in 1...n{
    temp.append(card)
}
var queue: Queue = Queue(temp)
while queue.count != 1{
    let _ = queue.pop()
    if let card = queue.pop(){
        queue.push(card)
    }
}
print(queue.pop()!)
