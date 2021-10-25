//
//  Item.swift
//  Assignment2_Mit
//
//  Created by user202387 on 10/25/21.
//

import Foundation
import UIKit

class Item {
    
    var name: String
    var quantity: Int
    var price: Int
    
    init(n: String, q: Int, p: Int) {
        name = n
        quantity = q
        price = p
    }
}
