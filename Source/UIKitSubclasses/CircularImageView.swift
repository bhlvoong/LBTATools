//
//  CircularImageView.swift
//  LBTATools
//
//  Created by Brian Voong on 5/1/19.
//

import UIKit

class CircularImageView: UIImageView {
    
    init(width: CGFloat) {
        super.init(image: nil)
        contentMode = .scaleAspectFill
        widthAnchor.constraint(equalToConstant: width).isActive = true
        heightAnchor.constraint(equalTo: widthAnchor).isActive = true
        clipsToBounds = true
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = frame.width / 2
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
    
}
