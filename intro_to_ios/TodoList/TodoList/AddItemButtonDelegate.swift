//
//  File.swift
//  todoList
//
//  Created by Seyma Akin on 1/23/18.
//  Copyright © 2018 Seyma Akin. All rights reserved.
//

import UIKit

protocol AddItemButtonDelegate:class {
    
    func AddButtonPressed(by controller: AddViewController, with title:String, with detail:String, with date:Date)
}
