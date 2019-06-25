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
open class LBTAListHeaderController<T: LBTAListCell<U>, U, H: UICollectionReusableView>: LBTAListHeaderFooterController<T, U, H, UICollectionReusableView> {
}
