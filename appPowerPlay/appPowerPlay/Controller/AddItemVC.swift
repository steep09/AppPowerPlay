//
//  AddItemVC.swift
//  appPowerPlay
//
//  Created by Stephenson Ang on 27/05/2019.
//  Copyright © 2019 Stephenson Ang. All rights reserved.
//

import UIKit
import CoreData

class AddItemVC: UIViewController {
    
    @IBOutlet weak var tshirtBtn: UIButton!
    @IBOutlet weak var dressBtn: UIButton!
    @IBOutlet weak var blouseBtn: UIButton!
    @IBOutlet weak var pairBtn: UIButton!
    
    @IBOutlet weak var itemNumberTxtField: UITextField!
    @IBOutlet weak var itemQuantityTxtField: UITextField!
    @IBOutlet weak var itemPriceTxtField: UITextField!
    
    var itemType: ItemType = .shirt
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tshirtBtn.setSeletedColor()
        dressBtn.setDeselectColor()
        blouseBtn.setDeselectColor()
        pairBtn.setDeselectColor()
    }
    
    @IBAction func addItemBtnWasPressed(_ sender: Any) {
        if itemNumberTxtField.text != "" && itemQuantityTxtField.text != "" && itemPriceTxtField.text != "" {
            self.save { (complete) in
                if complete {
                    dismiss(animated: true, completion: nil)
                }
            }
        }
    }
    
    @IBAction func tshirtBtnWasPressed(_ sender: Any) {
        itemType = .shirt
        
        tshirtBtn.setSeletedColor()
        dressBtn.setDeselectColor()
        blouseBtn.setDeselectColor()
        pairBtn.setDeselectColor()
    }
    
    @IBAction func dressBtnWasPressed(_ sender: Any) {
        itemType = .dress
        
        tshirtBtn.setDeselectColor()
        dressBtn.setSeletedColor()
        blouseBtn.setDeselectColor()
        pairBtn.setDeselectColor()
    }
    
    @IBAction func blouseBtnWasPressed(_ sender: Any) {
        itemType = .blouse
        
        tshirtBtn.setDeselectColor()
        dressBtn.setDeselectColor()
        blouseBtn.setSeletedColor()
        pairBtn.setDeselectColor()
    }
    
    @IBAction func pairBtnWasPressed(_ sender: Any) {
        itemType = .pair
        
        tshirtBtn.setDeselectColor()
        dressBtn.setDeselectColor()
        blouseBtn.setDeselectColor()
        pairBtn.setSeletedColor()
    }
    
    @IBAction func backBtnWasPressed(_ sender: Any) {
        dismissDetail()
    }
    
    func save(completion: (_ finished: Bool) -> ()) {
        guard let manageContext = appDelegate?.persistentContainer.viewContext else { return }
        let item = Item(context: manageContext)
        
        item.itemType = itemType.rawValue
        item.itemNumber = Int64(itemNumberTxtField.text!)!
        item.itemQuantity = Int32(itemQuantityTxtField.text!)!
        item.itemPrice = Double(itemPriceTxtField.text!)!
        do {
            try manageContext.save()
            completion(true)
        } catch {
            debugPrint("Could not Save: \(error.localizedDescription)")
            completion(false)
        }
    }
    
}
