//
//  UITextView.swift
//  LBTATools
//
//  Created by Brian Voong on 6/24/19.
//

import Foundation

extension UITextView {
    convenience public init(text: String?, font: UIFont? = UIFont.systemFont(ofSize: 14), textColor: UIColor = .black, textAlignment: NSTextAlignment = .left) {
        self.init()
        self.text = text
        self.font = font
        self.textColor = textColor
        self.textAlignment = textAlignment
    }
}
