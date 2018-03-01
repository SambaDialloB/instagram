//
//  PostTableViewCell.swift
//  Instagram
//
//  Created by Samba on 2/28/18.
//  Copyright © 2018 Samba. All rights reserved.
//

import UIKit
import Parse
import ParseUI

class PostTableViewCell: UITableViewCell {

    @IBOutlet weak var postCaption: UILabel!
    @IBOutlet weak var postImage: PFImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    
}
