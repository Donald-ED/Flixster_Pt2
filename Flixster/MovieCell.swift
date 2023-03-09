//
//  MovieCell.swift
//  Flixster
//
//  Created by Donald Echefu on 3/9/23.
//

import UIKit
import Nuke

class MovieCell: UITableViewCell {

    
    /// Configures the cell's UI for the given track.
    func configure(with movie: Movie) {
        movieNameLabel.text = movie.movieName
        movieInfoLabel.text = movie.overView

        // Load image async via Nuke library image loading helper method
        Nuke.loadImage(with: movie.artworkUrl100, into: movieImageView)
    }

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBOutlet weak var movieNameLabel: UILabel!
    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var movieInfoLabel: UILabel!
}
