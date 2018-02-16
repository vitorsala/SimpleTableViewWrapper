//
//  STableViewHeaderFooterProtocol.swift
//  SimpleTableViewWrapper
//
//  Created by Vitor Kawai Sala on 16/02/18.
//

import UIKit
import Reusable

public protocol STableViewHeaderFooterProtocol: Reusable {
    static var viewHeight: CGFloat { get }
    func setHeaderFooter(forSection section: Int,
                         fromTableViewHandler handler: STableViewWrapper,
                         givenModel sectionModel: STableViewSection)
}

public protocol STableViewHeaderFooterNibProtocol: STableViewHeaderFooterProtocol, NibLoadable {}

class Teste: STableViewHeaderFooterNibProtocol {
    static var viewHeight: CGFloat { return 0 }
    
    func setHeaderFooter(forSection section: Int, fromTableViewHandler handler: STableViewWrapper, givenModel sectionModel: STableViewSection) {
    }
}
