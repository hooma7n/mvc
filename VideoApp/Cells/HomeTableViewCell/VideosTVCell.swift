//
//  VideosTVCell.swift
//  VideoApp
//
//  Created by Hooma7n on 12/1/20.
//

import UIKit

class VideosTVCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBOutlet weak var cellBackView: UIView!
    @IBOutlet weak var cellImageView: UIImageView!
    @IBOutlet weak var cellTitleLabel: UILabel!
    @IBOutlet weak var cellYearLabel: UILabel!
    @IBOutlet weak var cellMovieTypeLabel: UILabel!
    
    
}
