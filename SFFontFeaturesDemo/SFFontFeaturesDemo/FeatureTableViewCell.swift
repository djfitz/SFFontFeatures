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
    @IBOutlet weak var regularHeaderLabel: UILabel!
    @IBOutlet weak var featuredHeaderLabel: UILabel!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
