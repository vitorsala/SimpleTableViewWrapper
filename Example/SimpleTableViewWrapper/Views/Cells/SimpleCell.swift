//
//  SimpleCell.swift
//  SimpleTableViewWrapper_Example
//
//  Created by Vitor Kawai Sala on 16/02/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import UIKit
import SimpleTableViewWrapper

final class SimpleCell: UITableViewCell {
}

extension SimpleCell: STableViewCellProtocol {
    func setCell(item: STableViewItem) {
        guard let item = item as? SimpleItem else { return }
        self.textLabel?.text = item.name
    }
}
