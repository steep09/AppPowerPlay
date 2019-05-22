//
//  SupplierNameCell.swift
//  appPowerPlay
//
//  Created by Stephenson Ang on 22/05/2019.
//  Copyright © 2019 Stephenson Ang. All rights reserved.
//

import UIKit
import CoreData

class SupplierNameCell: UITableViewCell {

    @IBOutlet weak var supplierName: UILabel!
    
    func configureCell(supplier: Supplier) {
        self.supplierName.text = supplier.supplierName
    }
}
