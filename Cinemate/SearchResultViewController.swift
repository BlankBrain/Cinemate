//
//  SearchResultViewController.swift
//  Cinemate
//
//  Created by Md. Mehedi Hasan on 30/1/20.
//  Copyright © 2020 Md. Mehedi Hasan. All rights reserved.
//

import UIKit
import Alamofire 

class SearchResultViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var imdbRatingLabel: UILabel!
    @IBOutlet weak var tomatoesRatingLabel: UILabel!
    @IBOutlet weak var MetacriticRatingLabel: UILabel!
    @IBOutlet weak var plotTextView: UITextView!
    @IBOutlet weak var actorsTextView: UITextView!
    @IBOutlet var productionLabel: UIView!
    @IBOutlet weak var boxOfficeLabel: UILabel!
    var selectedMovieImdbId = "tt3896198"
    var url:String = "http://www.omdbapi.com/?apikey=df031d45&i="
    let decoder = JSONDecoder()
    var selectedMovie = Movie(Title: "", Year: "", Rated: "", Released: "", Runtime: "", Genre: "", Director: "", Writer: "", Actors: "", Plot: "", Language: "", Country: "", Awards: "", Poster: "", Metascore: "", imdbRating: "", imdbVotes: "", imdbID: "", Type: "", DVD: "", BoxOffice: "", Production: "", Website: "", Response: " ")
    
    
    override func viewDidLoad() {
        AF.request(url + selectedMovieImdbId).responseJSON{ response in
            
                    do{
                     
                        let selectedMovie = try self.decoder.decode(Movie.self , from: response.data! )
                      //  self.movieSearchResult1 = movieSearchResult1
              //object where the data will be saved >>    decoder method. decode ( model , from data object )

                        print(selectedMovie)
                        self.selectedMovie = selectedMovie
                        self.titleLabel.text = selectedMovie.Title
                        self.dateLabel.text = "Relesed On :" + selectedMovie.Released!
                        self.imdbRatingLabel.text = "imdb Rating:" + selectedMovie.imdbRating!
                        self.tomatoesRatingLabel.text = "Rotten Tomatoes :" + selectedMovie.Ratings[1].Value!
                        self.MetacriticRatingLabel.text = "Meta Score"  + selectedMovie.Metascore!
                        self.plotTextView.text = selectedMovie.Plot
                        self.actorsTextView.text = "Actors :" + selectedMovie.Actors!
                        self.boxOfficeLabel.text = selectedMovie.BoxOffice
                        let fileUrl = URL(string: selectedMovie.Poster!)
                        UIImage.downloadFromRemoteURL(fileUrl!, completion: { image, error in
                            guard let image = image, error == nil else { print(error);return }
                            self.posterImageView.image = image
                        })
                    }catch{
                        print("error parsing json data")  }

                    }
        super.viewDidLoad()

    }
    



}
extension UIImage {
    static func downloadFromRemoteURL(_ url: URL, completion: @escaping (UIImage?,Error?)->()) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil, let image = UIImage(data: data) else {
                DispatchQueue.main.async{
                    completion(nil,error)
                }
                return
            }
            DispatchQueue.main.async() {
                completion(image,nil)
            }
        }.resume()
    }
}
