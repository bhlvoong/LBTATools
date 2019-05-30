//
//  ListHeaderController.swift
//  LBTATools
//
//  Created by Brian Voong on 5/9/19.
//

import UIKit



/**
 ListHeaderController helps register, dequeues, and sets up cells with their respective items to render in a standard single section list.

 ## Generics ##
 T: the cell type that this list will register and dequeue.
 
 U: the item type that each cell will visually represent.
 
 H: the header type above the section of cells.
 
 */
open class LBTAListHeaderController<T: LBTAListCell<U>, U, H: UICollectionReusableView>: UICollectionViewController {
    
    /// An array of U objects this list will render. When using items.append, you still need to manually call reloadData.
    open var items = [U]() {
        didSet {
            collectionView.reloadData()
        }
    }
    
    fileprivate let cellId = "cellId"
    fileprivate let headerId = "headerId"
    
    override open func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .white
        
        collectionView.register(T.self, forCellWithReuseIdentifier: cellId)
        collectionView.register(H.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerId)
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
    
    override open func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerId, for: indexPath) as! H
        setupHeader(header)
        return header
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
