//
//  FriendListCell.swift
//  VK_Project
//
//  Created by Vladimir Barus on 06.11.2020.
//

import UIKit

class FriendListCell: UITableViewCell {

 
    
    @IBOutlet weak var friendsCity: UILabel!
    @IBOutlet weak var friendsName: UILabel!
    @IBOutlet weak var friendsPhoto: UIImageView!
    @IBOutlet weak var writeAMessage: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
