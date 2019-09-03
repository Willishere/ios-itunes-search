//
//  ResultsTableViewCell.swift
//  iTunes App
//
//  Created by William Chen on 9/3/19.
//  Copyright © 2019 William Chen. All rights reserved.
//

import UIKit

class ResultsTableViewCell: UITableViewCell {
        
        @IBOutlet weak var titleLabel: UILabel!
        @IBOutlet weak var creatorLabel: UILabel!
        
        
        var searchResult: SearchResult? {
            didSet {
                updateViews()
            }
        }
        
        func updateViews() {
            guard let searchResult = searchResult else { return }

            titleLabel.text = searchResult.title
            creatorLabel.text = searchResult.creator
            
        }
}
