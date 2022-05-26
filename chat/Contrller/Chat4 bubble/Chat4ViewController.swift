//
//  Chat4ViewController.swift
//  chat
//
//  Created by Faiz Ul Hassan on 1/3/21.
//

import UIKit

class Chat4ViewController: UIViewController ,UITableViewDataSource, UITableViewDelegate {

    var c_user_id:String!
    var c_friend_id:String!
    var c_friend_name:String = ""
    let defaults = UserDefaults.standard
    var chatDATA: [chat] = []
    var imagePicker: ImagePicker!

    @IBOutlet weak var message_text: UITextView!

    @IBOutlet weak var friend_name_label: UILabel!
    @IBAction func back(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }

    @IBOutlet weak var table_View: UITableView!

    @IBOutlet weak var chat_view_bottom: NSLayoutConstraint!
    @IBOutlet weak var keyboard_back_view: UIView!
    @IBOutlet weak var view_circle: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        c_user_id = "2"
        c_friend_id = "15"
        c_friend_name = "Hassan"
        self.hideKeyBoardOnTap()
        keyboard_back_view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        table_View.delegate = self
        table_View.dataSource = self
        view_circle.layer.cornerRadius  = 6
        view_circle.layer.borderWidth = 1
        view_circle.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        friend_name_label.text = c_friend_name
        self.message_get_selector()
        message_text.delegate = self
        self.imagePicker = ImagePicker(presentationController: self, delegate: self)

    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chatDATA.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let Mdata = chatDATA[indexPath.row]

        let cell = self.table_View.dequeueReusableCell(withIdentifier: "myThread") as! MyThreadTableViewCell
        let cell2 = self.table_View.dequeueReusableCell(withIdentifier: "otherThread") as! OtherThreadTableViewCell
        if Mdata.sender == c_user_id{
            cell.cell_mesg.text  = Mdata.message
            cell.cell_date.text = Mdata.time
//            cell.back_view.send_roundCorners(radius: 8)
            if !Mdata.attachment.isEmpty{

//                cell.send_image.image = Mdata.image
//                let height = self.view.frame.width - 80
//                cell.send_image_height.constant = height
//                cell.send_image_width.constant = height



            }else{
//               fsend_image_width.constant = 0
            }

        }else{
            cell2.cell_mesg.text = Mdata.message
            cell2.cell_date.text = Mdata.time
            if !Mdata.attachment.isEmpty{
//                cell.receive_image.image = Mdata.image
//
//                let height = self.view.frame.width - 80
//                cell2.receive_image_height.constant = height
//                cell2.receive_image_width.constant = height

            }else{
//                cell2.receive_image.image = nil
//                cell2.receive_image_height.constant = 0
//                cell2.receive_image_width.constant = 0
            }

            return cell2
        }


        return cell
    }




    @objc func message_get_selector(){
        print("Yes! internet is available.")
        for _ in 0...5{
            let currentDateTime = Date()
            let formatter = DateFormatter()
            formatter.timeStyle = .short
            formatter.dateStyle = .none
            let time = formatter.string(from: currentDateTime)

            let m = chat()
            m.sender = c_friend_id
            m.attachment = ""
            m.date = "\(Date())"
            m.message = "Hi"

            m.message_id = "1"
            m.time = time
            self.chatDATA.append(m)
        }



        self.table_View.reloadData()
        if self.chatDATA.count > 0 {
            self.table_View.scrollToBottom()
        }


        // do some tasks..

    }

    @IBAction func attachment(_ sender: UIButton) {
        self.imagePicker.present(from: sender)
    }

    @IBOutlet weak var send_message_button:UIButton!

    @IBAction func send_message(_ sender: Any) {
        send_message()
    }

    @objc func send_message(){

        var param = Dictionary<String,Any>()
        param["message"] = message_text.text
        param["friend"] = c_friend_id
        param["user_id"] = c_user_id
        param["attachments"] = ""
        let currentDateTime = Date()
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        formatter.dateStyle = .none
        let time = formatter.string(from: currentDateTime)
        let m = chat()
        m.sender = self.c_user_id
        m.attachment = ""
        m.date = "\(Date())"
        m.message = self.message_text.text
        m.message_id = "1"
        m.time = time
        m.image = nil
        self.chatDATA.append(m)

        self.message_text.text = ""

        self.table_View.reloadData()
        if self.chatDATA.count > 0 {
            self.table_View.scrollToBottom()
        }


        // do some tasks..

    }

    func send_message_with_Image(_ image:UIImage){

        print("Yes! internet is available.")
        var param = Dictionary<String,Any>()
        param["message"] = message_text.text
        param["friend"] = c_friend_id
        param["user_id"] = c_user_id
        param["attachments"] = "image"

        let m = chat()
        m.sender = self.c_user_id
        m.attachment = "image"
        m.date = "\(Date())"
        m.message = self.message_text.text
        m.message_id = "1"
        m.time = "Time"
        m.image = image
        self.chatDATA.append(m)

        self.message_text.text = ""
        self.table_View.reloadData()
        if self.chatDATA.count > 0 {
            self.table_View.scrollToBottom()
        }


    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        self.tabBarController?.tabBar.isHidden = true
    }


    //MARK: - getKayboardHeight
    @objc func keyboardWillShow(notification: Notification) {
        let userInfo:NSDictionary = notification.userInfo! as NSDictionary
        let keyboardFrame:NSValue = userInfo.value(forKey: UIResponder.keyboardFrameEndUserInfoKey) as! NSValue
        let keyboardRectangle = keyboardFrame.cgRectValue
        let keyboardHeight = keyboardRectangle.height
        let height = UIScreen.main.bounds.size.height
        print("\(height)")
        chat_view_bottom.constant = -keyboardHeight
    }

    @objc func keyboardWillHide(notification: Notification) {
        // keyboard is dismissed/hidden from the screen
        chat_view_bottom.constant = 0
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        NotificationCenter.default.removeObserver(self)
        self.tabBarController?.tabBar.isHidden = false

    }



}




//MARK: ImagePickerDelegate
extension Chat4ViewController: ImagePickerDelegate {

    //MARK: Image pciker
    func didSelect(image: UIImage?) {

        guard let image = image else{
            return
        }

        self.send_message_with_Image(image)
    }


}


extension Chat4ViewController:UITextViewDelegate{


    func textViewDidChangeSelection(_ textView: UITextView) {
        //        print(#function)
        if textView.text.isEmpty{
            self.send_message_button.isUserInteractionEnabled = false
            self.send_message_button.backgroundColor = UIColor.lightGray
        }else{
            self.send_message_button.isUserInteractionEnabled = true
            self.send_message_button.backgroundColor = UIColor.red


        }
    }

}
