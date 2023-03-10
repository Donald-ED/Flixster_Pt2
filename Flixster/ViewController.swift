//
//  ViewController.swift
//  Flixster
//
//  Created by Donald Echefu on 3/9/23.
//

import UIKit
import Nuke

class ViewController: UIViewController {

    // A property to store the track object.
    // We can set this property by passing along the track object associated with the track the user tapped in the table view.
    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var movieNameLabel: UILabel!
    @IBOutlet weak var votesAverage: UILabel!
    @IBOutlet weak var votes: UILabel!
    @IBOutlet weak var popularity: UILabel!
    @IBOutlet weak var overView: UILabel!
    
    var movie: Movie!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Load the image located at the `artworkUrl100` URL and set it on the image view.
        Nuke.loadImage(with: movie.artworkUrl100, into: movieImageView)

        // Set labels with the associated track values.
        overView.text = movie.overview
        movieNameLabel.text = movie.title
        votesAverage.text = "Vote Average " + String(movie.vote_average)
        votes.text = "Votes " + String(movie.vote_count)
        popularity.text = "Popularity " + String(movie.popularity)
//
//        // Create a date formatter to style our date and convert it to a string
//        let dateFormatter = DateFormatter()
//        dateFormatter.dateStyle = .medium
//        releaseDateLabel.text = dateFormatter.string(from: track.releaseDate)
//
//        // Use helper method to convert milliseconds into `mm:ss` string format
//        durationLabel.text = formattedTrackDuration(with: track.trackTimeMillis)

    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
