//
//  SimpleTableViewFooter.swift
//  SimpleTableViewWrapper_Example
//
//  Created by Vitor Kawai Sala on 23/02/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import UIKit
import SimpleTableViewWrapper

final class SimpleTableViewFooter: UITableViewHeaderFooterView {
}

extension SimpleTableViewFooter: STableViewHeaderFooterNibProtocol {
    static var viewHeight: CGFloat { return 30 }
}
