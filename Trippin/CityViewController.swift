//
//  CityViewController.swift
//  Trippin
//
//  Created by Luiz Santos on 7/29/18.
//  Copyright © 2018 Luiz Santos. All rights reserved.
//

import UIKit

class CityViewController: UIViewController {
    
    var thisCity = City()
    
    @IBOutlet weak var picturesFrame: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBAction func whatToDoButton(_ sender: UIButton) {
    }
    
    @IBAction func whereToStayButton(_ sender: UIButton) {
    }
    
    override func viewDidLoad() {
        animatePics()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationItem.title = thisCity.Name
    }
    
    func animatePics() {
        picturesFrame.animationImages = thisCity.pictures
        picturesFrame.animationDuration = TimeInterval(thisCity.picturesCount*3)
        picturesFrame.startAnimating()
    }
    
}
