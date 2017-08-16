//
//  File.swift
//  Makestagram
//
//  Created by Mhd Ghaith on 8/8/17.
//  Copyright © 2017 Mhd Ghaith. All rights reserved.
//

import UIKit

class PostHeaderCell: UITableViewCell {
    
    @IBAction func optionsButtonTapped(_ sender: Any) {
        
        print("options button tapped")
    }
    static let height: CGFloat = 54

    
    
    @IBOutlet weak var usernameLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
