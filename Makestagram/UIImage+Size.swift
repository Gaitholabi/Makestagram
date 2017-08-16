//
//  UIImage+Size.swift
//  Makestagram
//
//  Created by Mhd Ghaith on 8/8/17.
//  Copyright © 2017 Mhd Ghaith. All rights reserved.
//

import Foundation

import UIKit

extension UIImage {
    var aspectHeight: CGFloat {
        let heightRatio = size.height / 736
        let widthRatio = size.width / 414
        let aspectRatio = fmax(heightRatio, widthRatio)
        
        return size.height / aspectRatio
    }
}