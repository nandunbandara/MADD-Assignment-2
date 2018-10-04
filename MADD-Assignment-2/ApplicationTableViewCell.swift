//
//  ApplicationTableViewCell.swift
//  MADD-Assignment-2
//
//  Created by Nandun Bandara on 10/4/18.
//  Copyright © 2018 Nandun Bandara. All rights reserved.
//

import UIKit

class ApplicationTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var ownerLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    

}
