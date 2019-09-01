//
//  Roadster.swift
//  Spacedia
//
//  Created by Роман Важник on 31/08/2019.
//  Copyright © 2019 Александр Б. All rights reserved.
//

import Foundation

struct Roadster: Decodable {
    let name: String
    let launchDateUnix: Int
    let launchMassKg: Int
    let periodDays: Double
    let speedKph: Double
    let earthDistanceKm: Double
    let marsDistanceKm: Double
    let flickrImages: [String?]
    let wikipedia: String
    let details: String
    
    func getDataInString() -> String {
        let date = Date()
        return date.getDataInStringFromUnix(date: launchDateUnix)
    }
}
