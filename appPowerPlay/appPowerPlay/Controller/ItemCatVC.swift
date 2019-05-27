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
    
    @IBOutlet weak var itemCatTableView: UITableView!
    
    var itemType: ItemType = .shirt
    
    var supplierName: String!
    var supplierNumber: Int64!
    var supplierItem: NSSet!
    
    func initData(supplier: Supplier) {
        self.supplierName = supplier.supplierName
        self.supplierNumber = supplier.supplierContactNumber
        self.supplierItem = supplier.itemCat
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        itemCatTableView.delegate = self
        itemCatTableView.dataSource = self

        itemNameLbl.text = supplierName
    }

    @IBAction func AddItemBtnWasPressed(_ sender: Any) {
        guard let addItemVC = storyboard?.instantiateViewController(withIdentifier: "AddItemVC") as? AddItemVC else { return }
        presentDetail(addItemVC)
    }
    
    @IBAction func backBtnWasPressed(_ sender: Any) {
        dismissDetail()
    }
}

extension ItemCatVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    
}
