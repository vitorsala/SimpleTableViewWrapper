//
//  UITableView+WrapperUtils.swift
//  SimpleTableViewWrapper
//
//  Created by Vitor Kawai Sala on 16/02/18.
//

import UIKit

extension UITableView {
    final func register(cell: (UITableViewCell & STableViewCellProtocol).Type) {
        if let nibLoadable = cell as? STableViewCellNibProtocol.Type {
            self.register(nibLoadable.nib, forCellReuseIdentifier: nibLoadable.reuseIdentifier)
        } else {
            self.register(cell, forCellReuseIdentifier: cell.reuseIdentifier)
        }
    }
    
    final func register(headerFooter: (UITableViewHeaderFooterView & STableViewHeaderFooterProtocol).Type) {
        if let nibLoadable = headerFooter as? STableViewCellNibProtocol.Type {
            self.register(nibLoadable.nib, forCellReuseIdentifier: nibLoadable.reuseIdentifier)
            
        } else {
            self.register(headerFooter, forCellReuseIdentifier: headerFooter.reuseIdentifier)
        }
    }
    
    final func dequeueReusableCell(for item: STableViewItem, at indexPath: IndexPath) -> (UITableViewCell & STableViewCellProtocol) {
        
        guard let cellType = item.cellType else {
            fatalError("Item don't contain any cell")
        }
        guard let cell = self.dequeueReusableCell(withIdentifier: cellType.reuseIdentifier, for: indexPath) as? (UITableViewCell & STableViewCellProtocol) else {
            
            fatalError("Cell must conform to either STableViewCellProtocol or STableViewCellNibProtocol")
        }
        return cell
    }
    
    final func dequeueReusableHeaderFooterView(_ headerFooter: (UITableViewHeaderFooterView & STableViewHeaderFooterProtocol).Type) -> (UITableViewHeaderFooterView & STableViewHeaderFooterProtocol) {
        guard let view = self.dequeueReusableHeaderFooterView(withIdentifier: headerFooter.reuseIdentifier) as? (UITableViewHeaderFooterView & STableViewHeaderFooterProtocol) else {
            
            fatalError("Header/Footer must conform to either STableViewHeaderFooterProtocol or STableViewHeaderFooterNibProtocol")
        }
        return view
    }
}
