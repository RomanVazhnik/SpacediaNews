//
//  Flight.swift
//  Spacedia
//
//  Created by Роман Важник on 30/08/2019.
//  Copyright © 2019 Александр Б. All rights reserved.
//

import Foundation

struct Flight: Codable {
    let flightNumber: Int?
    let missionName: String?
    let launchDateUnix: Int?
    let rocket: Rocket?
    let links: Links?
    let details: String?
}
