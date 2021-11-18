//
//  FourthViewController.swift
//  College System
//
//  Created by Mac on 14/10/21.
//

import UIKit

class FourthViewController: UIViewController {

    @IBOutlet weak var clgNameLabel: UILabel!
    @IBOutlet weak var deptLabel: UILabel!
    @IBOutlet weak var classLabel: UILabel!
    @IBOutlet weak var rnoTF: UITextField!
    @IBOutlet weak var stdNameTF: UITextField!
    
    var Student : Student?
    var deptNm : String?
    var classNm : String?
    var clgName : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        clgNameLabel.text = clgName
        deptLabel.text = deptNm
        classLabel.text = classNm
        title = "fourth page"
        var rno = rnoTF.text
        var name = stdNameTF.text
    }
    
    @IBAction func saveBtnAction(_ sender: Any) {
        let db = DBHelper()
        db.createCollegeTable()
        let rno = Int(rnoTF.text!) ?? 0
        let name = stdNameTF.text ?? ""
        db.insertValuesInCollege(rno: rno, name: name, Classname: classNm!, Deptname: deptNm!)
        db.display()
    }
}
