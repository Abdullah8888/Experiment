//
//  Date+Extensions.swift
//  Experiment
//
//  Created by Abdullah on 24/02/2022.
//

import Foundation

func showCurrentDate() -> String {
    let date = Date()
    
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "d'\(date.daySuffix)' MMMM, yyyy"

    let day = dateFormatter.string(from: date)
    return day
}

extension Date {
    var daySuffix: String {
        switch Calendar.current.component(.day, from: self) {
            case 1, 21, 31: return "st"
            case 2, 22: return "nd"
            case 3, 23: return "rd"
            default: return "th"
        }
    }
    
    static var now: String {
        let date = Date()
        let dateformatter = DateFormatter()
        dateformatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        return dateformatter.string(from: date)
    }
}

func setCurrentDate() -> String {
    let date = Date()

    // Use this to add st, nd, th, to the day
    let numberFormatter = NumberFormatter()
    numberFormatter.numberStyle = .ordinal
    numberFormatter.locale = Locale.current

    //Set other sections as preferred
    let monthFormatter = DateFormatter()
    monthFormatter.dateFormat = "MMMM, yyyy"

    // Works well for adding suffix
    let dayFormatter = DateFormatter()
    dayFormatter.dateFormat = "dd"

    let dayString = dayFormatter.string(from: date)
    let monthString = monthFormatter.string(from: date)


    // Add the suffix to the day
    print(dayString)
    let dayNumber = NSNumber(value: Int(dayString)!)
    let day = numberFormatter.string(from: dayNumber)!

    return "\(day) \(monthString)"
}
