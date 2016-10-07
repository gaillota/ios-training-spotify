//
//  Track.swift
//  PokemonTest
//
//  Created by Antoine Gaillot on 05/10/16.
//  Copyright © 2016 Antoine Gaillot. All rights reserved.
//

import Foundation

struct Track {
    var id: String?
    var imageUrl: String?
    var name: String?
    var album: String?
    var popularity: Int?
    var duration: Int?
    var previewUrl: String?
    
    func validate() -> Bool {
        return self.id != nil && self.imageUrl != nil && self.name != nil && self.album != nil && self.popularity != nil && self.duration != nil && self.previewUrl != nil
    }
}
