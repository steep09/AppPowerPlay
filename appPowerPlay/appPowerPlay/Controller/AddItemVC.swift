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
    
    var itemType: ItemType = .shirt
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tshirtBtn.setSeletedColor()
        dressBtn.setDeselectColor()
        blouseBtn.setDeselectColor()
        pairBtn.setDeselectColor()
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
    
}
