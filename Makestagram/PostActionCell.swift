//
//  PostActionCell.swift
//  Makestagram
//
//  Created by Mhd Ghaith on 8/8/17.
//  Copyright © 2017 Mhd Ghaith. All rights reserved.
//

import Foundation
import UIKit


protocol PostActionCellDelegate: class {
    func didTapLikeButton(_ likeButton: UIButton, on cell: PostActionCell)
}


class PostActionCell: UITableViewCell {
    static let height: CGFloat = 46
    weak var delegate: PostActionCellDelegate?

    
    
    @IBAction func likeButtonTapped(_ sender: UIButton) {
         delegate?.didTapLikeButton(sender, on: self)
    }
    
    @IBOutlet weak var likeCountLabel: UILabel!
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var timeAgoLabel: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    
    
    
    
    
    
}

