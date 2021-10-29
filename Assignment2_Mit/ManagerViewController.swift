//
//  ManagerViewController.swift
//  Assignment2_Mit
//
//  Created by user202387 on 10/29/21.
//

import UIKit

class ManagerViewController: UIViewController {

    var myManager: Manager = Manager();
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let managerView = segue.destination as? RestockViewController
        managerView?.restockManager = myManager
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
