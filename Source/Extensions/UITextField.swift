//
//  UITextField.swift
//  LBTATools
//
//  Created by Shawn Gee on 1/28/20.
//  Copyright © 2020 Swift Student. All rights reserved.
//

import UIKit

extension UITextField {
    convenience public init(placeholder: String? = nil, font: UIFont? = .systemFont(ofSize: 14), color: UIColor = .black, textAlignment: NSTextAlignment = .left, inputView: UIView? = nil, inputAccessoryView: UIView? = nil ) {
        self.init()
        self.placeholder = placeholder
        self.font = font
        self.textColor = textColor
        self.textAlignment = textAlignment
        self.inputView = inputView
        self.inputAccessoryView = inputAccessoryView
    }
}
