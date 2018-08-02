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
    
    override func viewDidLoad() {
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationItem.title = thisCity.Name
    }
    
}
