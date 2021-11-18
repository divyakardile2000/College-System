//
//  ThirdViewController.swift
//  College System
//
//  Created by Mac on 14/10/21.
//

import UIKit

class ThirdViewController: UIViewController{
    
    @IBOutlet weak var clgNameLabel: UILabel!
    @IBOutlet weak var deptNameTF: UITextField!
    @IBOutlet weak var classNameTF: UITextField!
    // declare picker view
    var pickerViewDept = UIPickerView()
    var pickerViewClass = UIPickerView()
    // array
    var deptArray = ["Computer-dept","Math-Dept","Science-Dept","Physics-Dept","Chemestry-Dept"]
    var classArray = ["FY","SY","TY"]
    var collegeName : String?
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "third page"
        clgNameLabel.text = collegeName
        deptNameTF.inputView = pickerViewDept
        classNameTF.inputView = pickerViewClass
        pickerViewDept.delegate = self
        pickerViewDept.dataSource = self
        pickerViewClass.delegate = self
        pickerViewClass.delegate = self
        deptNameTF.delegate = self
        classNameTF.delegate = self
        pickerViewDept.tag = 1
        pickerViewClass.tag = 2
    }
    
    @IBAction func nextBtnAction(_ sender: Any) {
        let deptName = deptNameTF.text
        let className = classNameTF.text
        
        if let fourthVC = storyboard?.instantiateViewController(identifier: "FourthViewController") as? FourthViewController{
            fourthVC.deptNm = deptName
            fourthVC.classNm = className
            fourthVC.clgName = clgNameLabel.text
            navigationController?.pushViewController(fourthVC, animated: true)
        }
    }
}

extension ThirdViewController:UIPickerViewDelegate,UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch pickerView.tag {
        case 1:
            return deptArray.count
        case 2:
            return classArray.count
        default:
            return 1
        }
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch pickerView.tag {
        case 1:
            return deptArray[row]
        case 2:
            return classArray[row]
        default:
            return "data is not present"
        }
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch pickerView.tag {
        case 1:
            deptNameTF.text = deptArray[row]
            deptNameTF.resignFirstResponder()
        case 2:
            classNameTF.text = classArray[row]
            classNameTF.resignFirstResponder()
        default:
            return
        }
    }
    
}
//MARK: Non editable TextField
extension ThirdViewController: UITextFieldDelegate{
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        false
    }
}
