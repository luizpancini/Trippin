//
//  City.swift
//  Trippin
//
//  Created by Luiz Santos on 7/29/18.
//  Copyright © 2018 Luiz Santos. All rights reserved.
//
import Foundation
import UIKit

class City {
    var Name: String?
    var mainPicture: String = ""
    var quickDescription: String = ""
    var longDescription: String = ""
    var pictures: [UIImage] = []
    var picturesCount: Int = 1
    
    class Attraction {
        init(master: City) {
        var A_Name: String?
        var A_mainPicture: String = ""
        var A_quickDescription: String = ""
        var A_whatYouNeedToKnow: String = ""
        var A_whatToTake: String = ""
        }
    }
    
}

