//
//  UIButton.swift
//  LBTATools
//
//  Created by Brian Voong on 5/1/19.
//

import UIKit

extension UIButton {
    
    convenience public init(title: String, titleColor: UIColor? = .black, font: UIFont? = .boldSystemFont(ofSize: 14)) {
        self.init(type: .system)
        setTitle(title, for: .normal)
        setTitleColor(titleColor, for: .normal)
        titleLabel?.font = font
    }
    
    convenience public init(image: UIImage, tintColor: UIColor? = nil) {
        self.init(type: .system)
        if tintColor == nil {
            setImage(image, for: .normal)
        } else {
            setImage(image.withRenderingMode(.alwaysTemplate), for: .normal)
            self.tintColor = tintColor
        }
        
    }
    
}
