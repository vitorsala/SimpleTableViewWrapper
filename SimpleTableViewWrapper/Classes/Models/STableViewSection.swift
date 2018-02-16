//
//  STableViewSection.swift
//  SimpleTableViewWrapper
//
//  Created by Vitor Kawai Sala on 16/02/18.
//

import UIKit

open class STableViewSection {
    public var items: [STableViewItem] = []
    
    public var headerType: (UITableViewHeaderFooterView & STableViewHeaderFooterProtocol).Type?
    public var footerType: (UITableViewHeaderFooterView & STableViewHeaderFooterProtocol).Type?
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

