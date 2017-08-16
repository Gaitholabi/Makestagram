//
//  ChatListCell.swift
//  Makestagram
//
//  Created by Mhd Ghaith on 8/10/17.
//  Copyright © 2017 Mhd Ghaith. All rights reserved.
//

import UIKit

class ChatListCell: UITableViewCell {
    
    // MARK: - Cell Lifcycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    // MARK: - IBActions
    
    @IBAction func dismissButtonTapped(_ sender: UIBarButtonItem) {
        print("dismiss button tapped")
    }
    
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var lastMessageLabel: UILabel!
    
}
