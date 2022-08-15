//
//  WordSaveViewController.swift
//  longmanLongman
//
//  Created by 小野拓人 on 2022/08/11.
//

import UIKit

class WordSaveViewController: UIViewController {
    
    private let presenter: WordSaveInputProtocol = wordSavePresenter()
    
    @IBOutlet var textField: UITextField?
    @IBOutlet var textView: UITextView?
    
    var text: String?
    
    // ①バーボタンアイテムの宣言
    var saveBarButtonItem: UIBarButtonItem!
    
    //MARK: - LifeCycle
 
    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter.viewDidLoad(view: self)
        
        let tapGR: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
                tapGR.cancelsTouchesInView = false
                self.view.addGestureRecognizer(tapGR)
        
        self.textView?.layer.borderColor = UIColor.red.cgColor
        self.textView?.layer.borderWidth = 1.0
        self.textView?.layer.cornerRadius = 10
        self.textView?.layer.masksToBounds = true
        
        self.textField?.layer.borderColor = UIColor.red.cgColor
        self.textField?.layer.borderWidth = 1.0
        self.textField?.layer.cornerRadius = 10
        self.textField?.layer.masksToBounds = true
        
        textField?.text = self.text
 
        // ②バーボタンアイテムの初期化
        saveBarButtonItem = UIBarButtonItem(title: "save", style: .done, target: self, action: #selector(saveBarButtonTapped(_:)))
                // ③バーボタンアイテムの追加
        self.navigationItem.rightBarButtonItems = [saveBarButtonItem]
    }
        // ④アクションメソッド
    // "編集"ボタンが押された時の処理
    @objc func saveBarButtonTapped(_ sender: UIBarButtonItem) {
        guard let word = textField?.text,
              let meaning = textView?.text else { return }
        self.presenter.saveWord(word: word, meaning: meaning)
    }
    
    @objc func dismissKeyboard() {
            self.view.endEditing(true)
        }
}

 //MARK: - WordSaveOutputProtocol

extension WordSaveViewController: WordSaveOutputProtocol {
    func saveEnd() {
        self.navigationController?.popToRootViewController(animated: true)
    }
}
