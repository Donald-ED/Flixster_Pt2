//
//  NowViewController.swift
//  Flixster
//
//  Created by Donald Echefu on 3/11/23.
//

import UIKit
import Nuke

class NowViewController: UIViewController, UICollectionViewDataSource {

    var nowplaying: [NowPlaying] = []

    @IBOutlet weak var collectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()

        let url = URL(string: "https://api.themoviedb.org/3/movie/now_playing?api_key=dfeb8930f4e1d7cc2e4d9f9e60a4e1e1")!
        let request = URLRequest(url: url)

        let task = URLSession.shared.dataTask(with: request) { [weak self] data, response, error in

            // Handle any errors
            if let error = error {
                print("❌ Network error: \(error.localizedDescription)")
            }

            // Make sure we have data
            guard let data = data else {
                print("❌ Data is nil")
                return
            }

            // Create a JSON Decoder
            let decoder = JSONDecoder()
            do {
                // Try to parse the response into our custom model
                let response = try decoder.decode(NowPlayingResponse.self, from: data)
                let nowplaying = response.results
                DispatchQueue.main.async {
                    self?.nowplaying = nowplaying
                    self?.collectionView.reloadData()
                }
            } catch let DecodingError.dataCorrupted(context) {
                print(context)
            } catch let DecodingError.keyNotFound(key, context) {
                print("Key '\(key)' not found:", context.debugDescription)
                print("codingPath:", context.codingPath)
            } catch let DecodingError.valueNotFound(value, context) {
                print("Value '\(value)' not found:", context.debugDescription)
                print("codingPath:", context.codingPath)
            } catch let DecodingError.typeMismatch(type, context)  {
                print("Type '\(type)' mismatch:", context.debugDescription)
                print("codingPath:", context.codingPath)
            } catch {
                print("error: ", error)
            }
        }

        // Initiate the network request
        task.resume()
        collectionView.dataSource = self
        // Get a reference to the collection view's layout
        // We want to dynamically size the cells for the available space and desired number of columns.
        // NOTE: This collection view scrolls vertically, but collection views can alternatively scroll horizontally.
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout

        // The minimum spacing between adjacent cells (left / right, in vertical scrolling collection)
        // Set this to taste.
        layout.minimumInteritemSpacing = 4

        // The minimum spacing between adjacent cells (top / bottom, in vertical scrolling collection)
        // Set this to taste.
        layout.minimumLineSpacing = 4

        // Set this to however many columns you want to show in the collection.
        let numberOfColumns: CGFloat = 3

        // Calculate the width each cell need to be to fit the number of columns, taking into account the spacing between cells.
        let width = (collectionView.bounds.width - layout.minimumInteritemSpacing * (numberOfColumns - 1)) / numberOfColumns

        // Set the size that each tem/cell should display at
        layout.itemSize = CGSize(width: width, height: width)
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        nowplaying.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "NowCell", for: indexPath) as! NowCell

        // Get the track that corresponds to the table view row
        let nowplaying = nowplaying[indexPath.row]

        // Configure the cell with it's associated track
        // Get the artwork image url
        let imageUrl = nowplaying.artworkUrl100

        // Set the image on the image view of the cell
        Nuke.loadImage(with: imageUrl, into: cell.NowimageView)

        // return the cell for display in the table view
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the cell that triggered the segue
        if let cell = sender as? UICollectionViewCell,
           // Get the index path of the cell from the table view
           let indexPath = collectionView.indexPath(for: cell),
           // Get the detail view controller
           let viewController = segue.destination as? ViewController {

            // Use the index path to get the associated track
            let nowplaying = nowplaying[indexPath.row]
            let tempMovie = createMoviefromNowplaying(nowplaying)
            // Set the track on the detail view controller
            viewController.movie = tempMovie
        }
    }
    
    func createMoviefromNowplaying(_ nowplaying: NowPlaying) -> Movie {
        return Movie(title: nowplaying.title, overview: nowplaying.overview, poster_path: nowplaying.poster_path, vote_average: nowplaying.vote_average, vote_count: nowplaying.vote_count, popularity: nowplaying.popularity, release_date: nowplaying.release_date)
    }

}
