//
//  DetailWordViewController.swift
//  longmanLongman
//
//  Created by 小野拓人 on 2022/08/12.
//

import UIKit
import RealmSwift

class DetailWordViewController: UIViewController {
    
    @IBOutlet var textField: UITextField!
    @IBOutlet var textView: UITextView!
    
    let realm = try? Realm()
    var wordInfo: WordInfo!
    
    var saveBarButtonItem: UIBarButtonItem!
    
    @IBAction func openURLTapped(_ sender: Any) {
        guard let text = textField.text else { return }
        let hoge = "https://www.ldoceonline.com/jp/dictionary/\(text)"
        let url = NSURL(string: hoge)
        // 外部ブラウザ（Safari）で開く
        if UIApplication.shared.canOpenURL(url! as URL){
            UIApplication.shared.open(url! as URL, options: [:], completionHandler: nil)
      }
    }
    
    @IBAction func openGoggle(_ sender: Any) {
        guard let text = textField.text else { return }
        let hoge = "https://www.google.com/search?q=\(text)&hl=ja"
        let url = NSURL(string: hoge)
        // 外部ブラウザ（Safari）で開く
        if UIApplication.shared.canOpenURL(url! as URL){
            UIApplication.shared.open(url! as URL, options: [:], completionHandler: nil)
      }
    }
 
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tapGR: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
                tapGR.cancelsTouchesInView = false
                self.view.addGestureRecognizer(tapGR)
        
        self.textView.layer.borderColor = UIColor.red.cgColor
        self.textView.layer.borderWidth = 1.0
        self.textView.layer.cornerRadius = 10
        self.textView.layer.masksToBounds = true
        
        self.textField?.layer.borderColor = UIColor.red.cgColor
        self.textField?.layer.borderWidth = 1.0
        self.textField?.layer.cornerRadius = 10
        self.textField?.layer.masksToBounds = true
        
        self.textField.text = self.wordInfo.word
        self.textView.text = self.wordInfo.meaning
        
        // ②バーボタンアイテムの初期化
        saveBarButtonItem = UIBarButtonItem(title: "save", style: .done, target: self, action: #selector(saveBarButtonTapped(_:)))
                // ③バーボタンアイテムの追加
        self.navigationItem.rightBarButtonItems = [saveBarButtonItem]
    }
        // ④アクションメソッド
    // "編集"ボタンが押された時の処理
    @objc func saveBarButtonTapped(_ sender: UIBarButtonItem) {
        guard let realm = realm else { return }
        try! realm.write {
            self.wordInfo.word = self.textField.text!
            self.wordInfo.meaning = self.textView.text
            
            self.realm?.add(self.wordInfo, update: .modified)
        }
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    @objc func dismissKeyboard() {
            self.view.endEditing(true)
        }

}
