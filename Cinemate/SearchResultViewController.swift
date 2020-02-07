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
    
    // MARK: viewRelated
    override func viewDidLoad() {
        loadMovieDetails()
        super.viewDidLoad()

    }
    
    func loadMovieDetails()  {
        AF.request(url + selectedMovieImdbId).responseJSON{ response in
        
                do{
                 
                    let selectedMovie = try self.decoder.decode(Movie.self , from: response.data! )
                   //  self.movieSearchResult1 = movieSearchResult1
                   //object where the data will be saved >>    decoder method. decode ( model , from data object )

                    print(selectedMovie)
                    self.selectedMovie = selectedMovie
                    //title
                    if selectedMovie.Title != nil {
                        self.titleLabel.text =  selectedMovie.Title
                    }else{
                        self.titleLabel.text = "Title not found"
                    }
                    //relese date
                    if selectedMovie.Released != nil {
                        self.dateLabel.text = "Relesed On :" + selectedMovie.Released!
                        }else{
                        self.dateLabel.text  = "Relese date not found"
                    }
                    // ratings
                    if selectedMovie.imdbRating != nil {
                        self.imdbRatingLabel.text = selectedMovie.imdbRating!
                    }else{
                        self.imdbRatingLabel.text = "N/A"
                    }
                    if selectedMovie.Ratings.count > 1 {
                        self.tomatoesRatingLabel.text = selectedMovie.Ratings[1].Value ?? "N/A"
                    }else{
                        self.tomatoesRatingLabel.text = "N/A"
                    }
                    if selectedMovie.Metascore  != nil {
                        self.MetacriticRatingLabel.text = selectedMovie.Metascore!
                    }else{
                        self.MetacriticRatingLabel.text = "N/A"
                    }

                    //plot
                    if selectedMovie.Plot  != nil {
                        self.plotTextView.text = selectedMovie.Plot
                    }else{
                        self.plotTextView.text = "Plot not found !"
                    }
                    //actors
                    if selectedMovie.Actors  != nil {
                        self.actorsTextView.text = "Actors :" + selectedMovie.Actors!
                    }else{
                        self.actorsTextView.text = "Plot not found !"
                    }
                    //box office
                    if selectedMovie.BoxOffice  != nil {
                        self.boxOfficeLabel.text = selectedMovie.BoxOffice
                    }else{
                        self.boxOfficeLabel.text = "N/A"
                    }
                    let fileUrl = URL(string: selectedMovie.Poster!)
                    UIImage.downloadFromRemoteURL(fileUrl!, completion: { image, error in
                        guard let image = image, error == nil else { print(error ?? "Poster error !");return }
                        self.posterImageView.image = image
                    })
                }catch{
                    print("error parsing json data")  }

                }
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
