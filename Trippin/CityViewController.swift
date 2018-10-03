//
//  CityViewController.swift
//  Trippin
//
//  Created by Luiz Santos on 7/29/18.
//  Copyright © 2018 Luiz Santos. All rights reserved.
//

import UIKit
import ChameleonFramework

class CityViewController: UIViewController {
    
    var thisCity = City()
    
    
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var textHeight: NSLayoutConstraint!
    @IBOutlet weak var picturesFrame: UIImageView!
    @IBOutlet weak var whatToDoButton: UIButton!
    @IBOutlet weak var whereToStayButton: UIButton!
    @IBOutlet weak var showMoreButton: UIButton!
    
    override func viewDidLoad() {
        animatePics()
        showMoreButton.setTitle("Mostrar mais", for: .normal)
        whatToDoButton.setTitle("O que fazer em \(String(describing: thisCity.Name!))?", for: .normal)
        whereToStayButton.setTitle("Onde ficar em \(String(describing: thisCity.Name!))?", for: .normal)
        descriptionLabel.text = thisCity.longDescription
        descriptionLabel.textColor = UIColor.black
        descriptionLabel.font = UIFont(name: "Helvetica-Light", size: 16.0)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationItem.title = thisCity.Name
    }
    
    func animatePics() {
        picturesFrame.animationImages = thisCity.pictures
        picturesFrame.animationDuration = TimeInterval(thisCity.picturesCount*3)
        picturesFrame.startAnimating()
    }
    
    var isLabelAtMaxHeight = false
    
    @IBAction func showMoreButtonPressed(_ sender: UIButton) {
        if isLabelAtMaxHeight {
            showMoreButton.setTitle("Mostrar mais", for: .normal)
            isLabelAtMaxHeight = false
            textHeight.constant = 80
        }
        else {
            showMoreButton.setTitle("Mostrar menos", for: .normal)
            isLabelAtMaxHeight = true
            textHeight.constant = getLabelHeight(text: descriptionLabel.text!, width: view.bounds.width, font: descriptionLabel.font)
        }
    }
    
    @IBAction func whatToDoButton(_ sender: UIButton) {
    }
    
    @IBAction func whereToStayButton(_ sender: UIButton) {
    }
    
    
    func getLabelHeight(text: String, width: CGFloat, font: UIFont) -> CGFloat {
        let lbl = UILabel(frame: .zero)
        lbl.frame.size.width = width-31
        lbl.font = font
        lbl.numberOfLines = 0
        lbl.text = text
        lbl.sizeToFit()
        return lbl.frame.size.height
    }
    
}
