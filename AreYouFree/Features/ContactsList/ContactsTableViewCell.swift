//
//  ContactsTableViewCell.swift
//  AreYouFree
//
//  Created by Michael White on 2/17/18.
//  Copyright © 2018 Nicolas Salafranca. All rights reserved.
//

import UIKit

class ContactsTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setup(for name: String){
        nameLabel.text = name
    }

}
