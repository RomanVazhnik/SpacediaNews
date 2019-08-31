//
//  LauncheDetailsViewController.swift
//  Spacedia
//
//  Created by Bogdan Baskakov on 31/08/2019.
//  Copyright © 2019 Александр Б. All rights reserved.
//

import UIKit

class LauncheDetailsViewController: UIViewController {
    
    @IBOutlet var missionPatch: UIImageView!
    @IBOutlet var missionName: UILabel!
    @IBOutlet var missionDate: UILabel!
    
    @IBOutlet var rocketName: UILabel!
    @IBOutlet var rocketImage: UIImageView!
    @IBOutlet var rocketType: UILabel!
    
    @IBOutlet var details: UILabel!
    
    var flight: Flight!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupImages()
        setupLabels()
        
    }
    
    private func setupImages() {
        missionPatch.image = NetworkManager.shared.checkImage(link: flight.links)
        //TODO найти картинку ракеты на случай если её нет в картинках
        rocketImage.image = UIImage(named: flight.rocket?.rocketName ?? "")
    }
    
    private func setupLabels() {
        missionName.text = flight.missionName ?? "Не известно"
        missionDate.text = flight.getDataInString()
        rocketName.text = flight.rocket?.rocketName
        rocketType.text = flight.rocket?.rocketType
    }

}
