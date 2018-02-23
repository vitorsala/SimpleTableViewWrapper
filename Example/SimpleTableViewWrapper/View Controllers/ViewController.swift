//
//  ViewController.swift
//  SimpleTableViewWrapper
//
//  Created by vitorsala on 02/16/2018.
//  Copyright (c) 2018 vitorsala. All rights reserved.
//

import UIKit
import SimpleTableViewWrapper

class ViewController: UIViewController {
    @IBOutlet private weak var tableView: UITableView!
    private var wrapper: STableViewWrapper?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.wrapper = STableViewWrapper(sections: self.sections())
        self.wrapper?.setup(tableView: self.tableView)
    }
}

extension ViewController {
    private func sections() -> [STableViewSection] {
        let sections: [STableViewSection] = [
            STableViewSection(items: self.items()),
            STableViewSection(title: "Full Section Example",
                              items: self.items2(),
                              headerType: SimpleTableViewHeader.self,
                              footerType: SimpleTableViewFooter.self),
            STableViewSection(title: "Show Events Example",
                              items: self.items3(),
                              headerType: SimpleTableViewHeader.self)
        ]
        return sections
    }
    
    private func items() -> [STableViewItem] {
        let items: [SimpleItem] = (0..<10).map {
            let item = SimpleItem(name: "Item \($0)")
            item.onSelection = { [unowned self] selectedItem in
                guard let it = selectedItem as? SimpleItem else { return }
                self.showAlert(msg: "Selected \(it.name)")
            }
            return item
        }
        return items
    }
    
    private func items2() -> [STableViewItem] {
        let items: [SimpleItem] = (0..<10).map {
            let item = SimpleItem(name: "Item \($0)")
            item.cellType = SimpleTableViewCellWithNib.self
            item.onSelection = { [unowned self] selectedItem in
                guard let it = selectedItem as? SimpleItem else { return }
                self.showAlert(msg: "Selected \(it.name)")
            }
            return item
        }
        return items
    }
    
    private func items3() -> [STableViewItem] {
        let item = SimpleItem(name: "Mad Item")
        item.cellType = SimpleTableViewCellWithNib.self
        item.onSelection = { [unowned self] selectedItem in
            guard let it = selectedItem as? SimpleItem else { return }
            self.showAlert(msg: "Selected \(it.name)")
        }
        item.onShow = { [unowned self] sitem in
            guard let it = sitem as? SimpleItem else { return }
            self.showAlert(msg: "An wild \(it.name) appeared!")
        }
        return [item]
    }
}

extension ViewController {
    func showAlert(msg: String) {
        let controller = UIAlertController(title: "Alert", message: msg, preferredStyle: .alert)
        let closeAction = UIAlertAction(title: "Close", style: .default) { _ in
            controller.dismiss(animated: true, completion: nil)
        }
        controller.addAction(closeAction)
        self.present(controller, animated: true, completion: nil)
    }
}
