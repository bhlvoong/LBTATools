//
//  CircularImageView.swift
//  LBTATools
//
//  Created by Brian Voong on 5/1/19.
//

import UIKit

open class CircularImageView: UIImageView {
    
    public init(width: CGFloat = 0, image: UIImage? = nil) {
        super.init(image: nil)
        contentMode = .scaleAspectFill
        if width != 0 {
            widthAnchor.constraint(equalToConstant: width).isActive = true
        }
        heightAnchor.constraint(equalTo: widthAnchor).isActive = true
        clipsToBounds = true
    }
    
    override open func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = frame.width / 2
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError()
    }
    
}
