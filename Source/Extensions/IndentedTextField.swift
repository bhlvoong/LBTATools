//
//  IndentedTextField.swift
//  LBTATools
//
//  Created by Brian Voong on 5/7/19.
//

import UIKit

class IndentedTextField: UITextField {
    
    let padding: CGFloat
    
    init(placeholder: String, padding: CGFloat, cornerRadius: CGFloat) {
        self.padding = padding
        super.init(frame: .zero)
        self.placeholder = placeholder
        layer.cornerRadius = cornerRadius
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: padding, dy: 0)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: padding, dy: 0)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
