//
//  LBTAListHeaderFooterController.swift
//  LBTATools
//
//  Created by Brian Voong on 6/25/19.
//

import UIKit

/**
 ListHeaderFooterController helps register, dequeues, and sets up cells with their respective items to render in a standard single section list.
 
 ## Generics ##
 T: the cell type that this list will register and dequeue.
 
 U: the item type that each cell will visually represent.
 
 H: the header type above the section of cells.
 
 F: the footer type below the section of cells
 
 */
@available(iOS 9.0, *)
open class LBTAListHeaderFooterController<T: LBTAListCell<U>, U, H: UICollectionReusableView, F: UICollectionReusableView>: UICollectionViewController {
    
    /// An array of U objects this list will render. When using items.append, you still need to manually call reloadData.
    open var items = [U]() {
        didSet {
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
    
    fileprivate let cellId = "cellId"
    fileprivate let supplementaryViewId = "supplementaryViewId"
    
    /// Return an estimated height for proper indexPath using systemLayoutSizeFitting.
    open func estimatedCellHeight(for indexPath: IndexPath, cellWidth: CGFloat) -> CGFloat {
        let cell = T()
        let largeHeight: CGFloat = 1000
        cell.frame = .init(x: 0, y: 0, width: cellWidth, height: largeHeight)
        cell.item = items[indexPath.item]
        cell.layoutIfNeeded()
        
        return cell.systemLayoutSizeFitting(.init(width: cellWidth, height: largeHeight)).height
    }
    
    override open func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .white
        
        collectionView.register(T.self, forCellWithReuseIdentifier: cellId)
        collectionView.register(H.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: supplementaryViewId)
        collectionView.register(F.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: supplementaryViewId)
    }
    
    /// ListHeaderController automatically dequeues your T cell and sets the correct item object on it.
    override open func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! T
        cell.item = items[indexPath.row]
        cell.parentController = self
        return cell
    }
    
    /// Override this to manually set up your header with custom behavior.
    open func setupHeader(_ header: H) {}
    
    open func setupFooter(_ footer: F) {}
    
    override open func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let supplementaryView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: supplementaryViewId, for: indexPath)
        if let header = supplementaryView as? H {
            setupHeader(header)
        } else if let footer = supplementaryView as? F {
            setupFooter(footer)
        }
        return supplementaryView
    }
    
    override open func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    /// If you don't provide this, headers and footers for UICollectionViewControllers will be drawn above the scroll bar.
    override open func collectionView(_ collectionView: UICollectionView, willDisplaySupplementaryView view: UICollectionReusableView, forElementKind elementKind: String, at indexPath: IndexPath) {
        view.layer.zPosition = -1
    }
    
    /**
     Initializes your ListHeaderController with a plain UICollectionViewFlowLayout.
     
     ## Parameters ##
     scrollDirection: direction that your cells will be rendered
     
     */
    public init(scrollDirection: UICollectionView.ScrollDirection = .vertical) {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = scrollDirection
        super.init(collectionViewLayout: layout)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("You most likely have a Storyboard controller that uses this class, please remove any instance of LBTAListHeaderController or sublasses of this component from your Storyboard files.")
    }
    
}
