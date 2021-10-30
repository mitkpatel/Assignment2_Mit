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
    var item = ""
    var quantity = ""
    var time = ""
    var total = ""
    var temp = ""
    
    @IBOutlet weak var itemTable: UITableView!
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return historyItemManager.getAllHistory().count  }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = itemTable.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        
        cell.textLabel?.text = historyItemManager.getAllHistory()[indexPath.row].name
        cell.detailTextLabel?.text = "\(historyItemManager.getAllHistory()[indexPath.row].quantity)"
        
        return cell
    }
    
     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        item = historyItemManager.getAllHistory()[indexPath.row].name
        quantity = "\(historyItemManager.getAllHistory()[indexPath.row].quantity)"
        time = "\(historyItemManager.getAllHistory()[indexPath.row].date)"
        total = "\(historyItemManager.getAllHistory()[indexPath.row].total)"
        
       temp =  "\(item) \n \(quantity) \n \(time) \n \(total)"
     }
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(historyItemManager.getAllHistory().count)
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "toDetailHistory" {
            let managerView = segue.destination as? HistoryDetailsViewController
        
            print("temp \(temp)")
            managerView?.history = temp
        }
        
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
