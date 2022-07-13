//
//  AddMemoControllerViewController.swift
//  orimemo2
//
//  Created by clark on 2022/05/17.
//

import UIKit

class AddMemoControllerViewController: UIViewController {
    
    @IBOutlet var memoTextView: UITextView!
    @IBOutlet weak var dateField: UITextField!
    
    var datePicker: UIDatePicker = UIDatePicker()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    
    @IBAction func save(_ sender: Any) {

            let inputText = memoTextView.text
            let ud = UserDefaults.standard
            if ud.array(forKey: "memoArray") != nil{
                //saveMemoArrayに取得
                var saveMemoArray = ud.array(forKey: "memoArray") as! [String]
                    //テキストに何か書かれているか？
                if inputText != ""{
                    //配列に追加
                    saveMemoArray.append(inputText!)
                    ud.set(saveMemoArray, forKey: "memoArray")
                }else{
                    showAlert(title: "何も入力されていません")

                }

            }else{
                //最初、何も書かれていない場合
                var newMemoArray = [String]()
                //nilを強制アンラップはエラーが出るから
                if inputText != ""{
                    //inputtextはoptional型だから強制アンラップ
                    newMemoArray.append(inputText!)
                    ud.set(newMemoArray, forKey: "memoArray")
                }else{
                    showAlert(title: "何も入力されていません")
                }
            }
            showAlert(title: "保存完了")
            ud.synchronize()
        }
    
    func showAlert(title:String){
        let alert = UIAlertController(title: title, message: nil, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        
        self.present(alert, animated: true, completion: nil)
    }
}
