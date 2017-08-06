//
//  FlickrCellTableViewCell.swift
//  flickrClient
//
//  Created by Marco Del Angel on 8/2/17.
//  Copyright © 2017 Marco Del Angel. All rights reserved.
//

import UIKit

class FlickrCellTableViewCell: UITableViewCell {

    
    @IBOutlet weak var photoImageview: UIImageView!
    @IBOutlet weak var tittleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
