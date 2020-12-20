//
//  CellFlim.swift
//  Imdb
//
//  Created by Zakhar Sidorov  on 12/16/20.
//

import UIKit

class CellFilm: UITableViewCell {
    @IBOutlet var imagePoster: UIImageView!
    @IBOutlet var yearLabel: UILabel!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var idLabel: UILabel!
    @IBOutlet var typeLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
