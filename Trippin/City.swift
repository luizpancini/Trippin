//
//  City.swift
//  Trippin
//
//  Created by Luiz Santos on 7/29/18.
//  Copyright © 2018 Luiz Santos. All rights reserved.
//
import Foundation
import RealmSwift

class City : Object {
    @objc dynamic var Name: String?
    @objc dynamic var mainPicture: String = ""
    @objc dynamic var quickDescription: String = ""
}
