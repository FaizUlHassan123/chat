//
//  ChatTableViewCell.swift
//  chat with image
//
//  Created by Faiz Ul Hassan on 21/12/2020.
//

import UIKit

class ChatTableViewCell: UITableViewCell {

    @IBOutlet weak var send_message: UILabel!
    @IBOutlet weak var time_send: UILabel!
    @IBOutlet weak var message_seen: UIImageView!
    @IBOutlet weak var back_view: UIView!
    @IBOutlet weak var send_image: UIImageView!
    @IBOutlet var send_image_height: NSLayoutConstraint!
    @IBOutlet var send_image_width: NSLayoutConstraint!
    @IBOutlet weak var sender_image: UIImageView!

    
    @IBOutlet weak var receive_message: UILabel!
    @IBOutlet weak var receice_time: UILabel!
    @IBOutlet weak var receive_view: UIView!
    @IBOutlet weak var receive_image: UIImageView!

    @IBOutlet weak var receiver_image: UIImageView!

    @IBOutlet var receive_image_height: NSLayoutConstraint!
    @IBOutlet var receive_image_width: NSLayoutConstraint!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
