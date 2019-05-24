//
//  SupplierVC.swift
//  appPowerPlay
//
//  Created by Stephenson Ang on 22/05/2019.
//  Copyright © 2019 Stephenson Ang. All rights reserved.
//

import UIKit
import CoreData

class SupplierVC: UIViewController {
    
    @IBOutlet weak var supplierTableView: UITableView!
    
    @IBOutlet weak var contactNumber: UITextField!
    
    var supplier: [Supplier] = []
    
    var supplierName: String!
    var supplierContactNumber: Int!
    
    func initData(name: String, contactNumber: Int) {
        self.supplierName = name
        self.supplierContactNumber = contactNumber
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        supplierTableView.delegate = self
        supplierTableView.dataSource = self
        
        contactNumber.bindToKeyboard()
        contactNumber.delegate = self
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fetchCoreDataObjects()
        supplierTableView.reloadData()
    }
    
    func fetchCoreDataObjects() {
        self.fetch{ (complete) in
            if complete {
                if supplier.count >= 1 {
                    supplierTableView.isHidden = false
                } else {
                    supplierTableView.isHidden = true
                }
            }
        }
    }
    
    @IBAction func addSupplierBtnWasPressed(_ sender: Any) {
        guard let addSupplierVC = storyboard?.instantiateViewController(withIdentifier: "AddSupplierVC") as? AddSupplierVC else { return }
        presentDetail(addSupplierVC)
    }
    
    @IBAction func backBtnWasPressed(_ sender: Any) {
        dismissDetail()
    }
    
}

extension SupplierVC: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
}

extension SupplierVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return supplier.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "SupplierNameCell") as? SupplierNameCell else { return UITableViewCell() }
        cell.configureCell(supplier: supplier[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let itemCatVC = storyboard?.instantiateViewController(withIdentifier: "ItemCatVC") as? ItemCatVC else { return }
        presentDetail(itemCatVC)
    }
    
    func removeSupplier(atIndexPath indexPath: IndexPath) {
        guard let manageContext = appDelegate?.persistentContainer.viewContext else { return }
        
        manageContext.delete(supplier[indexPath.row])
        
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
            self.removeSupplier(atIndexPath: indexPath)
            self.fetchCoreDataObjects()
            self.supplierTableView.deleteRows(at: [indexPath], with: .automatic)
        }
        let addAction = UITableViewRowAction(style: .normal, title: "EDIT") { (rowAction, indexPath) in
            self.setSupplier(atIndexPath: indexPath)
            self.supplierTableView.reloadRows(at: [indexPath], with: .automatic)
        }
        
        deleteAction.backgroundColor = #colorLiteral(red: 1, green: 0, blue: 0, alpha: 1)
        addAction.backgroundColor = #colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1)
        return [deleteAction, addAction]
    }
    
}

extension SupplierVC {
    
    func setSupplier(atIndexPath indexPath: IndexPath) {
        if contactNumber.text == "" {
            let chosenSupplier = supplier[indexPath.row]
            contactNumber.text = String(chosenSupplier.supplierContactNumber)
        } else {
            let newContact = Int64(contactNumber.text!)!
            guard let manageContext = appDelegate?.persistentContainer.viewContext else { return }
            
            let chosenSupplier = supplier[indexPath.row]
            
            if chosenSupplier.supplierContactNumber != newContact {
                chosenSupplier.supplierContactNumber = Int64(contactNumber.text!)!
                supplierTableView.reloadData()
                contactNumber.text = ""
            } else {
                return
            }
            
            do {
                try manageContext.save()
                print("Successfully set progress")
            } catch {
                debugPrint("Could not set progress: \(error.localizedDescription)")
            }
        }
        
    }
    
    func fetch(completion: (_ complete: Bool) -> ()) {
        guard let manageContext = appDelegate?.persistentContainer.viewContext else { return }
        
        let fetchRequest = NSFetchRequest<Supplier>(entityName: "Supplier")
        
        do {
            supplier = try manageContext.fetch(fetchRequest)
            completion(true)
        } catch {
            debugPrint("Could not fetch: \(error.localizedDescription)")
            completion(false)
        }
    }
    
}
