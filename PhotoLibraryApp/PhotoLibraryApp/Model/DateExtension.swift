//
//  DateExtension.swift
//  PhotoLibraryApp
//
//  Created by Jun Ho JANG on 2021/03/24.
//

import Foundation

extension Date {
    func stringToDate(date: String) -> Date {
        let dateFormat = DateFormatter()
        dateFormat.dateFormat = "yyyyMMdd"
        var targetDate = Date()
        if let someDate = dateFormat.date(from: date) {
            targetDate = someDate
        }
        return targetDate
    }
}
