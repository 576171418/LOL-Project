//
//  HeroCardCell.swift
//  LOL
//
//  Created by fsc on 2019/3/9.
//  Copyright © 2019 fsc. All rights reserved.
//

import UIKit

class HeroCardCell: UITableViewCell {

    @IBOutlet weak var type: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var favBtn: UIButton!
    @IBOutlet weak var heroImage: UIImageView!
    @IBOutlet weak var origin: UILabel!
    
    var favorite = false {
        willSet {
            if newValue {
                favBtn.setImage(UIImage(named: "fav"), for: .normal)
            } else {
                favBtn.setImage(UIImage(named: "unfav"), for: .normal)
            }
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
