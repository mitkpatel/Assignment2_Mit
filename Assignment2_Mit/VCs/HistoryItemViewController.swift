//
//  HistoryItemViewController.swift
//  Assignment2_Mit
//
//  Created by user202387 on 10/29/21.
//

import UIKit

class HistoryItemViewController: UIViewController,UITableViewDelegate,
                                 UITableViewDataSource, UITextFieldDelegate {

    var historyItemManager: Manager = Manager();
    
    @IBOutlet weak var itemTable: UITableView!
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return historyItemManager.getAllHistory().count  }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = itemTable.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        print("hisss  \(historyItemManager.getAllHistory()[indexPath.row].quantity)")
        cell.textLabel?.text = historyItemManager.getAllHistory()[indexPath.row].name
        cell.detailTextLabel?.text = "\(historyItemManager.getAllHistory()[indexPath.row].quantity)"
        
        return cell
    }
    
     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
     }
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(historyItemManager.getAllHistory().count)
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
