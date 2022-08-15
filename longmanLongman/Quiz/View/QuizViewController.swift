//
//  QuizViewController.swift
//  longmanLongman
//
//  Created by 小野拓人 on 2022/08/12.
//

import UIKit

class QuizViewController: UIViewController {
    
    private let presenter: QuizInputProtocol = QuizPresenter()
    
    @IBOutlet var word: UILabel?
    @IBOutlet var meaning: UITextView?
    
    //MARK: - IBAction
    
    @IBAction func hintButton (_ sender: Any) {
        self.presenter.hintButton(isHidden: self.meaning?.isHidden ?? true)
    }
    
    @IBAction func tappedOKButton (_ sender: Any) {
        self.presenter.tappedOKButton()
    }
    
    @IBAction func tappedNGButton (_ sender: Any) {
        self.presenter.tappedNGButton()
    }
    
    //MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter.viewDidLoad(view: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.meaning?.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.presenter.viewWillDisappear()
    }
}

   //MARK: - QuizViewControllerProtocol

extension QuizViewController: QuizOutputProtocol {
    func setInit(word: String, meaning: String) {
        self.word?.text = word
        self.meaning?.text = meaning
        
        self.meaning?.layer.borderColor = UIColor.red.cgColor
        self.meaning?.layer.borderWidth = 1.0
        self.meaning?.layer.cornerRadius = 10
        self.meaning?.layer.masksToBounds = true
    }
    
    func setQuizText(word: String, meaning: String) {
        self.word?.text = word
        self.meaning?.text = meaning
        self.meaning?.isHidden = true
    }
    
    func quizEnd() {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    func switchHint(isHidden: Bool) {
        self.meaning?.isHidden = isHidden
    }
    
}
