//
//  ViewController.swift
//  zikken
//
//  Created by 津吹陸 on 2019/05/02.
//  Copyright © 2019 津吹陸. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController , UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate{
    
    
    @IBOutlet weak var tView: UITableView!
    @IBOutlet weak var pickerView: UIPickerView!
    enum Clas : String{
        case c1 = "数学" , c2 = "英語"
    }
    let datalist = [
                    "","数学", "英語"
    ]
    
    var ent01:[TimeTable] = []
    var con01 = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    
    
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
        pickerView.isHidden = true
        openBtn.isHidden = true
        let caData = NSFetchRequest<NSFetchRequestResult>(entityName: "TimeTable")
        do{
            ent01 = try con01.fetch(caData) as! [TimeTable]
        }catch{
            print("エラーだよ")
        }
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
    @IBOutlet weak var openBtn: UIButton!
    
    @IBAction func selectBtn(_ sender: Any) {
        pickerView.isHidden = true
        openBtn.isHidden = true
    }
    
    @IBAction func getu1(_ sender: Any) {
        /* 授業欄に何も入っていないなら授業を選択 */
        if(((getu1_text.text)) == "") {
            pickerView.isHidden = false
            openBtn.isHidden = false
        /* 入っているならそのページに飛ぶ */
        } else {
            switch getu1_text.text!{
            case Clas.c1.rawValue:
                performSegue(withIdentifier: "goSetting", sender: nil)
            case Clas.c2.rawValue:
                performSegue(withIdentifier: "goSetting", sender: nil)
            default:
                print("error")
            }
        }
    }

}

@IBDesignable class RoundedButton: UIButton {
    
    @IBInspectable var cornerRadius: CGFloat = 0.0
    @IBInspectable var borderWidth: CGFloat = 0.0
    @IBInspectable var borderColor: UIColor = UIColor.clear
    
    override func draw(_ rect: CGRect) {
        layer.cornerRadius = cornerRadius
        layer.borderWidth = borderWidth
        layer.borderColor = borderColor.cgColor
        clipsToBounds = true
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ent01.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        let ent001 = ent01[indexPath.row]
        cell.textLabel?.text = ent001.name
        return cell
    }

}
