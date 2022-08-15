//
//  QuizProtocols.swift
//  longmanLongman
//
//  Created by 小野拓人 on 2022/08/14.
//

import Foundation

// view → presenter
protocol QuizInputProtocol: AnyObject {
    func viewDidLoad(view: QuizOutputProtocol)
    func viewWillDisappear()
    func tappedOKButton()
    func tappedNGButton()
    func hintButton(isHidden: Bool)
}

// presenter → view
protocol QuizOutputProtocol: AnyObject {
    func setInit(word: String, meaning: String)
    func setQuizText(word: String, meaning: String)
    func quizEnd()
    func switchHint(isHidden: Bool)
}
