//
//  ViewController.swift
//  zikken
//
//  Created by 津吹陸 on 2019/05/02.
//  Copyright © 2019 津吹陸. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UIPickerViewDelegate, UIPickerViewDataSource{
    @IBOutlet weak var pickerView: UIPickerView!
    enum Clas : String{
        case c1 = "数学" , c2 = "英語"
    }
    let datalist = [
                    "","数学", "英語"
    ]
    
    /* pickerViewの列数 */
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    /* pickerViewの要素数　*/
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return datalist.count
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
            pickerView.delegate = self
            pickerView.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    /* pickerViewの表示 */
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int,
                    forComponent component: Int) -> String? {
        return datalist[row]
    }
    /* pickerViewの応答 */
    func pickerView(_ pickerView: UIPickerView,
                    didSelectRow row: Int,
                    inComponent component: Int) {
        
        getu1_text.text = datalist[row]
        
    }
    
    @IBOutlet weak var getu1_text: UILabel!
    
    @IBAction func getu1(_ sender: Any) {
        /* 授業欄に何も入っていないなら授業を選択 */
        if(((getu1_text.text)) == "") {
            print("pickerView")
        /* 入っているならそのページに飛ぶ */
        } else {
            switch getu1_text.text!{
            case Clas.c1.rawValue:
                print("suugaku")
            case Clas.c2.rawValue:
                print("eigo")
            default:
                print("error")
            }
        }
    }
    @IBAction func getu2(_ sender: Any) {
    }
    @IBAction func getu3(_ sender: Any) {
    }
    @IBAction func getu4(_ sender: Any) {
    }
    @IBAction func getu5(_ sender: Any) {
    }
    @IBAction func ka1(_ sender: Any) {
    }
    @IBAction func ka2(_ sender: Any) {
    }
    @IBAction func ka3(_ sender: Any) {
    }
    @IBAction func ka4(_ sender: Any) {
    }
    @IBAction func ka5(_ sender: Any) {
    }
    @IBAction func sui1(_ sender: Any) {
    }
    @IBAction func sui2(_ sender: Any) {
    }
    @IBAction func sui3(_ sender: Any) {
    }
    @IBAction func sui4(_ sender: Any) {
    }
    @IBAction func sui5(_ sender: Any) {
    }
    @IBAction func moku1(_ sender: Any) {
    }
    @IBAction func moku2(_ sender: Any) {
    }
    @IBAction func moku3(_ sender: Any) {
    }
    @IBAction func moku4(_ sender: Any) {
    }
    @IBAction func moku5(_ sender: Any) {
    }
    @IBAction func kin1(_ sender: Any) {
    }
    @IBAction func kin2(_ sender: Any) {
    }
    @IBAction func kin3(_ sender: Any) {
    }
    @IBAction func kin4(_ sender: Any) {
    }
    @IBAction func kin5(_ sender: Any) {
    }
    
}

