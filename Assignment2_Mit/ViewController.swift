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
    
    @IBOutlet weak var itemTable: UITableView!
    
    
    @IBOutlet weak var quantityLabel: UILabel!
    
    @IBOutlet weak var typeLabel: UILabel!
    
    @IBOutlet weak var totalLabel: UILabel!
    
    var runnngNumber = ""
    var tempPrice = 0
    var tempQuantity = 0
    var currentIndex = 0
    
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

        cell.textLabel?.text = manager.getAllItems()[indexPath.row].name
        cell.detailTextLabel?.text = "\(manager.getAllItems()[indexPath.row].quantity)"

        return cell
    }
    
     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if !manager.getAllItems().isEmpty {
            quantityLabel.text = ""
            runnngNumber = ""
            totalLabel.text = ""
            typeLabel.text = manager.getAllItems()[indexPath.row].name
            tempPrice = manager.getAllItems()[indexPath.row].price
            tempQuantity = manager.getAllItems()[indexPath.row].quantity
            currentIndex = indexPath.row
         }
    }
    
    @IBAction func numberPressed(_ sender: UIButton) {
        runnngNumber += "\(sender.tag)"
        quantityLabel.text = runnngNumber
        totalLabel.text =  "\(Int(runnngNumber)! * Int(tempPrice))"
    }
    
    
    @IBAction func buyPressed(_ sender: Any) {
        
        if Int(runnngNumber) ?? 0 > Int(tempQuantity) {
            let alert = UIAlertController(title: "Problem with the order!", message: "We have only \(tempQuantity) \(typeLabel.text!) in stock.", preferredStyle: .alert)

            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            self.present(alert, animated: true)
        }
        
        else {
            let alert = UIAlertController(title: "Are youu sure?", message: "Total cost for \(tempQuantity) \(typeLabel.text!) is $\(totalLabel.text!)", preferredStyle: .alert)

            alert.addAction(UIAlertAction(title: "Confirm", style: .default, handler: { [self]_ in
                let temp = (manager.getAllItems()[currentIndex].quantity) - Int(runnngNumber)!
                manager.getAllItems()[currentIndex].quantity = temp
                itemTable.reloadData()
            }))
            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: {_ in self.itemTable.reloadData()}))

            self.present(alert, animated: true)

        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        for list in lists {
            let name = list[0]
            let quantity = list[1]
            let price = list[2]
            let i: Item = Item(n: name as! String, q: quantity as! Int, p: price as! Int)
            manager.addNewItem(newItem: i)
            itemTable.reloadData()
        }
    }
}
