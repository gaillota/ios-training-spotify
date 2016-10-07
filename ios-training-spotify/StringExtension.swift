//
//  StringExtension.swift
//  ios-training-spotify
//
//  Created by Antoine Gaillot on 06/10/16.
//  Copyright © 2016 Antoine Gaillot. All rights reserved.
//

import Foundation

extension String {
    func trim() -> String {
        return self.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
    }
    
    func replace(target: String, with: String) -> String {
        return self.stringByReplacingOccurrencesOfString(target, withString: with)
    }
}
