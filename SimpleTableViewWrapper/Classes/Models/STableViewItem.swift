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
    
    /// The selection closure. This closure will be called when user select the cell containing this item.
    open var onSelection: STableViewItemAction?
    
    /// The show closure. This closure will be called when the cell, contaning this item, will be displayed to user's screen.
    open var onShow: STableViewItemAction?
    
    // MARK: Attributes
    /// The cell's reference that will be used to display this item's properties.
    ///
    /// If nil, an fatalError will be throw.
    open var cellType: (UITableViewCell & STableViewCellProtocol).Type?
    
    /// An Bool marking if this item's cell should render the separator line.
    open var isSeparatorVisible: Bool
    
    public init(cellType: (UITableViewCell & STableViewCellProtocol).Type? = nil,
                isSeparatorVisible: Bool = true) {

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
