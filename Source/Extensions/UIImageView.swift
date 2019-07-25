//
//  UIImageView.swift
//  LBTATools
//
//  Created by Zak Barlow on 25/07/2019.
//  Copyright © 2019 Zak Barlow. All rights reserved.
//

import UIKit

extension UIImageView {
    convenience public init(image: UIImage? = nil, contentMode: UIView.ContentMode, cornerRadius: CGFloat = 0, clipsToBounds: Bool = true) {
        self.init(image: image)
        self.contentMode = contentMode
        self.layer.cornerRadius = cornerRadius
        self.clipsToBounds = clipsToBounds
    }
}
