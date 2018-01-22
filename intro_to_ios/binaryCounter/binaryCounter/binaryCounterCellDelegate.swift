//
//  binaryCounterCellDelegate.swift
//  binaryCounter
//
//  Created by Seyma Akin on 1/22/18.
//  Copyright © 2018 Seyma Akin. All rights reserved.
//

protocol binaryCounterCellDelegate: class {
    func addButtonPressed(increment: Int)
    func minusButtonPressed(decrement: Int)
}
