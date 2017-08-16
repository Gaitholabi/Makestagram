//
//  UITableView+Utility.swift
//  Makestagram
//
//  Created by Mhd Ghaith on 8/9/17.
//  Copyright © 2017 Mhd Ghaith. All rights reserved.
//

import Foundation
import UIKit

protocol CellIdentifiable {
    static var cellIdentifier: String { get }
}


extension CellIdentifiable where Self: UITableViewCell {
    // 2
    static var cellIdentifier: String {
        return String(describing: self)
    }
}

// 3
extension UITableViewCell: CellIdentifiable { }

extension UITableView {
    func dequeueReusableCell<T: UITableViewCell>() -> T where T: CellIdentifiable {
        // 2
        guard let cell = dequeueReusableCell(withIdentifier: T.cellIdentifier) as? T else {
            // 3
            fatalError("Error dequeuing cell for identifier \(T.cellIdentifier)")
        }
        
        return cell
    }
}
