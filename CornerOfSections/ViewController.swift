//
//  ViewController.swift
//  CornerOfSections
//
//  Created by 张毅成 on 2019/8/5.
//  Copyright © 2019 张毅成. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let arrayData = [[""], ["", ""], ["", "", ""]]
    
    
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height), style: .grouped)
        tableView.tableFooterView = UIView()
        tableView.register(TableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(tableView)
    }


}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return arrayData.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayData[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        cell.textLabel?.text = "\(indexPath.row)"
        cell.accessoryType = .disclosureIndicator
        if indexPath.section == 0 {
            cell.position = .solo
        }else if indexPath.row == 0 {
            cell.position = .first
        }else if (indexPath.row == arrayData[indexPath.section].count - 1) {
            cell.position = .last
        }else{
            cell.position = .middle
        }
        return cell
    }
    
}

