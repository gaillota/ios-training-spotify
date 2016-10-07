//
//  SearchTableViewController.swift
//  ios-training-spotify
//
//  Created by Antoine Gaillot on 06/10/16.
//  Copyright © 2016 Antoine Gaillot. All rights reserved.
//

import UIKit
import NVActivityIndicatorView
import AlamofireImage

class SearchTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate, NVActivityIndicatorViewable  {

    // MARK: Outlets
    @IBOutlet weak var resultsTableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    // MARK: Properties
    var tracks = [Track]()
    var keywords: String = "beat"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Configuration
        self.resultsTableView.tableFooterView = UIView()
        NVActivityIndicatorView.DEFAULT_TYPE = .Pacman
        
        self.loadData()
        self.searchBar.text = self.keywords
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showResult", let indexPath = self.resultsTableView.indexPathForSelectedRow {
            let track = self.tracks[indexPath.row]
            let targetViewController = segue.destinationViewController as! ResultViewController
            
            targetViewController.track = track
        }
    }

    /* MARK: Table View Data Source */
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("SearchResultCell") as! SearchResultTableViewCell
        let track = self.tracks[indexPath.row]
        
        let url = NSURL(string: track.imageUrl!)
        let placeholder = UIImage(named: "cd")
        
        cell.resultAlbumCoverImageView.af_setImageWithURL(url!, placeholderImage: placeholder)
        cell.resultNameLabel.text = track.name!
        cell.resultAlbumNameLabel.text = track.album!
        cell.resultDurationLabel.text = track.duration!.formatDuration()
        
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.tracks.count
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "Results for: \(self.keywords)"
        }
        
        return nil
    }
    
    /* MARK: Search Bar Delegate */
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        self.searchBar.resignFirstResponder()
        self.keywords = searchBar.text!
        self.loadData()
    }
    
    func loadData() {
        let url = Constants.API.baseUrl + "?" + self.getQueryParams()
        
        self.startAnimating()
        
        TrackRepository.instance.find(url) { (error, tracks) in
            // Remove spinner no matter what
            self.stopAnimating()
            
            if error != nil {
                self.alert("Error while fecthing results")
                return
            }
            
            self.tracks = tracks
            self.resultsTableView.reloadData()
        }
    }
    
    /* MARK: Helpers */
    
    func getQueryParams() -> String {
        return "type=track&limit=10&q=" + self.keywords.trim().replace(" ", with: "+")
    }
}

