//
//  Numbers.swift
//  Experiment
//
//  Created by Abdullah on 17/05/2022.
//

import Foundation

let inputNumber = 400

let dividedNumber: Float = Float(inputNumber) / 1000.0

func formatNumber() {
    if dividedNumber.rounded(.up) == dividedNumber.rounded(.down){
        //number is integer
        let end: Int = Int(dividedNumber.rounded(.down) * 1000)
        let start: Int = end - 1000
        print("Range is integer : ", (start + 1)...end)
        
    } else {
        //number is not integer
        let start: Int = Int(dividedNumber.rounded(.down) * 1000)
        let end: Int = Int(start + 1000)
        print("Range is not integer : ", (start + 1)...end )
    }
}

extension Formatter {
    static let withSeparator: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.groupingSeparator = ","
        return formatter
    }()
}

extension Numeric {
    var formattedWithSeparator: String { Formatter.withSeparator.string(for: self) ?? "" }
}


