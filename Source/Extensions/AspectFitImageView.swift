//
//  ScaleFitImageView.swift
//  communicator_ios
//
//  Created by Brian Voong on 1/16/19.
//  Copyright © 2019 Brian Voong. All rights reserved.
//

import UIKit

open class AspectFitImageView: UIImageView {
    
    convenience public init(image: UIImage? = nil, cornerRadius: CGFloat = 0) {
        self.init(image: image)
        self.layer.cornerRadius = cornerRadius
    }
    
    convenience public init() {
        self.init(image: nil)
    }
    
    override public init(image: UIImage?) {
        super.init(image: image)
        contentMode = .scaleAspectFit
        clipsToBounds = true
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError()
    }
    
}

open class AspectFillImageView: UIImageView {
    convenience public init() {
        self.init(image: nil)
        contentMode = .scaleAspectFill
        clipsToBounds = true
    }
}
