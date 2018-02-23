//
//  STableViewHeaderFooterProtocol.swift
//  SimpleTableViewWrapper
//
//  Created by Vitor Kawai Sala on 16/02/18.
//

import UIKit
import Reusable

public protocol STableViewHeaderFooterProtocol: Reusable {
    /// The height of the implementing view.
    static var viewHeight: CGFloat { get }
    
    /// Function to set Header/Footer's properties. This will be called on
    /// tableView(tableView:, viewForHeaderInSection: ) or tableView(tableView:, viewForFooterInSection: )
    /// - Parameters:
    ///   - section: The section that this header/footer will be displayed
    ///   - handler: The **STableViewWrapper** that are requesting this header/footer
    ///   - sectionModel: The Section model that are setted on DataSource.
    func setHeaderFooter(forSection section: Int,
                         fromTableViewHandler handler: STableViewWrapper,
                         givenModel sectionModel: STableViewSection)
}

public extension STableViewHeaderFooterProtocol {
    func setHeaderFooter(forSection section: Int,
                         fromTableViewHandler handler: STableViewWrapper,
                         givenModel sectionModel: STableViewSection) {}
}

public typealias STableViewHeaderFooterNibProtocol = STableViewHeaderFooterProtocol & NibLoadable
