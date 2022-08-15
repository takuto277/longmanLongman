//
//  QuizMenuViewController.swift
//  longmanLongman
//
//  Created by 小野拓人 on 2022/08/12.
//

import UIKit

class QuizMenuViewController: UIViewController {
    
    private let presenter: QuizMenuInputProtocol = QuizMenuPresenter()
    
    @IBOutlet var startButton: UIButton!
    @IBOutlet var quizTitleImage: UIImageView!
    @IBOutlet var startButtonImage: UIImageView!
    
//MARK: - IBAction
    
    @IBAction func touchUp(_ sender: Any) {
        self.startButtonImage.image = UIImage(named: "redButtonIcon")
    }
    
    @IBAction func touchDown(_ sender: Any) {
        self.startButtonImage.image = UIImage(named: "redButtonIcon2")
    }
    
    @IBAction func tappedStartButton (_ sender: Any) {
        
    }
    
    //MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter.viewDidLoad(view: self)
        self.quizTitleImage.image = UIImage(named: "redIcon")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.startButtonImage.image = UIImage(named: "redButtonIcon")
        self.presenter.startButtonIsHidden()
    }

}

extension QuizMenuViewController: QuizMenuOutputProtocol {
    func startButtonIsHidden(isHidden: Bool) {
        self.startButton.isHidden = isHidden
        self.startButtonImage.isHidden = isHidden
    }
}
