//
//  CityCellTableViewCell.swift
//  Trippin
//
//  Created by Luiz Santos on 7/29/18.
//  Copyright © 2018 Luiz Santos. All rights reserved.
//

import UIKit

class CityTableViewCell: UITableViewCell {
    
    @IBOutlet weak var mainPicture: UIImageView!
    @IBOutlet weak var teaserLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupNameLabel()
        setupTeaserLabel()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
   
    func setupNameLabel() {
        nameLabel.textColor = UIColor.flatWhite()
        nameLabel.font = UIFont(name: "Helvetica-Bold", size: 30.0)
    }
    
    func setupTeaserLabel() {
        teaserLabel.textColor = UIColor.black
        teaserLabel.font = UIFont(name: "Helvetica-Bold", size: 18.0)
    }
    
    
}
