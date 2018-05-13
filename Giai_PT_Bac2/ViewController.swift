//
//  ViewController.swift
//  Giai_PT_Bac2
//
//  Created by Will Bui on 5/13/18.
//  Copyright © 2018 Will Bui. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    //Text Field
    @IBOutlet weak var txta: UITextField!
    @IBOutlet weak var txtb: UITextField!
    @IBOutlet weak var txtc: UITextField!
    //Label
    @IBOutlet weak var lblResult1: UILabel!
    @IBOutlet weak var lblResult2: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        lblResult1.isHidden = true
        lblResult2.isHidden = true
        txta.delegate = self
        txtb.delegate = self
        txtc.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //hàm kiểm tra dữ liệu đầu vào có hợp lệ không, chỉ cho nhập số
       
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool
    {
        let aSet = NSCharacterSet(charactersIn: "0123456789.").inverted
        let compSepByCharInSet = string.components(separatedBy: aSet)
        let numberFiltered = compSepByCharInSet.joined(separator: "")
        return string == numberFiltered
    }
    
    //Giải PT
    @IBAction func btnGiai(_ sender: Any) {
        lblResult2.text = ""
        lblResult1.isHidden = false
        if(txta.text! == "" || txtb.text! == "" || txtc.text! == "")
        {
            lblResult1.text = "Hãy nhập đủ giá trị cho a,b,c"
        }
        else
        {
            let a:Double = Double(txta.text!)!
            let b:Double = Double(txtb.text!)!
            let c:Double = Double(txtc.text!)!
            if(a==0)
            {
                if(b==0)
                {
                    if(c==0)
                    {
                        lblResult1.text = "Phương trình có vô số nghiệm"
                    }
                    else
                    {
                        lblResult1.text = "Phương trình vô nghiệm"
                    }
                }
                else
                {
                    if(c==0)
                    {
                        lblResult1.text = "Phương trình có nghiệm x = 0"
                    }
                    else
                    {
                        lblResult1.text = "Phương trình có nghiệm x = \(-c/b)"
                    }
                }
            }
            else
            {
                if(b==0 && c==0)
                {
                    lblResult1.text = "Phương trình có nghiệm x = 0"
                }
                else
                {
                    let delta = b*b-4*a*c
                    if(delta<0)
                    {
                        lblResult1.text = "Phương trình vô nghiệm"
                    }
                    else
                    {
                        if(delta==0)
                        {
                            lblResult1.text = "x1 = x2 = \(-b/(2*a))" //PT có nghiệm kép
                        }
                        else
                        {
                            lblResult2.isHidden = false
                            //PT có 2 nghiệm phân biệt
                            let x1 = (-b+sqrt(delta))/(2*a)
                            let x2 = (-b-sqrt(delta))/(2*a)
                            lblResult1.text = "x1 = \(x1)"
                            lblResult2.text = "x2 = \(x2)"
                            
                        }
                    }
                }
            }
            
        }
    }
}

