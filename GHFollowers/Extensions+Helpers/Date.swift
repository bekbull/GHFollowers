//
//  Date.swift
//  GHFollowers
//
//  Created by Bekbol Bolatov on 22.07.2023.
//

import Foundation

extension Date {
    func convertToMonthDayYearFormat() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM d, yyyy"
        
        return dateFormatter.string(from: self)
    }
}
