//
//  HRPGHabitTableViewCell.swift
//  Habitica
//
//  Created by Phillip Thelen on 09/03/2017.
//  Copyright © 2017 HabitRPG Inc. All rights reserved.
//

import UIKit

class HabitTableViewCell: TaskTableViewCell {

    //swiftlint:disable:next private_outlet
    @IBOutlet weak var plusButton: HRPGHabitButtons!
    //swiftlint:disable:next private_outlet
    @IBOutlet weak var minusButton: HRPGHabitButtons!

    var plusTouched: (() -> Void)?
    var minusTouched: (() -> Void)?

    override func configure(task: Task) {
        super.configure(task: task)
        self.plusButton.configure(for: task, isNegative: false)
        self.plusButton.action({[weak self] in
            self?.scoreUp()
        })
        self.minusButton.configure(for: task, isNegative: true)
        self.minusButton.action({[weak self] in
            self?.scoreDown()
        })
    }
    
    override func applyAccessibility(_ task: Task) {
        super.applyAccessibility(task)
        var customActions = [UIAccessibilityCustomAction]()
        if task.up?.boolValue ?? false {
            customActions.append(UIAccessibilityCustomAction(name: NSLocalizedString("Score habit up", comment: ""), target: self, selector: #selector(scoreUp)))
        }
        if task.down?.boolValue ?? false {
            customActions.append(UIAccessibilityCustomAction(name: NSLocalizedString("Score habit down", comment: ""), target: self, selector: #selector(scoreDown)))
        }
        self.accessibilityCustomActions = customActions
    }
    
    func scoreUp() {
        if let action = plusTouched {
            action()
        }
    }
    
    func scoreDown() {
        if let action = minusTouched {
            action()
        }
    }
}
