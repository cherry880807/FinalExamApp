//
//  dailyTableViewCell.swift
//  期末-天氣app
//
//  Created by User02 on 2019/6/22.
//  Copyright © 2019 00657123. All rights reserved.
//

import UIKit

class dailyTableViewCell: UITableViewCell {

    @IBOutlet var dailyTitle: UILabel!
    @IBOutlet var dailyDetail: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
