//
//  LauncheDetailsViewController.swift
//  Spacedia
//
//  Created by Bogdan Baskakov on 31/08/2019.
//  Copyright © 2019 Александр Б. All rights reserved.
//

import UIKit

class LaunchDetailViewController: UIViewController {
    
    @IBOutlet var missionPatch: ImageView!
    @IBOutlet var missionName: UILabel!
    @IBOutlet var missionDate: UILabel!
    
    @IBOutlet var rocketName: UILabel!
    @IBOutlet var rocketImage: UIImageView!
    @IBOutlet var rocketType: UILabel!
    
    @IBOutlet var details: UILabel!
    
    var flight: Launch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupImages()
        setupLabels()
        
    }
    
    @IBAction func wikiButtonPressed() {
        if let wikiLink = flight.links?.wikipedia, let url = URL(string: wikiLink) {
            performSegue(withIdentifier: "segueToWebView", sender: url)
        }
    }
    
    private func setupImages() {
        guard let links = flight.links, let url = links.missionPatchSmall else {
            missionPatch.image = #imageLiteral(resourceName: "default")
            return
        }
        missionPatch.fetchImage(with: url)
        //TODO найти картинку ракеты на случай если её нет в картинках
        if let rocketName = flight.rocket?.rocketName {
            rocketImage.image = UIImage(named: rocketName)
            return
        }
        rocketImage.image = UIImage(named: "")
    }
    
    private func setupLabels() {
        missionName.text = flight.missionName ?? "Не известно"
        missionDate.text = flight.getDataInString()
        rocketName.text = "Name: \(flight.rocket?.rocketName ?? "Не известно")"
        rocketType.text = "Type: \(flight.rocket?.rocketType ?? "Не известно")"
        details.text = flight.details
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let url = sender as? URL {
            let vc = segue.destination as! WebViewController
            vc.url = url
        }
    }

}
