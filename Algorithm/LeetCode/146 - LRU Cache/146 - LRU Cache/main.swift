//
//  main.swift
//  146 - LRU Cache
//
//  Created by Ick on 2021/02/27.
//

import Foundation

// 좀 더 나은 방법을 생각해봅시다.
class LRUCache {

    // key: [value, time]
    var cache: [Int: Int] = [:]
    var capacity: Int = 0
    var queue: [Int] = []
    init(_ capacity: Int) {
        self.capacity = capacity
    }
    
    func get(_ key: Int) -> Int {
        guard let value = self.cache[key] else {
            return -1
        }
        for i in 0..<queue.count where queue[i] == key {
            queue.remove(at: i)
            break
        }
        queue.append(key)
        return value
    }
    
    func put(_ key: Int, _ value: Int) {
        if cache.count < capacity {
            guard let _ = self.cache[key] else {
                cache[key] = value
                queue.append(key)
                return
            }
            for i in 0..<queue.count where queue[i] == key {
                queue.remove(at: i)
                break
            }
            cache[key] = value
            queue.append(key)
            return
        } else if cache.count == capacity {
            guard let _ = self.cache[key] else {
                // 캐시에 없다!?
                if !queue.isEmpty {
                    let longTimeNoAccessKey = queue.removeFirst()
                    cache[longTimeNoAccessKey] = nil
                    cache[key] = value
                    queue.append(key)
                }
                return
            }
            for i in 0..<queue.count where queue[i] == key {
                queue.remove(at: i)
                break
            }
            cache[key] = value
            queue.append(key)
            return
        }
    }
}

let lRUCache = LRUCache(2)
print("null")
lRUCache.put(1, 1)// cache is {1=1}
print("null")
lRUCache.put(2, 2) // cache is {1=1, 2=2}
print("null")
print(lRUCache.get(1))    // return 1
lRUCache.put(3, 3) // LRU key was 2, evicts key 2, cache is {1=1, 3=3}
print("null")
print(lRUCache.get(2))    // returns -1 (not found)
lRUCache.put(4, 4) // LRU key was 1, evicts key 1, cache is {4=4, 3=3}
print("null")
print(lRUCache.get(1))    // return -1 (not found)
print(lRUCache.get(3))    // return 3
print(lRUCache.get(4))    // return 4
