//
//  Manager.swift
//  Assignment2_Mit
//
//  Created by user202387 on 10/25/21.
//

import Foundation
import UIKit

class Manager {
    
    var item = [Item]();
    
    func addNewItem(newItem: Item) {
        item.append(newItem)
    }
    
    func getAllItems()-> [Item] {
        return item
    }
}
