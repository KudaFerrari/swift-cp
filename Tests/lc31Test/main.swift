//
//  File.swift
//  
//
//  Created by DSS47 on 06/08/23.
//

import Foundation
import XCTest
import lc31

class LC31Tests: XCTestCase {
    let testCases = [
        ([1, 2, 3, 6, 5, 4], [1, 2, 4, 3, 5, 6]),
        ([1,4,2,5,4], [1,4,4,2,5]),
        ([4,3,2,1], [1,2,3,4]),
        ([2,3,1], [3,1,2]),
        ([2,3,1,3,3], [2,3,3,1,3]),
    ]
    
    func testCorrectness(){
        let solution = Solution()
        for tc in testCases {
            var arr = tc.0
            solution.nextPermutation(&arr)
            XCTAssertEqual(arr, tc.1)
        }
    }
}
