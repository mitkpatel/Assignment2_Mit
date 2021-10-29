//
//  RestockViewController.swift
//  Assignment2_Mit
//
//  Created by user202387 on 10/29/21.
//

import UIKit

class RestockViewController: UIViewController,UITableViewDelegate,
                             UITableViewDataSource {

    var currentIndex = 0
    var restockManager: Manager = Manager();
    
    @IBOutlet weak var itemTable: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return restockManager.getAllItems().count  }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = itemTable.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        print("data \(restockManager.getAllItems()[indexPath.row].name)")
        cell.textLabel?.text = restockManager.getAllItems()[indexPath.row].name
        cell.detailTextLabel?.text = "\(restockManager.getAllItems()[indexPath.row].quantity)"
        
        return cell
    }
    
     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if !restockManager.getAllItems().isEmpty {\
            if 
            currentIndex = indexPath.row
         }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        itemTable.reloadData()
        // Do any additional setup after loading the view.
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
