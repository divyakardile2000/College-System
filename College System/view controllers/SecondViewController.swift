//
//  SecondViewController.swift
//  College System
//
//  Created by Mac on 14/10/21.
//

import UIKit
class SecondViewController: UIViewController {
    @IBOutlet weak var clgNameLabel: UILabel!
    @IBOutlet weak var userIdTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "second page"
    }
    @IBAction func nextBtnAction(_ sender: Any) {
        clgNameLabel.text = "RBNB college"
        let id = userIdTF.text
        let pass = passwordTF.text
        if let thirdVC = storyboard?.instantiateViewController(identifier: "ThirdViewController") as? ThirdViewController{
            thirdVC.collegeName = clgNameLabel.text
            
          if id == "Admin"||pass == "Admin123"{
                
            navigationController?.pushViewController(thirdVC, animated: true)
            print("login successfully......")
            }else{
                print("login fail........")
            }
        }
    }
}
