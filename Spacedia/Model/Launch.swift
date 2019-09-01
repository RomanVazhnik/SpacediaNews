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
        let date = Date()
        return date.getDataInStringFromUnix(date: launchDateUnix)
    }
}
