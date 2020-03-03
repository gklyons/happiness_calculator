//
//  EntryTableViewCell.swift
//  NotificationPatternsJournal
//
//  Created by Garrett Lyons on 3/3/20.
//  Copyright © 2020 Trevor Walker. All rights reserved.
//

import UIKit

protocol EntryTableViewCellDelegate: class {
    func switchedToggledOnCell(cell: EntryTableViewCell)
}
class EntryTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var higherOrLowerLabel: UILabel!
    @IBOutlet weak var isEnabledSwithc: UISwitch!
    
    var entry: Entry?
    weak var delegate: EntryTableViewCellDelegate?
    
    func setEntry(entry: Entry, averageHappiness: Int) {
    self.entry = entry
        updateUI(aberageHappiness: averageHappiness)
    }
    
    @objc func updateUI(aberageHappiness: Int) {
        guard let entry = entry else { return }
        titleLabel.text = entry.title
        isEnabledSwithc.isOn = entry.isIncluded
        
        higherOrLowerLabel.text = entry.happiness >= aberageHappiness ? "Higher" : "Lower"
    }
    
    func createObserver() {
        NotificationCenter.default.addObserver(self, selector: #selector(updateUI), name: notificationKey, object: nil)
    }
    
    @IBAction func toggledIsIncluded(_ sender: Any) {
        delegate?.switchedToggledOnCell(cell: self)
    }
}
