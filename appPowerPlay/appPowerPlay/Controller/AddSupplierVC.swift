//
//  AddSupplierVC.swift
//  appPowerPlay
//
//  Created by Stephenson Ang on 23/05/2019.
//  Copyright © 2019 Stephenson Ang. All rights reserved.
//

import UIKit

class AddSupplierVC: UIViewController {

    @IBOutlet weak var supplierNameTxtField: UITextField!
    @IBOutlet weak var supplierContactNumberTxtField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureTapGesture()
    }
    
    @IBAction func CreateBtnWasPressed(_ sender: Any) {
        if supplierNameTxtField.text != "" && supplierContactNumberTxtField.text != "" {
            self.save { (complete) in
                if complete {
                    dismiss(animated: true, completion: nil)
                }
            }
        }
    }
    
    @IBAction func backBtnWasPressed(_ sender: Any) {
        dismissDetail()
    }
    
    private func configureTapGesture()  {
        
        let tapGesture = UITapGestureRecognizer(
            target: self, action: #selector(AddSupplierVC.handleTap))
        view.addGestureRecognizer(tapGesture)
        
    }
    @objc func handleTap()  {
        
        view.endEditing(true)
        
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        return true
        
    }
    
    func save(completion: (_ finished: Bool) -> ()) {
        //DATABASE
        guard let manageContext = appDelegate?.persistentContainer.viewContext else { return }
        let supplier = Supplier(context: manageContext)
        
        supplier.supplierName = supplierNameTxtField.text
        supplier.supplierContactNumber = Int64(supplierContactNumberTxtField.text!)!
        
        do {
            try manageContext.save()
            completion(true)
        } catch {
            debugPrint("Could not Save: \(error.localizedDescription)")
            completion(false)
        }
    }
}
