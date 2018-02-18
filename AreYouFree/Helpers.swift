//
//  Helpers.swift
//  AreYouFree
//
//  Created by Michael White on 2/17/18.
//  Copyright © 2018 Nicolas Salafranca. All rights reserved.
//

import Foundation
import UIKit

extension UITableViewCell {
    static func reuseIdentifier() -> String {
        return String(describing: self)
    }
}

