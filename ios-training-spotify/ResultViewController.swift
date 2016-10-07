//
//  ResultViewController.swift
//  ios-training-spotify
//
//  Created by Antoine Gaillot on 06/10/16.
//  Copyright © 2016 Antoine Gaillot. All rights reserved.
//

import UIKit
import KDEAudioPlayer

class ResultViewController: UIViewController, AudioPlayerDelegate {
    // MARK: Outlets
    @IBOutlet weak var albumCoverImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var albumNameLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var playButton: UIButton!
    
    // MARK: Properties
    var track: Track?
    let player: AudioPlayer = AudioPlayer()
    var song: AudioItem?
    var isPlaying: Bool = false
    var isPaused: Bool = false

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        /* Setup the delegates */
        self.player.delegate = self
        
        let url = NSURL(string: self.track!.imageUrl!)
        let placeholder = UIImage(named: "cd")
        
        self.albumCoverImageView.af_setImageWithURL(url!, placeholderImage: placeholder)
        self.nameLabel.text = self.track?.name
        self.albumNameLabel.text = self.track?.album
        self.durationLabel.text = self.track?.duration!.formatDuration()
        
        self.song = AudioItem(highQualitySoundURL: NSURL(string: self.track!.previewUrl!))
    }
    
    func audioPlayer(audioPlayer: AudioPlayer, didChangeStateFrom from: AudioPlayerState, toState to: AudioPlayerState) {
        if to == .Paused {
            self.setPlayButtonTitle("Play")
            return
        }
        
        if to == .Playing || to == .Stopped {
            if to == .Stopped {
                self.isPlaying = false
            }
            self.setPlayButtonTitle("Pause")
        }
        
        if to == .Buffering {
            self.setPlayButtonTitle("Loading...")
        }
    }
    
    /* MARK: Actions */
    
    @IBAction func playButtonAction(sender: UIButton) {
        // Song has never been played
        if !self.isPlaying {
            self.player.playItem(self.song!)
            self.isPlaying = true
            self.isPaused = false
            return
        }
        
        // Song is paused
        if self.isPaused {
            self.player.resume()
            self.isPlaying = true
            self.isPaused = false
            return
        }
        
        // Song is playing
        self.player.pause()
        self.isPlaying = true
        self.isPaused = true
    }
    
    /* MARK: Helpers */
    
    func setPlayButtonTitle(to: String) {
        self.playButton.setTitle(to, forState: .Normal)
    }
}
