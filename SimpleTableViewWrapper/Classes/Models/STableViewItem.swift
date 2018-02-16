//
//  STableViewItem.swift
//  SimpleTableViewWrapper
//
//  Created by Vitor Kawai Sala on 16/02/18.
//

import UIKit

public typealias STableViewItemAction = ((STableViewItem) -> Void)

open class STableViewItem {
    // MARK: Actions
    open var onSelection: STableViewItemAction?
    open var onShow: STableViewItemAction?
    
    // MARK: Attributes
    open var cellType: (UITableViewCell & STableViewCellProtocol).Type?
    open var isSeparatorVisible: Bool
    
    public init<T: UITableViewCell>(cellType: T.Type,
                                    isSeparatorVisible: Bool = true) where T: STableViewCellProtocol {

        self.cellType = cellType
        self.isSeparatorVisible = isSeparatorVisible
    }
}

extension STableViewItem {
    internal func perform(action: ItemActionType) {
        switch action {
        case .selection:
            onSelection?(self)
        case .show:
            onShow?(self)
        }
    }
}
