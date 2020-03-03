//
//  EntryTableViewCell.swift
//  NotificationPatternsJournal
//
//  Created by Garrett Lyons on 3/3/20.
//  Copyright © 2020 Trevor Walker. All rights reserved.
//

import UIKit

class EntryTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var higherOrLowerLabel: UILabel!
    @IBOutlet weak var isEnabledSwithc: UISwitch!
    
    var entry: Entry?
    
    func setEntry(entry: Entry, averageHappiness: Int) {
    self.entry = entry
    }
    
    func updateUI(aberageHappiness: Int) {
        guard let entry = entry else { return }
        titleLabel.text = entry.title
        isEnabledSwithc.isOn = entry.isIncluded
    }
}
