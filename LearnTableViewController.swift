//
//  LearnTableViewController.swift
//  qwerty5
//
//  Created by Арсений on 22.04.2020.
//  Copyright © 2020 Арсений. All rights reserved.
//

import UIKit

class LearnTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("THE SELECTED SECTION IS: \(indexPath.section)")
    }
}
