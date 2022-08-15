//
//  SearchViewController.swift
//  longmanLongman
//
//  Created by 小野拓人 on 2022/08/11.
//

import UIKit

class SearchViewController: UIViewController{
    
    private let presenter: SearchInputProtocol = searchPresenter()
    
    let wordSaveViewController: WordSaveViewController = WordSaveViewController()
    
    @IBOutlet var textField: UITextField!
    @IBOutlet var button: UIButton!
    @IBOutlet var searchTitleImage: UIImageView!
    @IBOutlet var searchButtonImage: UIImageView!
    
    //MARK: - IBAction
    
    @IBAction func TouchUp(_ sender: Any) {
        self.searchButtonImage.image = UIImage(named: "redButtonIcon")
    }
    
    @IBAction func TouchDown(_ sender: Any) {
        self.searchButtonImage.image = UIImage(named: "redButtonIcon2")
    }
    @IBAction func openURLTapped(_ sender: Any) {
        guard let text = textField.text else { return }
        let url = NSURL(string: "https://www.ldoceonline.com/jp/dictionary/\(text)")
        // 外部ブラウザ（Safari）で開く
        if UIApplication.shared.canOpenURL(url! as URL){
            UIApplication.shared.open(url! as URL, options: [:], completionHandler: nil)
      }
    }
    
    //MARK: - LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter.viewDidLoad(view: self)
        self.searchTitleImage.image = UIImage(named: "redIcon3")
        
        let tapGR: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
                tapGR.cancelsTouchesInView = false
                self.view.addGestureRecognizer(tapGR)
        
        self.textField.layer.borderColor = UIColor.red.cgColor
        self.textField.layer.borderWidth = 1.0
        self.textField.layer.cornerRadius = 10
        self.textField.layer.masksToBounds = true

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.textField.text = ""
        self.searchButtonImage.image = UIImage(named: "redButtonIcon")
    }
    
    //MARK: - Segue
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let wordSaveViewController: WordSaveViewController = segue.destination as! WordSaveViewController
        //ViewController同士が繋がるのは問題
        wordSaveViewController.text = self.textField.text
    }
    
    //MARK: - DismissKeyboard
    
    @objc func dismissKeyboard() {
            self.view.endEditing(true)
        }
}

extension SearchViewController: SearchOutputProtocol {
    
}

