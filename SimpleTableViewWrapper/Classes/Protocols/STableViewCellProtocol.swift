//
//  STableViewCellProtocol.swift
//  SimpleTableViewWrapper
//
//  Created by Vitor Kawai Sala on 16/02/18.
//

import UIKit
import Reusable

public protocol STableViewCellProtocol: Reusable {
    /// The cell's height.
    ///
    /// If this propety is not overriden, it will default to
    /// **UITableViewAutomaticDimension**
    static var cellHeight: CGFloat { get }
    
    /// Protocol function to allow cell's properties to be safely setted.
    ///
    /// This function will be called on tableView(tableView:, cellForRowAt:) cycle
    /// - Parameter item: The containing item setted at IndexPath
    func setCell(item: STableViewItem)
    
    /// This function will be called on tableView(tableView:, willDisplay:, forRowAt: )
    ///
    /// Use this function to make final layout adjustments for cells that need to adapt
    /// to constraints before its properties get setted through setCell(item: )
    func layoutCell()
    
    /// An helper function to cells that should not show separator lines.
    ///
    /// It already have an default implementation to adjust its
    /// EdgeInsets to be offscreen.
    /// - Parameters:
    ///   - hidden: An *Bool* indicating if the indicator should be hidden
    ///   - backgroundColor: An **UIColor** containing the **ViewController**'s background color
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
