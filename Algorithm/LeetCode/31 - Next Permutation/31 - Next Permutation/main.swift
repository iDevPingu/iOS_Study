//
//  main.swift
//  31 - Next Permutation
//
//  Created by Ick on 2021/05/12.
//

import Foundation

//class Solution {
//    func nextPermutation(_ nums: inout [Int]) {
//        let target = nums
//        nums.sort()
//
//        var visited = [Bool](repeating: false, count: nums.count)
//        var stack: [String] = []
//        var permutations: [String] = []
//        func permutation() {
//            if stack.count == nums.count {
//                permutations.append(stack.joined())
//                return
//            }
//            for i in 0..<nums.count {
//                if !visited[i] {
//                    stack.append(String(nums[i]))
//                    visited[i] = true
//                    permutation()
//                    visited[i] = false
//                    stack.removeLast()
//                }
//            }
//        }
//        permutation()
//        permutations = Array(Set(permutations)).sorted()
//        let temp = target.map({String($0)}).joined()
//        if permutations.last! == temp {
//            nums = permutations.first!.map({Int(String($0))!})
//        } else {
//            nums = permutations[Int(permutations.firstIndex(of: temp)!) + 1].map({Int(String($0))!})
//        }
//    }
//}
class Solution {
    func nextPermutation(_ nums: inout [Int]) {
        let sortNums = nums.sorted(by: >)
        if sortNums == nums {
            nums = sortNums.reversed()
            return
        }
        
    }
}
let a = Solution()
var firstInput = [1,2,3]
var secondInput = [3,2,1]
var thirdInput = [1,1,5]
a.nextPermutation(&firstInput)
a.nextPermutation(&secondInput)
a.nextPermutation(&thirdInput)

print(firstInput)
print(secondInput)
print(thirdInput)

var input = [1,5,1]
a.nextPermutation(&input)
print(input)
