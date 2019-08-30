//
//  extension + FlightTableViewController .swift
//  Spacedia
//
//  Created by Роман Важник on 30/08/2019.
//  Copyright © 2019 Александр Б. All rights reserved.
//

import UIKit

//DataSourceProtocol
extension FlightUIViewController {
    
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return flights.count
    }
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FlightCell", for: indexPath) as! FlightCell
        
        let flight = flights[indexPath.row]
        cell.configure(with: flight)

        return cell
    }
    
}
