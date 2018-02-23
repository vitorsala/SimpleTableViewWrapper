//
//  EmptyStubTableViewCell.swift
//  SimpleTableViewWrapper
//
//  Created by Vitor Kawai Sala on 19/02/18.
//

import UIKit

public final class EmptyStubTableViewCell: UITableViewCell {}
extension EmptyStubTableViewCell: STableViewCellProtocol {
    public static var cellHeight: CGFloat { return 0 }
}
