//
//  ViewController.swift
//  LBTAToolsStacking
//
//  Created by Brian Voong on 5/10/19.
//  Copyright © 2019 Brian Voong. All rights reserved.
//

import UIKit
import LBTATools

class SimpleVerticalStackCell: UICollectionViewCell {
    
    let imageView = UIImageView(image: #imageLiteral(resourceName: "girl.png"), contentMode: .scaleAspectFill)
    let nameLabel = UILabel(text: "Girly McGirly", textAlignment: .center)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        imageView.layer.cornerRadius = 80 / 2
        
        stack(imageView.withSize(.init(width: 80, height: 80)),
              nameLabel,
              alignment: .center).padTop(8)
        
        layer.borderWidth = 0.5
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
    
}

class HorizontalStackingCell: UICollectionViewCell {
    
    let imageView = UIImageView(image: #imageLiteral(resourceName: "girl.png"), contentMode: .scaleAspectFill)
    let nameLabel = UILabel(text: "Girly McGirly", font: .boldSystemFont(ofSize: 14))
    let messageLabel = UILabel(text: "Did you enjoy last night? I had a great time. Let's meet up again later this week, I'll show you what's up", font: .systemFont(ofSize: 12), textColor: .gray, numberOfLines: 2)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        imageView.layer.cornerRadius = 60 / 2
        
        hstack(imageView.withSize(.init(width: 60, height: 60)),
               stack(nameLabel, messageLabel, spacing: 6),
               spacing: 16,
               alignment: .center).withMargins(.allSides(12))
        
        layer.borderWidth = 1
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
    
}

class StackingWithMarginsCell: UICollectionViewCell {
    
    let imageView = UIImageView(image: #imageLiteral(resourceName: "girl.png"), contentMode: .scaleAspectFill)
    let nameLabel = UILabel(text: "Girly McGirly", font: .boldSystemFont(ofSize: 14))
    let messageLabel = UILabel(text: "Did you enjoy last night? I had a great time. Let's meet up again later this week, I'll show you what's up", font: .systemFont(ofSize: 12), textColor: .gray, numberOfLines: 2)
    
    let exploreLabel = UILabel(text: "Explore", font: .boldSystemFont(ofSize: 12))
    
    let arrowImageView = UIImageView(image: #imageLiteral(resourceName: "girl.png"))
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        stack(imageView.withHeight(200),
              stack(nameLabel,
                    messageLabel,
                    UIView(),
                    hstack(exploreLabel, arrowImageView.withWidth(16).withHeight(16), UIView(), spacing: 8),
                    spacing: 8).withMargins(.allSides(14)))
        
        layer.borderWidth = 2
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
    
}

class StackingExampleController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    let simpleVerticalStackCellId = "SimpleVerticalStackCell"
    let hstackCellId = "hstackCellId"
    let stackingWithMarginsId = "stackingWithMarginsId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Stack and hstack"
        
        collectionView.backgroundColor = .white
        
        collectionView.register(SimpleVerticalStackCell.self, forCellWithReuseIdentifier: simpleVerticalStackCellId)
        collectionView.register(HorizontalStackingCell.self, forCellWithReuseIdentifier: hstackCellId)
        collectionView.register(StackingWithMarginsCell.self, forCellWithReuseIdentifier: stackingWithMarginsId)
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 { return 3 }
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cellId: String
        if indexPath.section == 0 {
            cellId = simpleVerticalStackCellId
        } else if indexPath.section == 1 {
            cellId = hstackCellId
        } else {
            cellId = stackingWithMarginsId
        }
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 0, left: 16, bottom: 16, right: 16)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 15
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.section == 0 {
            return .init(width: (view.frame.width - 16 * 4) / 3, height: 120)
        } else if indexPath.section == 1 {
            return .init(width: view.frame.width - 16 * 2, height: 100)
        } else {
            return .init(width: view.frame.width - 16 * 2, height: 400)
        }
    }
    
    init() {
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }

}

