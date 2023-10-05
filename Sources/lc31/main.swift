//
//  File.swift
//  
//
//  Created by DSS47 on 05/08/23.
//

import Foundation

public class Solution {
    
    public init(){}
    
    public func nextPermutation(_ nums: inout [Int]) {
        let len = nums.count
        var i = len-1
        while 0 <= i-1, nums[i-1] >= nums[i] {
            i -= 1
        }
//        print("nums:", nums)
//        print("i:", i)
        
        if i == 0 { // edge case
//            print("i = 0, edge case")
            var j = nums.count-1
            while i < j {
                swap(i,j,&nums)
                i += 1
                j -= 1
            }
            return
        }
        
        var n = i
        var temp = n
        while temp < nums.count {
            if nums[temp] > nums[i-1] {
                if nums[temp] <= nums[n] {
                    n = temp
                }
            }
            temp += 1
        }
//        print("A[\(n)]: \(nums[n])")
        
        swap(i-1, n, &nums)
//        print("after swap A[n]:", nums)
        var j = nums.count-1
        while i < j {
            swap(i, j, &nums)
            i += 1
            j -= 1
        }
//        print("after reverse i..<arr.count",nums)
    }
    
    public func swap(_ i: Int, _ j: Int, _ nums: inout [Int]) {
        let temp = nums[i]
        nums[i] = nums[j]
        nums[j] = temp
    }
}
