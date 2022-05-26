//
//  MessageViewController.swift
//  chat with image
//
//  Created by Faiz Ul Hassan on 12/25/20.
//

import UIKit

class MessageViewController: UIViewController , UITableViewDelegate, UITableViewDataSource{

    var data = ["Chat With image","Simple","WhatsApp","Chat Bubble"]
    @IBOutlet weak var table_View: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        table_View.reloadData()

    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        data.count
    }
    

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "messageCell", for: indexPath)
        
        cell.textLabel?.text = data[indexPath.row]
        
        return cell
    }


    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyBoard = UIStoryboard.init(name: "Main", bundle: nil)
        
        if indexPath.row == 0{
           let vc = storyBoard.instantiateViewController(identifier: "ChatViewController")
            self.navigationController?.pushViewController(vc, animated: true)
        }else if indexPath.row == 1{
            let vc = storyBoard.instantiateViewController(identifier: "Chat2ViewController")
             self.navigationController?.pushViewController(vc, animated: true)
        }else if indexPath.row == 2{
            let vc = storyBoard.instantiateViewController(identifier: "Chat3ViewController")
             self.navigationController?.pushViewController(vc, animated: true)
        }else if indexPath.row == 3{
            let vc = storyBoard.instantiateViewController(identifier: "Chat4ViewController")
             self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    


}
