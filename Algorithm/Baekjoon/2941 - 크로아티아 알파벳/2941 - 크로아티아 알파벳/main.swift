//
//  main.swift
//  2941 - 크로아티아 알파벳
//
//  Created by Ick on 2021/03/07.
//

import Foundation

func solution() {
    var input = readLine()!
    let chroatiaAlphabet: [String] = ["c=", "c-", "dz=", "d-", "lj", "nj", "s=", "z="]
    
    for i in 0..<chroatiaAlphabet.count {
        while input.contains(chroatiaAlphabet[i]) {
            input = input.replacingOccurrences(of: chroatiaAlphabet[i], with: " ")
        }
    }
    
    print(input.count)
}

solution()
