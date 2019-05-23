//
//  ViewController.swift
//  appPowerPlay
//
//  Created by Stephenson Ang on 22/05/2019.
//  Copyright © 2019 Stephenson Ang. All rights reserved.
//

import UIKit

let appDelegate = UIApplication.shared.delegate as? AppDelegate

class MainVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func supplierBtnWasPressed(_ sender: Any) {
        guard let supplierVC = storyboard?.instantiateViewController(withIdentifier: "SupplierVC") else { return }
        presentDetail(supplierVC)
    }
}

