//
//  STableViewCellProtocol.swift
//  SimpleTableViewWrapper
//
//  Created by Vitor Kawai Sala on 16/02/18.
//

import UIKit
import Reusable

public protocol STableViewCellProtocol: Reusable {
    static var cellHeight: CGFloat { get }
    
    func setCell(item: STableViewItem)
    func layoutCell()
    
    func separator(hidden: Bool, backgroundColor: UIColor)
}

public extension STableViewCellProtocol where Self: UITableViewCell {
    static var cellHeight: CGFloat { return UITableViewAutomaticDimension }
    static var isSeparatorVisible: Bool { return true }
    
    func setCell(item: STableViewItem) {}
    func layoutCell() {}
    
    func separator(hidden: Bool, backgroundColor: UIColor) {
        let value = (hidden ? CGFloat.greatestFiniteMagnitude : 15)
        self.separatorInset = UIEdgeInsets(top: 0, left: value, bottom: 0, right: 0)
        
    }
}

public typealias STableViewCellNibProtocol = NibLoadable & STableViewCellProtocol
