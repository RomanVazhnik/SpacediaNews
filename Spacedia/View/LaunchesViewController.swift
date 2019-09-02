//
//  FlightTableViewController.swift
//  Spacedia
//
//  Created by Bogdan Baskakov on 30/08/2019.
//  Copyright © 2019 Александр Б. All rights reserved.
//

import UIKit

class LaunchesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var filterDateView: UIView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var viewForHideFilterDateView: UIView!
    
    @IBOutlet weak var sliderFromDate: UISlider!
    @IBOutlet weak var sliderToDate: UISlider!
    
    @IBOutlet weak var fromDateCurrentLabel: UILabel!
    @IBOutlet weak var toDateCurrentLabel: UILabel!
    
    @IBOutlet weak var fromDateLeftUpLabel: UILabel!
    @IBOutlet weak var fromDateLeftDownLabel: UILabel!
    
    @IBOutlet weak var toDateRightUpLabel: UILabel!
    @IBOutlet weak var toDateRightDownLabel: UILabel!
    
    var launches: [Launch] = []
    
    var minDateJson = ""
    var maxDateJson = ""
    
    let url = "https://api.spacexdata.com/v3/launches/"
    
    var bottomSafeArea: CGFloat {
        if #available(iOS 11.0, *) {
            return self.view.safeAreaInsets.bottom
        } else {
            return 0
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NetworkManager.shared.fetchData(for: url) { (launch) in
            if let launches = launch {
                self.launches = launches
                self.setDateForDateFilter()
                self.tableView.reloadData()
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return launches.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FlightCell", for: indexPath) as! FlightCell
        
        let flight = launches[indexPath.row]
        cell.configure(with: flight)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    @IBAction func hideFilterDateViewButton(_ sender: Any) {
        showAndHideFilterDateView()
    }
    
    
    @IBAction func filterFromDateSliderAction(_ sender: UISlider) {
        changeFromAndToLabelText(valueFrom: sliderFromDate.value, valueTo: sliderToDate.value)
        
        if sliderFromDate.value >= sliderToDate.value {
            sliderToDate.value = sliderFromDate.value
        }
    }
    
    @IBAction func filterFromDateSliderTouchUpAction(_ sender: UISlider) {
        let toDate = String(format: "%2.f", sliderToDate.value)
        let newDate = String(format: "%2.f", sender.value)
        let newUrl = "\(url)?start=\(newDate)-01-01&end=\(toDate)-12-31"
        
        NetworkManager.shared.fetchData(for: newUrl) { (launch) in
            if let launches = launch {
                self.launches = launches
                
                self.tableView.reloadData()
            }
        }
    }
    
    
    @IBAction func filterToDateSliderTouchUpAction(_ sender: UISlider) {
        let fromDate = String(format: "%2.f", sliderFromDate.value)
        let newDate = String(format: "%2.f", sender.value)
        let newUrl = "\(url)?start=\(fromDate)-01-01&end=\(newDate)-12-31"
        
        NetworkManager.shared.fetchData(for: newUrl) { (launch) in
            if let launches = launch {
                self.launches = launches
                
                self.tableView.reloadData()
            }
        }
    }
    
    @IBAction func filterToDateSliderAction(_ sender: UISlider) {
        changeFromAndToLabelText(valueFrom: sliderFromDate.value, valueTo: sliderToDate.value)
        
        if sliderToDate.value <= sliderFromDate.value  {
            sliderFromDate.value = sliderToDate.value
        }
    }
    
    
    
    private func dateFilter(fromDate: Float, toDate: Float) {
        
        
        
        
    }
    
    private func setDateForDateFilter() {
        if let firstDate = launches.first?.launchDateUnix, let lastDate = launches.last?.launchDateUnix {
            let firstDate = Date(timeIntervalSince1970: TimeInterval(firstDate))
            let lastDate = Date(timeIntervalSince1970: TimeInterval(lastDate))
            
            let formatter = DateFormatter()
            formatter.dateFormat = "YYYY"
            
            fromDateLeftUpLabel.text = formatter.string(from: firstDate)
            fromDateLeftDownLabel.text = formatter.string(from: firstDate)
            
            
            toDateRightUpLabel.text = formatter.string(from: lastDate)
            toDateRightDownLabel.text = formatter.string(from: lastDate)
            
            
            
            sliderFromDate.minimumValue = Float(formatter.string(from: firstDate))!
            sliderFromDate.maximumValue = Float(formatter.string(from: lastDate))!
            
            sliderToDate.minimumValue = Float(formatter.string(from: firstDate))!
            sliderToDate.maximumValue = Float(formatter.string(from: lastDate))!
            
            
            sliderFromDate.value = Float(formatter.string(from: firstDate))!
            sliderToDate.value = Float(formatter.string(from: lastDate))!
            
            changeFromAndToLabelText(valueFrom: sliderFromDate.value, valueTo: sliderToDate.value)
            
            minDateJson = formatter.string(from: firstDate)
            maxDateJson = formatter.string(from: lastDate)
        }
    }
    
    private func changeFromAndToLabelText(valueFrom: Float, valueTo: Float) {
        fromDateCurrentLabel.text = "From: " + String(format: "%.0f", valueFrom) + " year"
        toDateCurrentLabel.text = "To: " + String(format: "%.0f", valueTo) + " year"
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
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let indexPath = tableView.indexPathForSelectedRow {
            let detailVC = segue.destination as! LaunchDetailViewController
            detailVC.flight = launches[indexPath.row]
            detailVC.navigationItem.title = launches[indexPath.row].missionName
        }
    }
    
}
