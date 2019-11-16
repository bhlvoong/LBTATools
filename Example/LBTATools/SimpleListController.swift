//
//  ViewController.swift
//  LBTATools
//
//  Created by Brian Voong on 05/01/2019.
//  Copyright (c) 2019 Brian Voong. All rights reserved.
//

import UIKit
import LBTATools

class SimpleListCell: LBTAListCell<UIColor> {    
    override var item: UIColor! { didSet { backgroundColor = item }}
}

class SimpleListController: LBTAListHeaderController<SimpleListCell, UIColor, SimpleHeader>, UICollectionViewDelegateFlowLayout {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Easy ListController"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        items = [.green, .green, .green, .green, .green, .green, .green, .green, .green, .green, .green, .green]
    }
    
    override func setupHeader(_ header: SimpleHeader) {
        header.blueCellsHorizontalController.collectionView.backgroundColor = .yellow
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width, height: 80)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return .init(width: view.frame.width, height: 120)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 16, left: 0, bottom: 0, right: 0)
    }
}

class SimpleHeader: UICollectionReusableView {
    
    class HeaderCell: LBTAListCell<UIColor> {
        override var item: UIColor! { didSet { backgroundColor = item }}
    }
    class HeaderHorizontalController: LBTAListController<HeaderCell,
        UIColor>, UICollectionViewDelegateFlowLayout  {
        override func viewDidLoad() {
            super.viewDidLoad()
            items = [.blue, .blue, .blue, .blue]
        }
        
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            return .init(width: 120, height: view.frame.height)
        }
        
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
            return .init(top: 0, left: 8, bottom: 0, right: 8)
        }
    }
    
    let blueCellsHorizontalController = HeaderHorizontalController(scrollDirection: .horizontal)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        stack(blueCellsHorizontalController.view)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
}

import SwiftUI

@available(iOS 13.0, *)
struct ListControllerPreview: PreviewProvider {
    
    static var previews: some View {
        Container()
    }
    
    struct Container: UIViewControllerRepresentable {
        func makeUIViewController(context: UIViewControllerRepresentableContext<ListControllerPreview.Container>) -> UIViewController {
            SimpleListController()
        }
        
        func updateUIViewController(_ uiViewController: ListControllerPreview.Container.UIViewControllerType, context: UIViewControllerRepresentableContext<ListControllerPreview.Container>) {
            
        }
    }
    
}
