//
//  LBTAListController.swift
//  LBTATools
//
//  Created by Brian Voong on 12/26/18.
//  Copyright © 2018 Brian Voong. All rights reserved.
//

import UIKit

/**
 Convenient list component where a Header class is not required.
 
 ## Generics ##
 T: the cell type that this list will register and dequeue.
 
 U: the item type that each cell will visually represent.
 */

@available(iOS 9.0, *)
open class LBTAListController<T: LBTAListCell<U>, U>: LBTAListHeaderController<T, U, UICollectionReusableView> {
}
