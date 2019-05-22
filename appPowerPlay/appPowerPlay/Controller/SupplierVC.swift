//
//  SupplierVC.swift
//  appPowerPlay
//
//  Created by Stephenson Ang on 22/05/2019.
//  Copyright © 2019 Stephenson Ang. All rights reserved.
//

import UIKit

class SupplierVC: UIViewController {
    
    @IBOutlet weak var supplierTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        supplierTableView.delegate = self
        supplierTableView.dataSource = self
    }
    
    @IBAction func backBtnWasPressed(_ sender: Any) {
        dismissDetail()
    }
    @IBAction func addSupplierVC(_ sender: Any) {
        guard let supplierProfileVC = storyboard?.instantiateViewController(withIdentifier: "SupplierProfileVC") else { return }
        presentDetail(supplierProfileVC)
    }
}

extension SupplierVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        <#code#>
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
    
}
