//
//  File.swift
//  
//
//  Created by DSS47 on 06/08/23.
//

import Foundation

public class Solution {
    public init(){}
    
    public func search(_ nums: [Int], _ target: Int) -> Int {
        print("search(\(target)")
        if nums.first! > nums.last!,
           let p = findPivot(0, nums.count-1, nums: nums) {
            print("pivot: \(nums[p])")
            if target > nums.last! {
                return binarySearch(0, p-1, nums, target) ?? -1
            } else {
                return binarySearch(p, nums.count-1, nums, target) ?? -1
            }
        } else {
            return binarySearch(0, nums.count-1, nums, target) ?? -1
        }
    }
    
    func binarySearch(_ left: Int, _ right: Int, _ nums: [Int], _ target: Int) -> Int? {
        print("binarySearch(\(left), \(right))")
        guard left <= right else { return nil }
        let mid = left + ((right - left) / 2)
        if nums[mid] == target { return mid }
        else if nums[mid] < target { return binarySearch(mid+1, right, nums, target) }
        else { return binarySearch(left, mid-1, nums, target) }
    }
    
    func findPivot(_ left: Int, _ right: Int, nums: [Int]) -> Int? {
        print("findPivot(\(left),\(right))")
        if left == right { return left }
        guard left < right else { return nil }
        guard nums[left] > nums[right] else { return left }
        
        let mid = left + ((right-left) / 2)
        if nums[mid] >= nums[left] {
            return findPivot(mid+1, right, nums: nums)
        } else {
            return findPivot(left, mid, nums: nums)
        }
    }
}
