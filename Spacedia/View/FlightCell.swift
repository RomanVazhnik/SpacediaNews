//
//  FlightCell.swift
//  Spacedia
//
//  Created by Bogdan Baskakov on 30/08/2019.
//  Copyright © 2019 Александр Б. All rights reserved.
//

import UIKit

class FlightCell: UITableViewCell {
    
    @IBOutlet var flightNumber: UILabel!
    @IBOutlet var missionName: UILabel!
    @IBOutlet var flightDate: UILabel!
    @IBOutlet var flightImage: UIImageView!
    
    func configure(with flight: Flight) {
        
        flightNumber.text = "\(flight.flightNumber ?? 0)"
        missionName.text = flight.missionName ?? "Имя не найдено"
        flightDate.text = "\(flight.launchDateUnix ?? 0)"
//        flightImage.image = #imageLiteral(resourceName: "default")
    }
}
