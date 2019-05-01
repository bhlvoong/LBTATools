//
//  LBTAListCell.swift
//  LBTATools
//
//  Created by Brian Voong on 4/26/19.
//  Copyright © 2019 Brian Voong. All rights reserved.
//

import UIKit

open class LBTAListCell<T>: UICollectionViewCell {
    open var item: T!
    
    public let separatorView = UIView(backgroundColor: UIColor(white: 0.6, alpha: 0.5))
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        setupViews()
    }
    
    open func setupViews() {}
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError()
    }
    
    open func addSeparatorView(leftPadding: CGFloat = 0) {
        addSubview(separatorView)
        separatorView.anchor(top: nil, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, padding: .init(top: 0, left: leftPadding, bottom: 0, right: 0), size: .init(width: 0, height: 0.5))
    }
    
    open func addSeparatorView(leadingAnchor: NSLayoutXAxisAnchor) {
        addSubview(separatorView)
        separatorView.anchor(top: nil, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, size: .init(width: 0, height: 0.5))
    }
}
