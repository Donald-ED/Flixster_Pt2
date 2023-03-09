//
//  ViewController.swift
//  Flixster
//
//  Created by Donald Echefu on 3/9/23.
//
import UIKit

class MovieViewController: UIViewController, UITableViewDataSource {
    
    var movies: [Movie] = []
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.dataSource = self
        
        movies = Movie.mockMovies
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as! MovieCell

        // Get the track that corresponds to the table view row
        let movie = movies[indexPath.row]

        // Configure the cell with it's associated track
        cell.configure(with: movie)

        // return the cell for display in the table view
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the cell that triggered the segue
        if let cell = sender as? UITableViewCell,
           // Get the index path of the cell from the table view
           let indexPath = tableView.indexPath(for: cell),
           // Get the detail view controller
           let viewController = segue.destination as? ViewController {

            // Use the index path to get the associated track
            let movie = movies[indexPath.row]

            // Set the track on the detail view controller
            viewController.movie = movie
        }
    }
}


