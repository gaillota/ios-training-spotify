//
//  TrackFactory.swift
//  PokemonTest
//
//  Created by Antoine Gaillot on 05/10/16.
//  Copyright © 2016 Antoine Gaillot. All rights reserved.
//

import SwiftyJSON

class TrackFactory {
    static let instance = TrackFactory()
    
    func createTracksFromArray(array tracksArray: [JSON]) -> [Track] {
        var tracks = [Track]()
        
        for trackJson in tracksArray {
            if let track = createTrackFromJson(trackJson) {
                tracks.append(track)
            }
        }
        
        return tracks
    }
    
    func createTrackFromJson(json: JSON) -> Track? {
        var track = Track()
        
        track.id = json["id"].string
        track.imageUrl = json["album"]["images"].array![0]["url"].string
        track.album = json["album"]["name"].string
        track.name = json["name"].string
        track.popularity = json["popularity"].int
        track.duration = json["duration_ms"].int
        track.previewUrl = json["preview_url"].string
        
        return track.validate() ? track : nil
    }
}
