//
//  UIView+extension.swift
//  github
//
//  Created by hicka04 on 2019/04/02.
//  Copyright © 2019 hicka04. All rights reserved.
//

import UIKit

extension UIView {
    
    @IBInspectable public var _isSkeletonable: Bool {
        get {
            return isSkeletonable
        }
        set {
            isSkeletonable = newValue
        }
    }
}
