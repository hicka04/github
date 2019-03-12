//
//  String+extension.swift
//  github
//
//  Created by hicka04 on 2019/03/12.
//  Copyright © 2019 hicka04. All rights reserved.
//

import Foundation

extension String {
    
    init(from date: Date, dateStyle: DateFormatter.Style, timeStyle: DateFormatter.Style) {
        self = DateFormatter.localizedString(from: date,
                                             dateStyle: dateStyle,
                                             timeStyle: timeStyle)
    }
}
