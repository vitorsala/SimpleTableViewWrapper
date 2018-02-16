//
//  SimpleItem.swift
//  SimpleTableViewWrapper_Example
//
//  Created by Vitor Kawai Sala on 16/02/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import UIKit
import SimpleTableViewWrapper

final class SimpleItem: STableViewItem {
    let name: String
    
    init(name: String) {
        self.name = name
        super.init(cellType: SimpleCell.self)
    }
}
