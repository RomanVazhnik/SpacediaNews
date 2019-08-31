//
//  Flight.swift
//  Spacedia
//
//  Created by Роман Важник on 30/08/2019.
//  Copyright © 2019 Александр Б. All rights reserved.
//

import Foundation

struct Launch: Codable {
    let flightNumber: Int?
    let missionName: String?
    let launchDateUnix: Int?
    let rocket: Rocket?
    let links: Links?
    let details: String?
    
    func getDataInString() -> String {
        if let resultDate = launchDateUnix {
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
