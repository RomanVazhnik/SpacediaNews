//
//  Extension+Date.swift
//  Spacedia
//
//  Created by Роман Важник on 01/09/2019.
//  Copyright © 2019 Александр Б. All rights reserved.
//

import UIKit

extension Date {
    func getDataInStringFromUnix(date: Int?) -> String {
        if let resultDate = date {
            let date = Date(timeIntervalSince1970: Double(resultDate))
            let dateFormatter = DateFormatter()
            dateFormatter.timeStyle = .medium
            dateFormatter.dateStyle = .medium
            dateFormatter.timeZone = .current
            let result = dateFormatter.string(from: date)
            return result
        }
        return "неизвестно"
    }
}
