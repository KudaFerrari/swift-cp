//
//  File.swift
//  
//
//  Created by DSS47 on 05/08/23.
//

import Foundation

public class CharacterSolution {
    var s = [Character]()
    
    public init(){}
    
    public func findSubstring(_ s: String, _ tempWords: [String]) -> [Int] {
        self.s = s.map { $0 }
        let wcount = tempWords.count
        let wlen = tempWords[0].count
        var wcounts: [[Character]: Int] = [:]
        for w in tempWords {
            let cword: [Character] = w.map { $0 }
            if wcounts[cword] == nil {
                wcounts[cword] = 1
            } else {
                wcounts[cword]! += 1
            }
        }
        
        var ans = [Int]()
        let permLen = wcount * wlen
        for parity in 0..<wlen {
            // [start..end)
            var wused = [[Character]: Int]()
            var start = parity
            var end = start + permLen
            // check if first window out of bounds
            guard end <= s.count else { break }
            
            // create first window
            var ws = start
            var we = ws + wlen
            while we <= end {
                let sub = substr(ws, we)
                if wused[sub] == nil {
                    wused[sub] = 1
                } else {
                    wused[sub]! += 1
                }
                ws += wlen
                we += wlen
            }
            
            while true {
                // check for valid perm
                var found = true
                for (key, value) in wcounts {
                    if wused[key] != value {
                        found = false
                        break;
                    }
                }
                if found {
                    ans.append(start)
                }
                
                // slide the window
                end += wlen
                start += wlen
                if end > s.count { break }
                let leftSub = substr(start-wlen, start)
//                print("subtract", leftSub)
                wused[leftSub]! -= 1
                let rightSub = substr(end-wlen, end)
//                print("add", rightSub)
                if wused[rightSub] == nil {
                    wused[rightSub] = 1
                } else {
                    wused[rightSub]! += 1
                }
            }
        }

        return ans
    }
    // return substring [a, b) of s
    func substr(_ a: Int, _ b: Int) -> [Character] {
        return s[a ..< b].map { $0 }
    }
}

