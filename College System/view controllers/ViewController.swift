//
//  ViewController.swift
//  College System
//
//  Created by Mac on 14/10/21.
//

import UIKit

class ViewController: UIViewController {
    @IBAction func loginBtnAction(_ sender: Any) {
        if let secondVC = storyboard?.instantiateViewController(identifier: "SecondViewController")as? SecondViewController{
            navigationController?.pushViewController(secondVC, animated: true)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "First Page"
    }
}

