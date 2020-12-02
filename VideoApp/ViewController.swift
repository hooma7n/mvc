//
//  ViewController.swift
//  VideoApp
//
//  Created by Hooma7n on 12/1/20.
//

import UIKit
import Kingfisher


class ViewController: UIViewController {
    
    var dataModel = HomeVidesAPI()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        dataModel.getfromapi { (finish) in
            if finish {
                self.moviesTableView.reloadData()
            }
        }
        setContainers()

        
    }
    
    func setContainers(){
        
        self.moviesTableView.delegate = self
        self.moviesTableView.registerCell("VideosTVCell")
        
 
        
    }
    
    //add here
    @IBOutlet weak var moviesTableView: UITableView!
    

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataModel.tableData.count
        
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = moviesTableView.dequeueReusableCell(withIdentifier: "VideosTVCell", for: indexPath) as! VideosTVCell
        cell.cellTitleLabel.text = dataModel.tableData[indexPath.row].title
        cell.cellImageView.kf.setImage(with: URL(string: dataModel.tableData[indexPath.row].poster))
        cell.cellYearLabel.text = "Year : " +  dataModel.tableData[indexPath.row].year
        cell.cellMovieTypeLabel.text = "Type : " + dataModel.tableData[indexPath.row].type.rawValue
        cell.selectionStyle = .none

        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        shareData.shared.selectedID = dataModel.tableData[indexPath.row].imdbID
        self.performingSegue("NavigateDetails")
        
    }
    
    
}

