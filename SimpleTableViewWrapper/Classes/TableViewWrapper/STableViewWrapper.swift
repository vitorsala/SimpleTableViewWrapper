//
//  STableViewWrapper.swift
//  SimpleTableViewWrapper
//
//  Created by Vitor Kawai Sala on 16/02/18.
//

import UIKit
import Reusable

private enum ViewType {
    case header
    case footer
}

public class STableViewWrapper: NSObject {
    private weak var tableView: UITableView?
    
    /// The sections contained by this wrapper
    public var sections: [STableViewSection]
    
    public var backgroundColor: UIColor {
        get {
            return self.tableView?.backgroundColor ?? .clear
        }
        set {
            self.tableView?.backgroundColor = newValue
        }
    }
    
    public init(sections: [STableViewSection] = []) {
        self.sections = sections
        super.init()
    }
}

extension STableViewWrapper {
    
    /// The setup function.
    ///
    /// This function must be called in order to the TableView be displayed correctly
    ///
    /// - Parameter tableView: The **UITableView** that will be used.
    public func setup(tableView: UITableView) {
        self.tableView = tableView
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 150
        
        self.register(sections: self.sections, for: tableView)
    }
    
    /// Reaload TableView's datasource, use this function instead of native's TableView to ensure
    /// that all items's cell are correctly registered
    public func reloadData() {
        guard let tableView = self.tableView else { return }
        self.register(sections: self.sections, for: tableView)
        tableView.reloadData()
    }
}

extension STableViewWrapper {
    private func registerHeaderFooter(forSection section: STableViewSection, for tableView: UITableView) {
        if let header = section.headerType {
            tableView.register(headerFooter: header)
        }
        if let footer = section.footerType {
            tableView.register(headerFooter: footer)
        }
    }
    
    private func register(items: [STableViewItem], for tableView: UITableView) {
        items.forEach {
            if let cellType = $0.cellType {
                tableView.register(cell: cellType)
            }
        }
    }
    
    private func registerOthersElements(for tableView: UITableView) {
        tableView.register(cell: EmptyStubTableViewCell.self)
    }
    
    private func register(sections: [STableViewSection], for tableView: UITableView) {
        sections.forEach {
            self.registerHeaderFooter(forSection: $0, for: tableView)
            self.register(items: $0.items, for: tableView)
        }
        self.registerOthersElements(for: tableView)
    }
}

extension STableViewWrapper {
    func append(section: STableViewSection) {
        guard let tableView = self.tableView else { return }
        self.register(sections: [section], for: tableView)
        self.sections.append(section)
    }
    
    func append(sections: [STableViewSection]) {
        guard let tableView = self.tableView else { return }
        self.register(sections: sections, for: tableView)
        self.sections.append(contentsOf: sections)
    }
    
    func remove(sectionAt index: Int) {
        self.sections.remove(at: index)
    }
}

extension STableViewWrapper: UITableViewDelegate {
    private func view(type: ViewType, for tableView: UITableView, at section: Int) -> UIView? {
        let currentSection = self.sections[section]
        guard let reference = (type == .header ? currentSection.headerType : currentSection.footerType) else { return nil }
        let view = tableView.dequeueReusableHeaderFooterView(reference)
        
        view.setHeaderFooter(forSection: section,
                             fromTableViewHandler: self,
                             givenModel: currentSection)
        
        return view
    }
    
    public func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard let cell = cell as? STableViewCellProtocol else { return }
        let item = self.sections[indexPath.section].items[indexPath.row]
        item.perform(action: .show)
        cell.separator(hidden: !item.isSeparatorVisible, backgroundColor: self.backgroundColor)
        cell.layoutCell()
    }
    
    public func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return self.sections[section].headerType?.viewHeight ?? 0
    }
    
    public func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return self.sections[section].footerType?.viewHeight ?? 0
    }
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.sections[indexPath.section].items[indexPath.row].cellType?.cellHeight ?? 0
    }
    
    public func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = self.view(type: .header, for: tableView, at: section)
        return header
    }
    
    public func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footer = self.view(type: .footer, for: tableView, at: section)
        return footer
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = self.sections[indexPath.section].items[indexPath.row]
        tableView.deselectRow(at: indexPath, animated: false)
        item.perform(action: .selection)
    }
}

extension STableViewWrapper: UITableViewDataSource {
    public func numberOfSections(in tableView: UITableView) -> Int {
        return self.sections.count
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.sections[section].items.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = self.sections[indexPath.section].items[indexPath.row]
        let cell = tableView.dequeueReusableCell(for: item, at: indexPath)
        cell.setCell(item: item)
        return cell
    }
}
