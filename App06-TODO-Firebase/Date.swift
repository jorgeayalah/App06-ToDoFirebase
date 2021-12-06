//
//  Date.swift
//  App06-TODO-Firebase
//
//  Created by alumno on 04/12/21.
//

import Foundation

extension Date {

    static func - (lhs: Date, rhs: Date) -> TimeInterval {
        return lhs.timeIntervalSinceReferenceDate - rhs.timeIntervalSinceReferenceDate
    }

}
