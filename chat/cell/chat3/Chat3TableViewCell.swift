//
//  chat3TableViewCell.swift
//  chat with image
//
//  Created by Faiz Ul Hassan on 12/25/20.
//

import UIKit

class Chat3TableViewCell: UITableViewCell {
    
    @IBOutlet weak var send_message: UILabel!
    @IBOutlet weak var time_send: UILabel!
    @IBOutlet weak var message_seen: UIImageView!
    @IBOutlet weak var back_view: UIView!
    @IBOutlet weak var send_image: UIImageView!
    @IBOutlet var send_image_height: NSLayoutConstraint!
    @IBOutlet var send_image_width: NSLayoutConstraint!
    
    @IBOutlet weak var receive_message: UILabel!
    @IBOutlet weak var receice_time: UILabel!
    @IBOutlet weak var receive_view: UIView!
    @IBOutlet weak var receive_image: UIImageView!
    @IBOutlet var receive_image_height: NSLayoutConstraint!
    @IBOutlet var receive_image_width: NSLayoutConstraint!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
