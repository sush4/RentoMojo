//
//  StringExtension.swift
//  m
//
//  Created by Sushant kumar on 09/01/18.
//  Copyright © 2018 Sushant kumar. All rights reserved.
//

import Foundation

extension String {
    var localized: String {
        return NSLocalizedString(self, tableName: nil, bundle: Bundle.main, value: "", comment: "")
    }
}
