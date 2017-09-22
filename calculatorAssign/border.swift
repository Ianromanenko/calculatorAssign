//
//  border.swift
//  calculatorAssign
//
//  Created by Yan on 2017-09-22.
//  Copyright © 2017 Centennial College. All rights reserved.
//

import UIKit

@IBDesignable
class roundButton: UIButton {
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            self.layer.cornerRadius = cornerRadius
        }
    }
    
    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet {
            self.layer.borderWidth = borderWidth
        }
    }
    @IBInspectable var borderColor: UIColor = UIColor.clear {
        didSet {
            self.layer.borderColor = borderColor.cgColor
        }
    }
}
