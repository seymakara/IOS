//
//  AddItemTableViewControllerDelegate.swift
//  bucketList
//
//  Created by Seyma Akin on 1/16/18.
//  Copyright © 2018 Seyma Akin. All rights reserved.
//

import Foundation

protocol AddItemTableViewControllerDelegate: class {
    func itemSaved (by controller: AddItemTableViewController, with text: String, at indexPath: NSIndexPath?)
    func cancelButtonPressed(by controller: AddItemTableViewController)
}
