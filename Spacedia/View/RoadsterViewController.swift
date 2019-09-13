//
//  RoadsterViewController.swift
//  Spacedia
//
//  Created by Роман Важник on 31/08/2019.
//  Copyright © 2019 Александр Б. All rights reserved.
//

import UIKit

class RoadsterViewController: UIViewController {
    
    @IBOutlet var imageActivityIndicator: UIActivityIndicatorView!
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    
    @IBOutlet var launchMass: UILabel!
    @IBOutlet var periodDay: UILabel!
    @IBOutlet var speed: UILabel!
    @IBOutlet var earthDistance: UILabel!
    @IBOutlet var marsDistance: UILabel!
    
    @IBOutlet var imageRoadsterOne: ImageView!

    @IBOutlet var detailLabel: UILabel!
    
    var roadster: Roadster!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageActivityIndicator.startAnimating()
        imageActivityIndicator.hidesWhenStopped = true
        
        NetworkManager.shared.getRoadster(for: "https://api.spacexdata.com/v3/roadster") { (roadster) in
            if let roadster = roadster {
                self.roadster = roadster
                self.setupLabels()
                self.setupImages()
            }
        }
        self.navigationItem.title = "Tesla Roadster"
    }
    
    private func setupLabels() {
        nameLabel.text = roadster.name
        dateLabel.text = roadster.getDataInString()
        launchMass.text = String(roadster.launchMassKg)
        periodDay.text = String(format: "%.0f", roadster.periodDays)
        speed.text = String(format: "%.0f", roadster.speedKph)
        earthDistance.text = String(format: "%.0f", roadster.earthDistanceKm)
        marsDistance.text = String(format: "%.0f", roadster.marsDistanceKm)
        detailLabel.text = roadster?.details
    }
    
    private func setupImages() {
        if let imageURL = roadster?.flickrImages[0] {
            imageRoadsterOne.fetchImage(with: imageURL)
            self.imageActivityIndicator.stopAnimating()
        }
    }
    
}
