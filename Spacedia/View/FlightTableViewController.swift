//
//  FlightTableViewController.swift
//  Spacedia
//
//  Created by Bogdan Baskakov on 30/08/2019.
//  Copyright © 2019 Александр Б. All rights reserved.
//

import UIKit

class FlightTableViewController: UITableViewController {

    var flights: [Flight] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NetworkingManager.fetchData(for: "https://api.spacexdata.com/v3/launches/") { (flights) in
            if let flights = flights {
                self.flights = flights
            }
        }
    }

}
