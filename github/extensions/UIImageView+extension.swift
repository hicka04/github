//
//  UIImageView+extension.swift
//  github
//
//  Created by hicka04 on 2019/03/11.
//  Copyright © 2019 hicka04. All rights reserved.
//

import UIKit
import Nuke

extension UIImageView {
    
    func load(with url: URL) {
        showAnimatedSkeleton()
        Nuke.loadImage(with: url, into: self) { (_, _) in
            DispatchQueue.main.async {
                self.hideSkeleton()
            }
        }
    }
}
