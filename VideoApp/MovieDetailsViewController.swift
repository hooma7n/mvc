//
//  MovieDetailsViewController.swift
//  VideoApp
//
//  Created by Hooma7n on 12/1/20.
//

import UIKit

class MovieDetailsViewController: UIViewController {
    
    var model = MovieDetailsAPI()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.model.getfromapi { (finish) in
            if finish {
                
                self.headerImageView.kf.setImage(with: URL(string: self.model.tableData.poster))
                self.titleLabel.text = self.model.tableData.title
                self.yearLabel.text = self.model.tableData.plot
                self.imdbScoreLabel.text = self.model.tableData.imdbRating
                self.imdbVotesLabel.text = "imdb votes : " +  self.model.tableData.imdbVotes
                self.countryLabel.text =   self.model.tableData.country
                self.genreLabel.text = self.model.tableData.genre
                
                self.directorLabel.text = "Director : " + self.model.tableData.director
                self.writerLabel.text = "Writer : " + self.model.tableData.writer
                self.productionLabel.text = "Production : " + self.model.tableData.production
                
                self.actorLabels.text = "Actors : " + self.model.tableData.actors

                if self.model.tableData.rated != "Unrated" {
                    self.ratedLabel.text = self.model.tableData.rated
                } else {
                    self.ratedLabel.text = "No rating"
                }
            }
        }
    }
    
    
    @IBAction func dismissButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    //add here
    @IBOutlet weak var dismissButton: UIButton!
    @IBOutlet weak var imdbVotesLabel: UILabel!
    @IBOutlet weak var headerImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var imdbScoreLabel: UILabel!
    @IBOutlet weak var genreLabel: UILabel!
    @IBOutlet weak var ratedLabel: UILabel!
    @IBOutlet weak var actorLabels: UILabel!
    @IBOutlet weak var directorLabel: UILabel!
    @IBOutlet weak var writerLabel: UILabel!
    @IBOutlet weak var productionLabel: UILabel!
    
    @IBOutlet weak var yearLabel: UILabel!
}
