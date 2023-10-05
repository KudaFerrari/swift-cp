//
//  File.swift
//  
//
//  Created by DSS47 on 06/08/23.
//

import Foundation
import lc33
import XCTest

class LC33Test: XCTestCase {
    let testCases = [
        [6,7,8,9, 1,2,3,4,5],
        [4,5,6,7,0,1,2],
    ]
    
    func testCorrectness(){
        let solution = Solution()
        for testCase in testCases {
            for (i, target) in testCase.enumerated() {
                XCTAssertEqual(solution.search(testCase, target), i)
            }
        }
    }
}
