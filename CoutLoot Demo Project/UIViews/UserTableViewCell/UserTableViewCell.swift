//
//  UserTableViewCell.swift
//  CoutLoot Demo Project
//
//  Created by Pranay Joshi on 25/07/20.
//  Copyright © 2020 Pranay Joshi. All rights reserved.
//

import UIKit

class UserTableViewCell: UITableViewCell {
    // MARK: - Declaration of variables and outlets.
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var userName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
}
