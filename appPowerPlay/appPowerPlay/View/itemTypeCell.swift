//
//  itemTypeCell.swift
//  appPowerPlay
//
//  Created by Stephenson Ang on 27/05/2019.
//  Copyright © 2019 Stephenson Ang. All rights reserved.
//

import UIKit
import CoreData

class itemTypeCell: UITableViewCell {
    
    @IBOutlet weak var itemType: UILabel!
    
    func configureCell(item: Item) {
        self.itemType.text = item.itemType
    }

}
