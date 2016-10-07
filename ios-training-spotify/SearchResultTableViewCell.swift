//
//  SearchResultTableViewCell.swift
//  ios-training-spotify
//
//  Created by Antoine Gaillot on 06/10/16.
//  Copyright © 2016 Antoine Gaillot. All rights reserved.
//

import UIKit

class SearchResultTableViewCell: UITableViewCell {

    // MARK: Outlets
    @IBOutlet weak var resultAlbumCoverImageView: UIImageView!
    @IBOutlet weak var resultNameLabel: UILabel!
    @IBOutlet weak var resultAlbumNameLabel: UILabel!
    @IBOutlet weak var resultDurationLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
