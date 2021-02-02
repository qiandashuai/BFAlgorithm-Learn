//
//  array.swift
//  
//
//  Created by blackstone jericho on 2021/2/2.
//

import Foundation

// 283 move-zero
func moveZero(_ numers: inout [Int]) -> [Int] {
    if numers.count < 2 {
        return numers
    }
    
    var zeroIndex = 0
    
    for index in (0..<numers.count) {
        if numers[index] != 0 {
            numers.swapAt(zeroIndex, index)
            zeroIndex = zeroIndex + 1;
        }
    }
    return numers
}

// 11. Container With Most Water
// 1. 暴力法: 枚举左柱子

func MaxArea(_ height: [Int]) -> Int {
    
    var resultArray:[Int] = [Int]()
    
    
    for i in 0 ..< height.count - 1 {
        var maxArea = 0
        for j in (i + 1) ..< height.count {
            maxArea = max(maxArea, (j - i ) * min(height[i], height[j]))
            resultArray.append(maxArea);
        }
    }
    
    
    return resultArray.max()!
}

let maxArea =  MaxArea([4,3,2,1,4])
//print(maxArea)

// 2. 双指针解法

func MaxArea2(_ heights: [Int]) -> Int {
    if heights.count < 1 {
        return 0
    }
    
    if heights.count == 2 {
        return min(heights.first!, heights.last!)
    }
    
    var maxWater = (heights.count - 1) * min(heights[0], heights.last!)
    var right = heights.count - 1
    var left = 0
    for _ in 0..<heights.count {
        if left == right {
            break
        }
        if heights[left] < heights[right] {
            left = left + 1
        } else {
            right = right - 1
        }
        maxWater = max(maxWater, (right - left ) * min(heights[left], heights[right]) )
    }
    return maxWater
    
}

let maxArea2 =  MaxArea2([2,3,4,5,18,17,6])
print(maxArea2)
