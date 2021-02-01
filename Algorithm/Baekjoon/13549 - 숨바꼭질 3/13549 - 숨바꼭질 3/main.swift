//
//  main.swift
//  13549 - 숨바꼭질 3
//
//  Created by Ick on 2020/11/13.
//

import Foundation

public struct Heap<T> {
  var nodes: [T] = []
  let comparer: (T,T) -> Bool

  var isEmpty: Bool {
      return nodes.isEmpty
  }

  init(comparer: @escaping (T,T) -> Bool) {
      self.comparer = comparer
  }

  func peek() -> T? {
      return nodes.first
  }

  mutating func insert(_ element: T) {
      var index = nodes.count

      nodes.append(element)

      while index > 0, !comparer(nodes[index],nodes[(index-1)/2]) {
          nodes.swapAt(index, (index-1)/2)
          index = (index-1)/2
      }
  }

  mutating func delete() -> T? {
      guard !nodes.isEmpty else {
          return nil
      }

      if nodes.count == 1 {
          return nodes.removeFirst()
      }

      let result = nodes.first
      nodes.swapAt(0, nodes.count-1)
      _ = nodes.popLast()

      var index = 0

      while index < nodes.count {
          let left = index * 2 + 1
          let right = left + 1

          if right < nodes.count {
              if comparer(nodes[left], nodes[right]),
                  !comparer(nodes[right], nodes[index]) {
                  nodes.swapAt(right, index)
                  index = right
              } else if !comparer(nodes[left], nodes[index]){
                  nodes.swapAt(left, index)
                  index = left
              } else {
                  break
              }
          } else if left < nodes.count {
              if !comparer(nodes[left], nodes[index]) {
                  nodes.swapAt(left, index)
                  index = left
              } else {
                  break
              }
          } else {
              break
          }
      }

      return result
  }
}

extension Heap where T: Comparable {
    init() {
        self.init(comparer: >)
    }
}

// Heap By 라이노님 https://gist.github.com/JCSooHwanCho/a3f070c2160bb8c0047a5ddbb831f78e

struct EdgeData : Comparable {
    static func < (lhs: EdgeData, rhs: EdgeData) -> Bool {
        lhs.cost < rhs.cost
    }
    var cost: Int
    var node: Int
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

func solution() {
    let inf = 77777777
    let firstLine = readLine()!.split(separator: " ").map({Int(String($0))!})
    let n = firstLine[0]
    let k = firstLine[1]
    
    // 수빈이가 걷는다면 n-1, n+1
    // 수빈이가 순간이동 0초 후에 2*n
    // 동생은 가만히 있네요
    
    let queue: Queue = Queue([[Int]]())
    queue.push([5,0])
    
    var visited: [Int] = [Int](repeating: inf, count: 100001)
    visited[n] = 0
    
    
    
    while !queue.isEmpty {
        guard let now = queue.pop() else { fatalError() }
        if now[1] == k {
            break
        }
        for i in 0..<3 {
            if i == 0 {
                let next = now[0] - 1
                if next < 0 {
                    continue
                }
                if now[1] + 1 < visited[now[0]] {
                    visited[now[0]] = now[1] + 1
                }
                queue.push([next, visited[now[0]]])
            } else if i == 1 {
                let next = now[0] + 1
                if next > 2 * k {
                    continue
                }
                if now[1] + 1 < visited[now[0]] {
                    visited[now[0]] = now[1] + 1
                }
                queue.push([next, visited[now[0]]])
            } else if i == 2 {
                let next = now[0] * 2
                if next > 2 * k{
                    continue
                }
                if now[1] < visited[now[0]] {
                    visited[now[0]] = now[1]
                }
                queue.push([next, visited[now[0]]])
            }
        }
    }
    
    print(visited[k])
}

solution()
