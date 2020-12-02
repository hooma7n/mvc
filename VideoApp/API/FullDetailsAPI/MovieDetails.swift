//
//  MovieDetails.swift
//  VideoApp
//
//  Created by Hooma7n on 12/1/20.
//

import Foundation
import Alamofire

class MovieDetailsAPI {
    
    var tableData : Welcome!
    
    func getfromapi(completionHandler : ((_ isSucess : Bool) -> Void)?) {
        let url = "http://omdbapi.com/?i=\(shareData.shared.selectedID)&apikey=d46b58e5"
        
        Alamofire.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil)
            .responseJSON(completionHandler : { response in
            
                switch response.result {
                
                case .success(let data):
                    
                    guard let jsonData = try? JSONSerialization.data(withJSONObject: data, options: JSONSerialization.WritingOptions.prettyPrinted) else {return}
                    let decoder = JSONDecoder()
                    guard let result = try? decoder.decode(Welcome.self, from: jsonData) else {return}
                    self.tableData = result
                    completionHandler?(true)
                    
                case .failure(let x):
                    print(x)
                }
            })
    }
}

extension MovieDetailsAPI {
    
    struct Welcome: Codable {
        let title, year, rated, released: String
        let runtime, genre, director, writer: String
        let actors, plot, language, country: String
        let awards: String
        let poster: String
        let ratings: [Rating]
        let metascore, imdbRating, imdbVotes, imdbID: String
        let type, dvd, boxOffice, production: String
        let website, response: String

        enum CodingKeys: String, CodingKey {
            case title = "Title"
            case year = "Year"
            case rated = "Rated"
            case released = "Released"
            case runtime = "Runtime"
            case genre = "Genre"
            case director = "Director"
            case writer = "Writer"
            case actors = "Actors"
            case plot = "Plot"
            case language = "Language"
            case country = "Country"
            case awards = "Awards"
            case poster = "Poster"
            case ratings = "Ratings"
            case metascore = "Metascore"
            case imdbRating, imdbVotes, imdbID
            case type = "Type"
            case dvd = "DVD"
            case boxOffice = "BoxOffice"
            case production = "Production"
            case website = "Website"
            case response = "Response"
        }
    }

    // MARK: - Rating
    struct Rating: Codable {
        let source, value: String

        enum CodingKeys: String, CodingKey {
            case source = "Source"
            case value = "Value"
        }
    }

}
