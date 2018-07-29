//
//  Starter.swift
//  Trippin
//
//  Created by Luiz Santos on 7/28/18.
//  Copyright © 2018 Luiz Santos. All rights reserved.
//

import UIKit

class StarterViewController: UIViewController {
    
    @IBOutlet weak var imageOpener: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        moveImageRight()
    }
    
    func moveImageRight () {
        UIView.animate(withDuration: 30, delay: 0, options: .curveEaseInOut, animations: {
        self.imageOpener.center.x -= 500
        }, completion: nil)
        self.moveImageLeft()
    }
    
    func moveImageLeft () {
        UIView.animate(withDuration: 30, delay: 30, options: .curveEaseInOut , animations: {
            self.imageOpener.center.x += 500
        }, completion: nil)
    }
    
    
}
