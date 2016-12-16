//
//  FeatureTableViewCell.swift
//  SFFontFeaturesDemo
//
//  Created by Doug Hill on 12/8/16.
//  Copyright © 2016 doughill. All rights reserved.
//

import UIKit

class FeatureTableViewCell: UITableViewCell {

    static var cellID = "FeatureTableCellID"

    @IBOutlet var descLabel: UILabel!
    @IBOutlet var regularLabel: UILabel!
    @IBOutlet var featuredLabel: UILabel!

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
