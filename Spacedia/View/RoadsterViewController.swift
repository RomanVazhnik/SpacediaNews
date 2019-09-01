//
//  RoadsterViewController.swift
//  Spacedia
//
//  Created by Роман Важник on 31/08/2019.
//  Copyright © 2019 Александр Б. All rights reserved.
//

import UIKit

class RoadsterViewController: UIViewController {
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    
    @IBOutlet var launchMass: UILabel!
    @IBOutlet var periodDay: UILabel!
    @IBOutlet var speed: UILabel!
    @IBOutlet var earthDistance: UILabel!
    @IBOutlet var marsDistance: UILabel!
    
    @IBOutlet var imageRoadsterOne: ImageView!
    @IBOutlet var imageRoadsterTwo: ImageView!
    @IBOutlet var imageRoadsterThree: ImageView!
    @IBOutlet var imageRoadsterFour: ImageView!

    @IBOutlet var detailLabel: UILabel!
    @IBOutlet var wikiUrl: UILabel!
    
    var roadster: Roadster!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NetworkManager.shared.getRoadster(for: "https://api.spacexdata.com/v3/roadster") { (roadster) in
            if let roadster = roadster {
                self.roadster = roadster
            }
        }
        setupLabels()
        setupImages()
    }
    
    private func setupLabels() {
        nameLabel.text = roadster.name
        dateLabel.text = roadster.getDataInString()
        launchMass.text = String(roadster.launchMassKg)
        periodDay.text = String(roadster.periodDays)
        speed.text = String(roadster.speedKph)
        earthDistance.text = String(roadster.earthDistanceKm)
        marsDistance.text = String(roadster.marsDistanceKm)
        detailLabel.text = roadster.details
        wikiUrl.text = roadster.wikipedia
    }
    
    private func setupImages() {
        if let imageURL = roadster.flickrImages[0] {
            imageRoadsterOne.fetchImage(with: imageURL)
        }
        if let imageURL = roadster.flickrImages[1] {
            imageRoadsterTwo.fetchImage(with: imageURL)
        }
        if let imageURL = roadster.flickrImages[2] {
            imageRoadsterThree.fetchImage(with: imageURL)
        }
        if let imageURL = roadster.flickrImages[3] {
            imageRoadsterFour.fetchImage(with: imageURL)
        }
    }

}
