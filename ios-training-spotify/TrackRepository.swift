//
//  TrackRepository.swift
//  PokemonTest
//
//  Created by Antoine Gaillot on 05/10/16.
//  Copyright © 2016 Antoine Gaillot. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class TrackRepository {
    static let instance = TrackRepository()
    
    func findByKeywords(keywords: String) {
        
    }
    
    func find(url: String, callback: (error: NSError?, tracks: [Track]) -> Void) {
        var tracks = [Track]()
        Alamofire.request(.GET, url).validate().responseJSON { response in
            switch response.result {
            case .Success(let value):
                let json = JSON(value)
                
                if let tracksJson = json["tracks"]["items"].array {
                    tracks = TrackFactory.instance.createTracksFromArray(array: tracksJson)
                }
                
                callback(error: nil, tracks: tracks)
            case .Failure(let error):
                callback(error: error, tracks: tracks)
            }
        }
    }
}