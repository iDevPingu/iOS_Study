//
//  main.swift
//  763 - Partition Labels
//
//  Created by Ick on 2021/02/07.
//

import Foundation

// Greedy?
//class Solution {
//    func partitionLabels(_ S: String) -> [Int] {
//        let stringArray = S.map({String($0)})
//        var hashTable: [String: [Int]] = [:]
//        var result: [Int] = []
//
//        for i in 0..<stringArray.count {
//            if let temp = hashTable[stringArray[i]] {
//                hashTable[stringArray[i]] = [temp[0], i]
//            } else {
//                hashTable[stringArray[i]] = [i,i]
//            }
//        }
//
//        var range: [[Int]] = []
//
//        for key in hashTable.keys {
//            range.append(hashTable[key]!)
//        }
//
//        range = range.sorted { (a, b) -> Bool in
//            return a[0] < b[0]
//        }
//
//        var clusters: [[Int]] = []
//
//        for i in 0..<range.count {
//            if clusters.isEmpty {
//                clusters.append(range[i])
//            } else {
//                for j in 0..<clusters.count {
//                    let cluster = clusters[j]
//                    if range[i][0] > cluster[0] && range[i][1] < cluster[1] {
//                        // 아예 겹치는 경우
//                        break
//                    } else if range[i][0] > cluster[1] {
//                        if j == clusters.count - 1 {
//                            clusters.append(range[i])
//                        }
//                        continue
//                    } else if range[i][1] < cluster[0] {
//                        if j == clusters.count - 1 {
//                            clusters.append(range[i])
//                        }
//                    } else {
//                        clusters[j] = [min(range[i][0], cluster[0]), max(range[i][1], cluster[1])]
//                    }
//                }
//            }
//        }
//
//        for cluster in clusters {
//            result.append(cluster[1] - cluster[0] + 1)
//        }
//
//        return result
//    }
//}

class Solution {
    func partitionLabels(_ S: String) -> [Int] {
        let array = Array(S)
        func arrayIndex(_ index: Int) -> Character {
            return array[index]
        }
        
        if array.count == 0 {
            return []
        }
        
        var charEndMap = [Character: Int]()
        
        for index in 0..<array.count {
            charEndMap[arrayIndex(index)] = index
        }
        
        var last = 0
        var start = 0
        var result = [Int]()
        
        for index in 0..<array.count {
            let charStopsAtIndex = charEndMap[arrayIndex(index)]!
            last = max(last, charStopsAtIndex)
            if last == index {
                result.append(last - start + 1)
                start = last + 1
            }
        }
        return result
    }
}

let a = Solution()
print(a.partitionLabels("ababcbacadefegdehijhklij"))
