//
//  LBTAListCell.swift
//  LBTATools
//
//  Created by Brian Voong on 4/26/19.
//  Copyright © 2019 Brian Voong. All rights reserved.
//

import UIKit

class LBTAListCell<T>: UICollectionViewCell {
    var item: T!
    
    let separatorView: UIView = {
        let v = UIView()
        v.backgroundColor = UIColor(white: 0.6, alpha: 0.5)
        return v
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        setupViews()
    }
    
    func setupViews() {}
    
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
    
    func addSeparatorView(leftPadding: CGFloat = 0) {
        addSubview(separatorView)
        separatorView.anchor(top: nil, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, padding: .init(top: 0, left: leftPadding, bottom: 0, right: 0), size: .init(width: 0, height: 0.5))
    }
    
    func addSeparatorView(leadingAnchor: NSLayoutXAxisAnchor) {
        addSubview(separatorView)
        separatorView.anchor(top: nil, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, size: .init(width: 0, height: 0.5))
    }
}
