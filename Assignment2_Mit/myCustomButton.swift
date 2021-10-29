//
//  myCustomButton.swift
//  Assignment2_Mit
//
//  Created by user202387 on 10/29/21.
//

import Foundation
import UIKit

class myCustomButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame:frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        layer.cornerRadius = layer.frame.height / 2
    }

}
