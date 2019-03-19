//
//  DetailCell.swift
//  LOL
//
//  Created by fsc on 2019/3/9.
//  Copyright © 2019 fsc. All rights reserved.
//

import UIKit

class DetailCell: UITableViewCell {

    @IBOutlet weak var keyLabel: UILabel!
    @IBOutlet weak var valueLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
