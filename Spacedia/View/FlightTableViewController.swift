//
//  FlightTableViewController.swift
//  Spacedia
//
//  Created by Bogdan Baskakov on 30/08/2019.
//  Copyright © 2019 Александр Б. All rights reserved.
//

import UIKit

class LaunchesUIViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var filterDateView: UIView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var viewForHideFilterDateView: UIView!
    
    var flights: [Flight] = []
    
    var bottomSafeArea: CGFloat {
        if #available(iOS 11.0, *) {
            return self.view.safeAreaInsets.bottom
        } else {
            return 0
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        NetworkManager.shared.fetchData(for: "https://api.spacexdata.com/v3/launches/") { (flights) in
            if let flights = flights {
                self.flights = flights
                self.tableView.reloadData()
            }
        }
    }
    
    @IBAction func hideFilterDateViewButton(_ sender: Any) {
        showAndHideFilterDateView()
    }
    
    func showAndHideFilterDateView() {
        
        UIView.animate(withDuration: 0.3, animations: {
            if self.filterDateView.frame.origin.y == self.view.frame.height {
                self.filterDateView.frame.origin.y -= self.filterDateView.frame.height + self.bottomSafeArea
                
                self.viewForHideFilterDateView.isHidden = !(self.viewForHideFilterDateView.isHidden)
                self.viewForHideFilterDateView.alpha = self.viewForHideFilterDateView.alpha == 0 ? 0.5 : 0
            } else {
                self.filterDateView.frame.origin.y += self.filterDateView.frame.height + self.bottomSafeArea
                
                self.viewForHideFilterDateView.isHidden = !(self.viewForHideFilterDateView.isHidden)
                self.viewForHideFilterDateView.alpha = self.viewForHideFilterDateView.alpha == 0 ? 0.5 : 0
            }
            
        })
    }

}
