//
//  SimpleTableViewHeader.swift
//  SimpleTableViewWrapper_Example
//
//  Created by Vitor Kawai Sala on 23/02/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import UIKit
import SimpleTableViewWrapper

final class SimpleTableViewHeader: UITableViewHeaderFooterView {
    @IBOutlet private weak var lblTitle: UILabel!
}

extension SimpleTableViewHeader: STableViewHeaderFooterNibProtocol {
    static var viewHeight: CGFloat { return 50 }
    
    func setHeaderFooter(forSection section: Int,
                         fromTableViewHandler handler: STableViewWrapper,
                         givenModel sectionModel: STableViewSection) {
        
        self.lblTitle.text = sectionModel.title
    }
}
