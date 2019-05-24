//
//  ItemCatVC.swift
//  appPowerPlay
//
//  Created by Stephenson Ang on 24/05/2019.
//  Copyright © 2019 Stephenson Ang. All rights reserved.
//

import UIKit
import CoreData

class ItemCatVC: UIViewController {

    @IBOutlet weak var itemNameLbl: UILabel!
    
    var supplierName: String!
    var supplierNumber: Int!
    
    func initData(name: String, number: Int) {
        self.supplierName = name
        self.supplierNumber = number
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        itemNameLbl.text = supplierName
    }

    @IBAction func backBtnWasPressed(_ sender: Any) {
        dismissDetail()
    }
}
