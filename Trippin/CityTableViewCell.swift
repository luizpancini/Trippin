//
//  CityCellTableViewCell.swift
//  Trippin
//
//  Created by Luiz Santos on 7/29/18.
//  Copyright © 2018 Luiz Santos. All rights reserved.
//

import UIKit

class CityTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var teaserLabel: UILabel!
    @IBOutlet weak var mainPicture: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
