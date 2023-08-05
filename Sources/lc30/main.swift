//
//  File.swift
//  
//
//  Created by DSS47 on 03/08/23.
//

import Foundation
// sliding window algo
// - still not fast enough, maybe use Array<UInt8> to represent strings

public class Solution {
    var s = ""
    
    public init(){}
    
    public func findSubstring(_ s: String, _ tempWords: [String]) -> [Int] {
        self.s = s
        let wcount = tempWords.count
        let wlen = tempWords[0].count
        var wcounts: [String: Int] = [:]
        for w in tempWords {
            if wcounts[w] == nil {
                wcounts[w] = 1
            } else {
                wcounts[w]! += 1
            }
        }
        
        var ans = [Int]()
        ans.reserveCapacity(5000)
        let permLen = wcount * wlen
        for parity in 0..<wlen {
            // [start..end)
            var wused = [String: Int]()
            var start = parity
            var end = start + permLen
            print("range: ", start, end)
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
    func substr(_ a: Int, _ b: Int) -> String {
        let left = s.index(s.startIndex, offsetBy: a)
        let right = s.index(s.startIndex, offsetBy: b)
        return String(s[left ..< right])
    }
}
