//
//  LBTAListCell.swift
//  LBTATools
//
//  Created by Brian Voong on 4/26/19.
//  Copyright © 2019 Brian Voong. All rights reserved.
//

import UIKit

/// ListCell represents a cell that ListHeaderController registers and dequeues for list rendering. T represents the Class Type, usually a model or view model object, this cell should render visually.
@available(iOS 9.0, *)
open class LBTAListCell<T>: UICollectionViewCell {
    
    /// item is fed in automatically from ListHeaderController
    open var item: T!
    
    /// parentController is set to the ListHeaderController that is rendering this cell.  This is useful for scenarios where a cell contains a UIButton and you want to use addTarget(...) to trigger an action in the controller.
    open weak var parentController: UIViewController?
    
    /// 90% of lists need a separator line
    public let separatorView = UIView(backgroundColor: UIColor(white: 0.6, alpha: 0.5))
    
    /// This convenience method sets up the separate line with some left padding
    open func addSeparatorView(leftPadding: CGFloat = 0) {
        addSubview(separatorView)
        separatorView.anchor(top: nil, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, padding: .init(top: 0, left: leftPadding, bottom: 0, right: 0), size: .init(width: 0, height: 0.5))
    }
    /// This sets up the separator to be anchored to some leading anchor
    open func addSeparatorView(leadingAnchor: NSLayoutXAxisAnchor) {
        addSubview(separatorView)
        separatorView.anchor(top: nil, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, size: .init(width: 0, height: 0.5))
    }
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        setupViews()
    }
    
    /// In your custom ListCell classes, just override setupViews() to provide custom behavior.  We do this to avoid overriding init methods.
    open func setupViews() {}
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError()
    }
}
