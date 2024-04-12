//
//  Leetcode.swift
//  Experiment
//
//  Created by Abdullah on 04/12/2021.
//

import Foundation

class StreamChecker {

    var words: [String]
    
    init(_ words: [String]) {
        self.words = words
    }
    
    func query(_ letter: Character) -> Bool {
        //words.contains(letter)
        return true
    }
    func evaluate(_ letters: String) -> Bool{
            if words.contains(letters) {
                return true
            }
            return false
        }
}

func flatMapSample() {
    var  dd = [[2,4], [4,5], [4,9]]
    dd = dd.flatMap { $0 }
    print(dd)
    let asd = dd[0][0]
    print(asd)
  
}

func findJudge2(_ n: Int, _ trust: [[Int]]) -> Int {
    var assumedJudges = Set<Int>()
    var index = 1
    let total = trust.count
    assumedJudges.insert(trust[0][1])
    while index < total {
        if assumedJudges.contains(trust[index][0]) {
            assumedJudges.remove(trust[index][0])
        }
        else {
            assumedJudges.insert(trust[index][1])
        }
        print(assumedJudges)
        index+=1
    }
    
    return assumedJudges.count > 0 ? assumedJudges.removeFirst() : -1
}

func findJudge(_ n: Int, _ trust: [[Int]]) -> Int {
    var netTrustGains: [Int] = Array(repeating:0, count:n+1)
    for arr in trust {
        netTrustGains[arr[0]]-=1
        netTrustGains[arr[1]]+=1
    }
    var judge = -1
    var index = 1
    while index <= n {
        if netTrustGains[index] == n-1 {
            judge = index
        }
        index+=1
    }
    return judge
}


func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
    var dict = [Int: Int]()
    var index = 0
    var res = [Int]()
    
    while index < nums.count {
        let targetMinusElement = target - nums[index]
        if dict.keys.contains(targetMinusElement) {
            res.append(dict[targetMinusElement]!)
            res.append(index)
            break
        }
        else {
            dict[nums[index]] = index
        }
        index+=1
    }
    return res
}

func twoSum2(_ nums: [Int], _ target: Int) -> [Int] {
      var dict: [Int: Int] = [:]
      for (index, _) in nums.enumerated() {
          let num = nums[index]
          let complementNum = target - nums[index]
          if dict[num] != nil {
              return [dict[num]!, index]
          }
          else {
              dict[complementNum] = index
          }
      }
      return []
  }

func numPairsDivisibleBy60(_ time: [Int]) -> Int {
        var dict = [Int: Int]()
        var index = 0
        var result = 0
        while index < time.count {
            let rem = time[index] % 60
            let sixtyMinusRem = 60 - (rem)
            let checkable = sixtyMinusRem == 60 ? 0 : sixtyMinusRem
            if dict.keys.contains(checkable) {
                result = result + dict[checkable]!
            }
            if dict.keys.contains(rem) {
                dict[rem]!+=1
            }
            else {
                dict[rem] = 1
            }
            index+=1
        }
        return result
    }

func maxCoins(_ nums: [Int]) -> Int {
        var ballons = nums
        var total = ballons.count
        var res = 0
        while total > 0 {
            let index = total%2 == 0 ? (total/2)-1 : total/2
            let prevEl = index-1 >= 0 && index-1 < total ? ballons[index-1] : 1
            let afterEl = index+1 < total ? ballons[index+1] : 1
            res = res + (prevEl*ballons[index]*afterEl)
            _ = ballons.remove(at: index)
            total = ballons.count
        }
        return res
    }

//Follow up: Could you solve it without converting the integer to a string?
func isPalindrome(_ x: Int) -> Bool {
    var num = x
    var reverse = 0

    while num > 0 {
        reverse = reverse * 10
        reverse = reverse +  (num%10)
        num = num / 10
    }
    
    return x == reverse ? true : false
}

func longestValidParentheses(_ s: String) -> Int {
        if s.count < 2 {
            return 0
        }

        // DP[i]：以s[i]为结尾的longest valid parentheses substring的长度
        var dp = [Int](repeating: 0, count: s.count)
        var length = 0

        let characters = Array(s)
        for i in 1..<s.count {
            let j = i - 1 - dp[i - 1]
            if j >= 0 && characters[j] == "(" && characters[i] == ")" {
                dp[i] = dp[i - 1] + 2
                if j > 0 {
                    dp[i] += dp[j - 1]
                }
                length = max(length, dp[i])
            }
        }

        return length
    }

//func longestValidParentheses2(_ s: String) -> Int {
//        var maxi = 0
//        var stack = [Int]()
//        var characters = Array(s)
//
//
//    var dd = stack.firstIndex(of: <#T##Int#>)
//        stack.append(-1)
//        for index in 0..<characters.count{
//            let char = characters[index]
//
//            if char == "(" {
//                stack.append(index)
//            }
//            else {
//                stack.removeLast()
//                if stack.isEmpty {
//                    stack.append(index)
//                }
//                else {
//                    let len = index - stack.last!
//                    maxi = max(len, maxi)
//                }
//            }
//        }
//        return maxi
//    }


func loopWithSort(time: String) {
    //e.g 17:38 ans => 1378
    var timeDigits: [Int] = []
    for el in time {
        if el.isNumber {
            if timeDigits.last != nil {
                let last = String(timeDigits.last!)
                if last < String(el) {
                    timeDigits.append(Int(String(el))!)
                }
                else {
                    timeDigits.removeLast()
                    timeDigits.append(Int(String(el))!)
                    timeDigits.append(Int(last)!)
                }
            }
            else {
                timeDigits.append(Int(String(el))!)
            }
        }
    }
}

func reduceWithSort(time: String) -> [Int]{
    //e.g 17:38 ans => 1378
    time.reduce(into: [Int]()) { curr, next in
        if next.isNumber {
            if curr.last != nil {
                let last = String(curr.last!)
                if last < String(next) {
                    curr.append(Int(String(next))!)
                }
                else {
                    curr.removeLast()
                    curr.append(Int(String(next))!)
                    curr.append(Int(last)!)
                }
            }
            else {
                curr.append(Int(String(next))!)
            }
        }
    }
}


/**
 Find the closest time
 next closest time
 */
//_ = nextClosestTime("17:38")
func nextClosestTime(_ time: String) -> String {
    /**
     time is in HH:MM
     where first H => H1 , H1 (0, 1)
     where second H => H2, if H1 = 2 then H2 range is (0, 5)
     if H1 == 0 or 1, then H2 bound range is (0. 9)
     where first M=> M1, M1 bound is (0,5)
     where second M => M2, M2 bound is (0, 9)
     
     Note: whenever there is a turnover you need to get the nearest digit for the next digit i.e if M2 has a turnover it implies that you need to get the nearest digigt for M1 else M1 will not nothing change. samething applies to H.
     */
    var nearestSecondDigitMinuteTuple: (Int,Bool)
    var nearestFirstDigitMinuteTuple: (Int,Bool) = (0, false)
    var nearestSecondDigitHourTuple: (Int,Bool) = (0, false)
    
    var result = ""
    var timeString = time.replacingOccurrences(of: ":", with: "")
    let digits = timeString.reduce(into: [Int]()){$0.append(Int(String($1))!)}
  
    let secondMinuteDigit = Int(String(timeString.removeLast()))!
    
    let firstMinuteDigit = Int(String(timeString.removeLast()))!

    
    nearestSecondDigitMinuteTuple = getNearestDigits(num: secondMinuteDigit, nums: digits, upperBound: 10)
    
    if nearestSecondDigitMinuteTuple.1 {
        result = result + String(nearestSecondDigitMinuteTuple.0)
        nearestFirstDigitMinuteTuple = getNearestDigits(num: firstMinuteDigit, nums: digits, upperBound: 5)
        result = ":" + String(nearestFirstDigitMinuteTuple.0) + result
    }
    else {
        result = result + String(nearestSecondDigitMinuteTuple.0)
        result = ":" + String(firstMinuteDigit) + result
    }
    
    let secondHourDigit = Int(String(timeString.removeLast()))!
    
    let firstHourDigit = Int(String(timeString.removeLast()))!
    
    if nearestFirstDigitMinuteTuple.1 {
        
        nearestSecondDigitHourTuple = getNearestDigits(num: secondHourDigit, nums: digits, upperBound: firstHourDigit == 2 ? 5 : 9)
        result = String(nearestSecondDigitHourTuple.0) + result
        result = String(firstHourDigit) + result
    }
    else {
        result = String(secondHourDigit) + result
        result = String(firstHourDigit) + result
    }
    
    print(result)
    return ""
}

func getNearestDigits(num: Int, nums: [Int], upperBound: Int) -> (Int, Bool){
    var newNum = num
    var hasTurnOver = false
    
    if newNum == upperBound {
        hasTurnOver = true
        newNum = 0
        if nums.contains(newNum) {
            return (newNum, hasTurnOver)
        }
    }
    newNum = newNum + 1
    
    while true {
        if newNum == upperBound {
            newNum = 0
            hasTurnOver = true
        }
        if nums.contains(newNum) {
            break
        }
        newNum = newNum  + 1
    }
    return (newNum, hasTurnOver)
}


func frequencySort(_ s: String) -> String {
    var output: String = ""
    let charsDict = s.reduce(into: [Character: Int]()) {
        curr, next in
        curr[next] = curr[next] != nil ? curr[next]! + 1 : 1
    }

    let sortedChars = charsDict.sorted(by: { $0.value > $1.value})

    for (key, value) in sortedChars {
        output = output + String(repeating: key, count: value)
    }

    return output
    
}

func numberOfCommonFactors() {
    var nums = readLine()!.split(separator: " ")
    let firstNum = Int(nums.first!)!
    let secondNum = Int(nums.last!)!
    var num = 1
    var countFactors = 0
    let minNum = min(firstNum, secondNum)
    while num <= minNum {
        if firstNum % num == 0 && secondNum % num == 0 {
            countFactors = countFactors + 1
        }
        num = num + 1
    }
    print(countFactors)
}

func averageTotalRevenue(input: [String]) -> [String]{
    let listOfNumberOfRides = ["1,Sedan,200", "2,Sedan,300", "4,WEHS,200", "5,DAN,500"]
    
    var result: [String: String] = [:]
    var resultString: [String] = []
    
    for (_, el) in listOfNumberOfRides.enumerated() {
        let splittedList = el.split(separator: ",")
        let nameOfRide = String(splittedList[1])
        let amount = Int(splittedList[2])!
        
        if (result[nameOfRide] != nil) {
            let prevAmount = Int(result[nameOfRide]!)!
            let newAmount = prevAmount + amount
            result[nameOfRide] = String(newAmount)
        }
        else {
            result[nameOfRide] = String(amount)
        }
    }
 
    let newRes = result.sorted{$0.key < $1.key}
    for (key, value) in newRes {
        var resString = ""
        resString = key + "," + value
        resultString.append(resString)
    }

    return resultString
}

func runLeetCode() {
    _ = averageTotalRevenue(input: [])
}

