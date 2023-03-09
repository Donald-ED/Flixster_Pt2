//
//  Track.swift
//  Flixster
//
//  Created by Donald Echefu on 3/9/23.
//

import Foundation

struct Movie {
    let movieName: String
    let overView: String
    let artworkUrl100: URL
    let voteAverage: String
    let vote: String
    let popularity: String
}

extension Movie {

    /// An array of mock tracks
    static var mockMovies: [Movie]  = [
        Movie(movieName: "Knock at the Cabin",
              overView: "While vacationing at a remote cabin, a young girl and her two fathers are taken hostage by four armed strangers who demand that the family make an unthinkable choice to avert the apocalypse. With limited access to the outside world, the family must decide what they believe before all is lost.",
              artworkUrl100: URL(string:"https://www.themoviedb.org/t/p/w1280/dm06L9pxDOL9jNSK4Cb6y139rrG.jpg")!,
              voteAverage: "Votes Average 6.5",
              vote: "Vote 884",
              popularity: "Popularity 3422.537"),
        Movie(movieName: "Black Panther: Wakanda Forever",
              overView: "Queen Ramonda, Shuri, M’Baku, Okoye and the Dora Milaje fight to protect their nation from intervening world powers in the wake of King T’Challa’s death.  As the Wakandans strive to embrace their next chapter, the heroes must band together with the help of War Dog Nakia and Everett Ross and forge a new path for the kingdom of Wakanda.",
              artworkUrl100: URL(string:"https://www.themoviedb.org/t/p/w188_and_h282_bestv2/sv1xJUazXeYqALzczSZ3O6nkH75.jpg")!,
              voteAverage: "Votes Average 7.3",
              vote: "Vote 3922",
              popularity: "Popularity 2525.408"),
        Movie(movieName: "Puss in Boots: The Last Wish",
              overView: "Puss in Boots discovers that his passion for adventure has taken its toll: He has burned through eight of his nine lives, leaving him with only one life left. Puss sets out on an epic journey to find the mythical Last Wish and restore his nine lives.",
              artworkUrl100: URL(string:"https://www.themoviedb.org/t/p/w1280/kuf6dutpsT0vSVehic3EZIqkOBt.jpg")!,
              voteAverage: "Votes Average 8.4",
              vote: "Vote 4358",
              popularity: "Popularity 2158.063"),
        Movie(movieName: "Attack on Titan",
              overView: "Several hundred years ago, humans were nearly exterminated by Titans. Titans are typically several stories tall, seem to have no intelligence, devour human beings and, worst of all, seem to do it for the pleasure rather than as a food source. A small percentage of humanity survived by walling themselves in a city protected by extremely high walls, even taller than the biggest Titans. Flash forward to the present and the city has not seen a Titan in over 100 years. Teenage boy Eren and his foster sister Mikasa witness something horrific as the city walls are destroyed by a Colossal Titan that appears out of thin air. As the smaller Titans flood the city, the two kids watch in horror as their mother is eaten alive. Eren vows that he will murder every single Titan and take revenge for all of mankind.",
              artworkUrl100: URL(string:"https://www.themoviedb.org/t/p/w600_and_h900_bestv2/sHim6U0ANsbzxcmNRYuIubBVQaz.jpg")!,
              voteAverage: "Votes Average 8.4",
              vote: "Vote 4358",
              popularity: "Popularity 1104.761"),
        Movie(movieName: "Ant-Man and the Wasp: Quantumania",
              overView: "Super-Hero partners Scott Lang and Hope van Dyne, along with with Hope's parents Janet van Dyne and Hank Pym, and Scott's daughter Cassie Lang, find themselves exploring the Quantum Realm, interacting with strange new creatures and embarking on an adventure that will push them beyond the limits of what they thought possible.",
              artworkUrl100: URL(string:"https://www.themoviedb.org/t/p/w600_and_h900_bestv2/ngl2FKBlU4fhbdsrtdom9LVLBXw.jpg")!,
              voteAverage: "Votes Average 6.4",
              vote: "Vote 924",
              popularity: "Popularity 925.734")
    ]

    // We can now access this array of mock tracks anywhere like this:
}
