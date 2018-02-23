//
//  STableViewSection.swift
//  SimpleTableViewWrapper
//
//  Created by Vitor Kawai Sala on 16/02/18.
//

import UIKit

open class STableViewSection {
    /// The items contained on this Section
    public var items: [STableViewItem] = []
    
    /// The header's view reference.
    public var headerType: (UITableViewHeaderFooterView & STableViewHeaderFooterProtocol).Type?
    
    /// The footer's view reference.
    public var footerType: (UITableViewHeaderFooterView & STableViewHeaderFooterProtocol).Type?
    
    /// An convenience property.
    ///
    /// it won't be used by the wrapper unless your header/footer use this property for something.
    public var title: String?
    
    public init(title: String? = nil,
                items: [STableViewItem] = [],
                headerType: (UITableViewHeaderFooterView & STableViewHeaderFooterProtocol).Type? = nil,
                footerType: (UITableViewHeaderFooterView & STableViewHeaderFooterProtocol).Type? = nil) {

        self.title = title
        self.items = items
        self.headerType = headerType
        self.footerType = footerType
    }
}

