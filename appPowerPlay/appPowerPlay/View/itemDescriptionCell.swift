//
//  itemDescriptionCell.swift
//  appPowerPlay
//
//  Created by Stephenson Ang on 27/05/2019.
//  Copyright © 2019 Stephenson Ang. All rights reserved.
//

import UIKit
import CoreData

class itemDescriptionCell: UITableViewCell {

    @IBOutlet weak var itemName: UILabel!
    @IBOutlet weak var itemQuantity: UILabel!
    @IBOutlet weak var itemPrice: UILabel!
    
    func configureCell(item: Item) {
        self.itemName.text = String(item.itemNumber)
        self.itemQuantity.text = String(item.itemQuantity)
        self.itemPrice.text = String(item.itemPrice)
        
    }
}
