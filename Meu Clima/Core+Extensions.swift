//
//  Core+Extensions.swift
//  Meu Clima
//
//  Created by Jobson Batista on 10/15/24.
//

import Foundation

extension Int {
    func toWeekdayName() -> String {
        let date = Date(timeIntervalSince1970: TimeInterval(self))
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EE" // "EE" represents the full weekday name
        let dateFomatted = dateFormatter.string(from: date)
        
        return formatWeekDayToPortuguese(weekday: dateFomatted)
    }
    
    func formatWeekDayToPortuguese(weekday: String?) -> String {
        if weekday?.uppercased() == "MON" {
            return "SEG"
        } else if weekday?.uppercased() == "TUE" {
            return "TER"
        } else if weekday?.uppercased() == "WED" {
            return "QUA"
        } else if weekday?.uppercased() == "THU" {
            return "QUI"
        } else if weekday?.uppercased() == "FRI" {
            return "SEX"
        } else if weekday?.uppercased() == "SAT" {
            return "SÁB"
        } else {
            return "DOM"
        }
    }
    
    func toHourFormat() -> String {
        let date = Date(timeIntervalSince1970: TimeInterval(self))
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm" // "HH:mm" represents the 24-hour format
        
        return dateFormatter.string(from: date)
    }
    
    func isDayTime() -> Bool {
        let date = Date(timeIntervalSince1970: TimeInterval(self))
        let hour = Calendar.current.component(.hour, from: date)
        
        let dayStartHour = 6
        let dayEndHour = 18
        
        return hour >= dayStartHour && hour < dayEndHour
    }
}

extension Double {
    func toCelsius () -> String {
        return "\(Int(self))°C"
    }
}
