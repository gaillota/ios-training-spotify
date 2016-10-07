//
//  IntExtension.swift
//  ios-training-spotify
//
//  Created by Antoine Gaillot on 06/10/16.
//  Copyright © 2016 Antoine Gaillot. All rights reserved.
//

import Foundation

extension Int {
    func formatDuration() -> String {
        let minutes = Int(floor(Double(self) / 60000))
        let seconds = Int((self % 60000) / 1000)
        
        return "\(minutes):" + (seconds < 10 ? "0" : "") + "\(seconds)"
    }
}