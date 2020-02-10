//
//  SearchViewController.swift
//  Cinemate
//
//  Created by Md. Mehedi Hasan on 30/1/20.
//  Copyright © 2020 Md. Mehedi Hasan. All rights reserved.
//

import UIKit
import Alamofire
import CoreData

class SearchViewController: UIViewController , UITableViewDelegate , UITableViewDataSource ,UIPickerViewDelegate, UIPickerViewDataSource{

    
   //=================== var ============================
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var searchInput: UITextField!
    @IBOutlet weak var tableview: UITableView!
    @IBOutlet weak var picker: UIPickerView!
    @IBOutlet weak var releseYear: UITextField!
    
    var pickerData: [String] = [String]()
    var numberOfCellsTable:Int = 0
    let cellIdentifiar : String = "cell"
    let decoder = JSONDecoder()
    var user = User(context: PersistanceService.context)

    var courses = [Course]()
    var movieSearchResult1 = movieSearchResult(Response: "hellp")
    var url:String = "http://www.omdbapi.com/?apikey=df031d45&"
    var selectedMovieImdbId = "tt3896198"
    var pickerValue:String = "movie"
    var releseYearValue:String = ""

    var movies = [Movie]()

    
    //================= view did load =====================
    override func viewDidLoad() {
        super.viewDidLoad()
        emailLabel.text = user.email
        tableview.delegate = self
        tableview.dataSource = self
        self.picker.delegate = self
        self.picker.dataSource = self
        pickerData = ["movie", "series", "episode"]

    }
    

    @IBAction func searchClicked(_ sender: Any) {

        let tempUrl = urlMaker(url: self.searchInput.text ?? "")
        AF.request(url + "s=" + tempUrl).responseJSON{ response in
            
                    do{
                        // empty response handel
                     
                        let movieSearchResult1 = try self.decoder.decode(movieSearchResult.self , from: response.data! )
                      //  self.movieSearchResult1 = movieSearchResult1
              //object where the data will be saved >>    decoder method. decode ( model , from data object )

                        print(movieSearchResult1)
                        self.movieSearchResult1 = movieSearchResult1
                        self.tableview.reloadData()
                    }catch{
                        print("error parsing json data")  }

                    }

                }
    
    //======================= tableview ===================
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        numberOfCellsTable = movieSearchResult1.Search.count
         return numberOfCellsTable
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifiar, for: indexPath) as UITableViewCell
        cell.textLabel?.text =  movieSearchResult1.Search[indexPath.row].Title
        cell.detailTextLabel?.text =  movieSearchResult1.Search[indexPath.row].Year

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        self.selectedMovieImdbId = movieSearchResult1.Search[indexPath.row].imdbID ?? "tt3896198"
        self.performSegue(withIdentifier: "searchResultDetails", sender: self)

       }
    //================== picker ==============
    override func didReceiveMemoryWarning() {
           super.didReceiveMemoryWarning()
           // Dispose of any resources that can be recreated.
       }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        // This method is triggered whenever the user makes a change to the picker selection.
        // The parameter named row and component represents what was selected.
        print(pickerData[row])
        self.pickerValue = pickerData[row]
    }
    // Number of columns of data
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
     
       // The number of rows of data

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
         return pickerData.count
    }
       // The data to return fopr the row and component (column) that's being passed in
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    
    //=================== func ===============
    
    func urlMaker(url:String) -> String {
        self.releseYearValue = releseYear.text!
        let searchType:String = "&type=" + pickerValue
        let SearchYear:String = "&y=" + releseYearValue
        let newString = url.replacingOccurrences(of: " ", with: "%20", options: .literal, range: nil)
        return newString + searchType + SearchYear 
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let SearchResultViewController = segue.destination as? SearchResultViewController else {return}
        SearchResultViewController.selectedMovieImdbId = self.selectedMovieImdbId

    }
    
    
    }
    

  



