//
//  UITextField.swift
//  LBTATools
//
//  Created by Brian Voong on 5/7/19.
//

import UIKit

extension UITextField {

    public convenience init(placeholder: String) {
        self.init()
        self.placeholder = placeholder
    }
    
    public convenience init(placeholder: String, textColor: UIColor = .label, secureEntry: Bool = false, tams: Bool = true) {
    self.init()
    self.placeholder = placeholder
    self.textColor = textColor
    self.isSecureTextEntry = secureEntry
    self.translatesAutoresizingMaskIntoConstraints = tams
  }

}
