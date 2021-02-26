//
//  main.swift
//  [Kakao] 2021 Blind - 신규 아이디 추천
//
//  Created by Ick on 2021/02/26.
//

import Foundation

func solution(_ new_id:String) -> String {
    var id = new_id
    let allowCharacter: [String] = ["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z","0","1","2","3","4","5","6","7","8","9","-","_","."]
    // 1단계
    id = id.lowercased()
    // 2단계
    var temp: String = ""
    for i in id {
        if allowCharacter.contains(String(i)) {
            temp += String(i)
        }
    }
    id = temp
    // 3단계
    while id.contains("..") {
        id = id.replacingOccurrences(of: "..", with: ".")
    }
    // 4단계
    if id.first == "." {
        id.removeFirst()
    }
    if id.last == "." {
        id.removeLast()
    }
    // 5단계
    if id.count == 0 {
        id = "a"
    }
    // 6단계
    if id.count >= 16 {
        id = String(id[id.startIndex..<id.index(id.startIndex, offsetBy: 15)])
    }
    if id.last == "." {
        id.removeLast()
    }
    // 7단계
    if id.count <= 2 {
        while id.count < 3 {
            id += String(id.last!)
        }
    }
    return id
}

print(solution("...!@BaT#*..y.abcdefghijklm"))
print(solution("z-+.^."))
print(solution("=.="))
print(solution("abcdefghijklmn.p"))
