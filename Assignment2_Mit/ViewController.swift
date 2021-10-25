//
//  ViewController.swift
//  Assignment2_Mit
//
//  Created by user202387 on 10/25/21.
//

import UIKit

@IBDesignable extension UIButton {

    @IBInspectable var borderWidth: CGFloat {
        set {
            layer.borderWidth = newValue
        }
        get {
            return layer.borderWidth
        }
    }

    @IBInspectable var cornerRadius: CGFloat {
        set {
            layer.cornerRadius = newValue
        }
        get {
            return layer.cornerRadius
        }
    }

    @IBInspectable var borderColor: UIColor? {
        set {
            guard let uiColor = newValue else { return }
            layer.borderColor = uiColor.cgColor
        }
        get {
            guard let color = layer.borderColor else { return nil }
            return UIColor(cgColor: color)
        }
    }
}

class ViewController: UIViewController,
                      UITableViewDelegate,
                      UITableViewDataSource {
    
    
    var lists = [["Pants",20,25],
                 ["Shoes",50,35],
                 ["Hats",10,12],
                 ["Tshirts",10,15],
                 ["Dresses",24,40],
                 ["Socks",60,10],
                 ["Shirt",12,18]];
    
    var manager: Manager = Manager();
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return manager.getAllItems().count  }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = itemTable.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
//         let rowData = items[indexPath.row]
//            if let firstStr = rowData.first as? String {
//                cell.textLabel?.text = firstStr
//                cell.detailTextLabel?.text = rowData[1]
//            }
        
        cell.textLabel?.text = manager.getAllItems()[indexPath.row].name
        cell.detailTextLabel?.text = "\(manager.getAllItems()[indexPath.row].quantity)"
        
        return cell
    }
    

    @IBOutlet weak var itemTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        for list in lists {
            let name = list[0]
            let quantity = list[1]
            let price = list[2]
            let i: Item = Item(n: name as! String, q: quantity as! Int, p: price as! Int)
            manager.addNewItem(newItem: i)
            
        }
        
    }
    
    
}

