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
    var item: [Item] = []
    
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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fetchCoreDataObjects()
        itemCatTableView.reloadData()
    }
    
    func fetchCoreDataObjects() {
        self.fetch{ (complete) in
            if complete {
                if item.count >= 1 {
                    itemCatTableView.isHidden = false
                } else {
                    itemCatTableView.isHidden = true
                }
            }
        }
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
        return item.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "itemDescriptionCell") as? itemDescriptionCell else { return UITableViewCell() }
        cell.configureCell(item: item[indexPath.row])
        return cell
    }
    
    func removeItem(atIndexPath indexPath: IndexPath) {
        guard let manageContext = appDelegate?.persistentContainer.viewContext else { return }
        
        manageContext.delete(item[indexPath.row])
        
        do {
            try manageContext.save()
        } catch {
            debugPrint("Could not remove: \(error.localizedDescription)")
        }
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .none
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let deleteAction = UITableViewRowAction(style: .destructive, title: "DELETE") { (rowAction, indexPath) in
            self.removeItem(atIndexPath: indexPath)
            self.fetchCoreDataObjects()
            self.itemCatTableView.deleteRows(at: [indexPath], with: .automatic)
        }
        
        deleteAction.backgroundColor = #colorLiteral(red: 1, green: 0, blue: 0, alpha: 1)
        return [deleteAction]
    }
    
}

extension ItemCatVC {
    
    func fetch(completion: (_ complete: Bool) -> ()) {
        guard let manageContext = appDelegate?.persistentContainer.viewContext else { return }
        
        let fetchRequest = NSFetchRequest<Item>(entityName: "Item")
        
        do {
            item = try manageContext.fetch(fetchRequest)
            completion(true)
        } catch {
            debugPrint("Could not fetch: \(error.localizedDescription)")
            completion(false)
        }
    }
    
}
