//
//  EntryTableViewCell.swift
//  NotificationPatternsJournal
//
//  Created by Garrett Lyons on 3/3/20.
//  Copyright © 2020 Trevor Walker. All rights reserved.
//

import UIKit
///Declaring a protocol and allowing it to use class level objects
protocol EntryTableViewCellDelegate: class {
    ///Creating a job that the boss, TableViewCell, can tell out intern, TableViewController, to do
    func switchedToggledOnCell(cell: EntryTableViewCell)
}
class EntryTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var higherOrLowerLabel: UILabel!
    @IBOutlet weak var isEnabledSwithc: UISwitch!
    
    var entry: Entry?
    ///Creating our runner that will go tell the intern to do something
    weak var delegate: EntryTableViewCellDelegate?
    
    
    func setEntry(entry: Entry, averageHappiness: Int) {
    self.entry = entry
        updateUI(aberageHappiness: averageHappiness)
        createObserver()
    }
    
    func updateUI(aberageHappiness: Int) {
        guard let entry = entry else { return }
        titleLabel.text = entry.title
        isEnabledSwithc.isOn = entry.isIncluded
        
        higherOrLowerLabel.text = entry.happiness >= aberageHappiness ? "Higher" : "Lower"
    }
    
    func createObserver() {
        ///Creating our person who will listen for our notification, then call recalculate Happiness
        NotificationCenter.default.addObserver(self, selector: #selector(recalculateHappiness), name: notificationKey, object: nil)
    }
    
    @objc func recalculateHappiness(notification: NSNotification) {
        guard let averageHappiness = notification.object as? Int else {return}
        updateUI(aberageHappiness: averageHappiness)
    }
    
    @IBAction func toggledIsIncluded(_ sender: Any) {
        ///Telling our runner to go tell our intern to go do something
        delegate?.switchedToggledOnCell(cell: self)
    }
}
