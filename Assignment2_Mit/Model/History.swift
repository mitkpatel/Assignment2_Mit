//
//  History.swift
//  Assignment2_Mit
//
//  Created by user202387 on 10/29/21.
//

import Foundation
import UIKit

class History {
    
    var name: String
    var quantity: Int
    var date: String
    var total: Int
    
    init(n: String, q: Int, da: String, to: Int) {
        name = n
        quantity = q
        date = da
        total = to
    }
}
