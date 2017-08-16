//
//  ProfileHeaderView.swift
//  Makestagram
//
//  Created by Mhd Ghaith on 8/10/17.
//  Copyright © 2017 Mhd Ghaith. All rights reserved.
//

import UIKit


protocol ProfileHeaderViewDelegate: class {
    func didTapSettingsButton(_ button: UIButton, on headerView: ProfileHeaderView)
}

class ProfileHeaderView: UICollectionReusableView {
    
    @IBOutlet weak var followingCountLabel: UILabel!

    @IBOutlet weak var followerCountLabel: UILabel!
    
    @IBOutlet weak var postCountLabel: UILabel!
    
    @IBOutlet weak var settingsButton: UIButton!
    
    weak var delegate: ProfileHeaderViewDelegate?

    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
        settingsButton.layer.cornerRadius = 6
        settingsButton.layer.borderColor = UIColor.lightGray.cgColor
        settingsButton.layer.borderWidth = 1
    }
    
    @IBAction func settingsButtonTapped(_ sender: UIButton) {
        delegate?.didTapSettingsButton(sender, on: self)

    }
    
    
    
}
