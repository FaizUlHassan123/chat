//
//  chat3TableViewCell.swift
//  chat
//
//  Created by Faiz Ul Hassan on 1/3/21.
//

import UIKit

class OtherThreadTableViewCell: UITableViewCell {

    @IBOutlet var round_view: UIView!
    @IBOutlet var cell_mesg: UILabel!
    @IBOutlet var cell_date: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.round_view.clipsToBounds = true
        self.round_view.layer.cornerRadius = 12
        self.round_view.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMaxYCorner, .layerMaxXMaxYCorner]


    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

import UIKit

class MyThreadTableViewCell: UITableViewCell {

    @IBOutlet var round_view: UIView!
    @IBOutlet var cell_mesg: UILabel!
    @IBOutlet var cell_date: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.round_view.clipsToBounds = true
        self.round_view.layer.cornerRadius = 12
        self.round_view.layer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMaxYCorner, .layerMaxXMaxYCorner]

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    

}
