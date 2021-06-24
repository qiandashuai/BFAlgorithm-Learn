//
//  BFFind.swift
//  BFAlgorithm
//
//  Created by blackstone jericho on 2021/6/9.
//

import Foundation

/*
 查找
 */

/*
 二分查找
 */

func bindarySearch(_ s:[Int], _ find:Int) -> Int {
    guard s.count > 0 else {
        return -1
    }
    guard s[0] != find else {
        return 0
    }
    
    var result = 0
    var low = 0
    var hight = s.count - 1
    
    while low <= hight {
        let middle = low + (hight - low) / 2
        if s[middle] == find {
            result =  middle
            return result
        } else if (s[middle] < find) {
            low = middle + 1
        } else {
            hight = middle - 1
        }
    }
    
    return -1
}

/*
 找到第一个等于某值的数据
 */
func bindaryFirstSearch(_ s:[Int], _ find:Int) -> Int {
    guard s.count > 0 else {
        return -1
    }
    guard s[0] != find else {
        return 0
    }
    
    var low = 0
    var hight = s.count - 1
    
    while low <= hight {
        let middle = low + (hight - low) / 2
        if s[middle] == find {
            if middle == 0 || s[middle - 1] < find {
                return middle
            } else {
                hight = middle - 1
            }
        } else if (s[middle] < find) {
            low = middle + 1
        } else {
            hight = middle - 1
        }
    }
    
    
    return -1
}

/*
 找到最后一个等于某值的数据
 */
func bindaryMaxSearch(_ s:[Int], _ find:Int) -> Int {
    guard s.count > 0 else {
        return -1
    }
    guard s[0] != find else {
        return 0
    }
    
    var low = 0
    var hight = s.count - 1
    
    while low <= hight {
        let middle = low + (hight - low) / 2
        if s[middle] == find {
            if middle == 0 || s[middle + 1] > find {
                return middle
            } else {
                low = middle +  1
            }
        } else if (s[middle] < find) {
            low = middle + 1
        } else {
            hight = middle - 1
        }
    }
    
    return -1
}

/*
 找到第一个大于等于某值的
 */
func bindaryMaxEqualSearch(_ s:[Int], _ find:Int) -> Int {
    guard s.count > 0 else {
        return -1
    }
    guard s[0] != find else {
        return 0
    }
    
    var low = 0
    var hight = s.count - 1
    
    while low <= hight {
        let middle = low + (hight - low) / 2
        if s[middle] >= find {
            if middle == 0 || s[middle - 1] < find {
                return middle
            } else {
                hight = middle - 1
            }
        } else {
            low = middle + 1
        }
    }
    
    return -1
}


/*
 找到第一个小于等于
 */

func bindaryLessEqualSearch(_ s:[Int], _ find:Int) -> Int {
    guard s.count > 0 else {
        return -1
    }
    guard s[0] != find else {
        return 0
    }
    
    var low = 0
    var hight = s.count - 1
    
    while low <= hight {
        let middle = low + (hight - low) / 2
        if s[middle] <= find {
            if middle == 0 || s[middle + 1] > find {
                return middle
            } else {
                low = middle + 1
            }
        } else {
            hight = middle - 1
        }
    }
    
    return -1
}

/*
 35. Search Insert Position
 */

func searchInsert(_ nums: [Int], _ target: Int) -> Int {
    guard nums.count > 0 else {
        return 0
    }
    
    guard target <= nums.last! else {
        return nums.count
    }
    
    guard target >= nums.first! else {
        return 0
    }
    
    var low = 0
    var high = nums.count - 1
    var result = 0
    while low <= high {
        let middle = low + (high - low) / 2
        print(middle)
        if nums[middle] >= target {
            if middle == 0 || nums[middle - 1] < target {
                result = middle
                break
            } else {
                high = middle - 1
            }
        } else {
            low = middle + 1
        }
    }
    return result
}

/*
 69. Sqrt(x)
 */

func mySqrt(_ x: Int) -> Int {
    
    guard x > 1 else {
        return x
    }
    
    var low = 0
    var high = x
    
    while low <= high {
        let middle = low + (high - low) / 2
        if middle * middle <= x {
            let lastMiddle = middle + 1
            if lastMiddle * lastMiddle > x {
                return middle
            } else {
                low = middle + 1
            }
        } else {
            high = middle - 1
        }
    }
    
    return -1
}

/*
 367. Valid Perfect Square
 */
func isPerfectSquare(_ num: Int) -> Bool {
    guard num > 1 else {
        return true
    }
    
    
    var low = 0
    var high = num
    
    while low <= high {
        let middle = low + (high - low) / 2
        let currentValue = middle * middle
        if currentValue == num {
            return true
        } else if currentValue < num {
            low = middle + 1
        } else {
            high = middle - 1
        }
    }
    
    return false
    
}

/*
 441. Arranging Coins
 */

func arrangeCoins(_ n: Int) -> Int {
    
    
    guard n > 1 else {
        return n
    }
    
    var low = 0
    var high = n
    
    while low <= high {
        let middle = low + (high - low) / 2
        let total = middle * (middle + 1) / 2
        if total <= n {
            if middle == 0 || (middle + 1) * (middle + 2) / 2 > n {
                return middle
            } else {
                low = middle + 1
            }
        } else {
            high = middle - 1
        }
    }
    return -1
}

/*
 744. Find Smallest Letter Greater Than Target
 */
func nextGreatestLetter(_ letters: [Character], _ target: Character) -> Character {
 guard letters.count > 0 else {
     return Character("a")
 }
 guard target < letters.last! else {
     return letters.first!
 }
 
 var low = 0
 var high = letters.count
 
 while low <= high {
     let middle = low + (high - low) / 2
     if letters[middle] > target {
         if middle == 0 || letters[middle - 1] <= target{
             return letters[middle]
         } else {
             high = middle -  1
         }
     } else {
         low = middle + 1
     }
 }
 return Character("a")
 }
/*
 704. Binary Search
 */

func search(_ nums: [Int], _ target: Int) -> Int {
    
    guard nums.count > 0 else {
        return -1
    }
    
    var low = 0
    var high = nums.count - 1
    
    while low <= high {
        let middle = low + (high - low) / 2
        
        if nums[middle] == target {
            return middle
        } else if (nums[middle] < target) {
            low = middle + 1
        } else {
            high = middle - 1
        }
    }
    
    return -1

}
/*
 852. Peak Index in a Mountain Array
 */
func peakIndexInMountainArray(_ arr: [Int]) -> Int {
    guard arr.count > 2 else {
        return -1
    }
    
    var low = 0
    var hight = arr.count - 1
    
    while low <= hight {
        let middle = low + (hight - low) / 2
        if arr[middle] > arr[middle + 1] && arr[middle] > arr[middle - 1] {
            return middle
        } else if arr[middle] < arr[middle + 1] {
            low = middle + 1
        } else if arr[middle] < arr[middle - 1] {
            hight = middle - 1
        }
    }
    
    return -1
}
