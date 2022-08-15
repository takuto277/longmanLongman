//
//  QuizPresenter.swift
//  longmanLongman
//
//  Created by 小野拓人 on 2022/08/14.
//

import Foundation
import RealmSwift

final class QuizPresenter {
    private weak var view: QuizOutputProtocol?
    
    var realm = try? Realm()
    
    var wordInfoArray = try? Realm().objects(WordInfo.self)
    
    var randomQuizWordInfoArray: [WordInfo] = []
    
    var wordInfo: WordInfo?
    
    var number: Int = 0
    
    func setNextQuiz(){
        if self.number < 10, randomQuizWordInfoArray.count >= self.number + 2{
            number += 1
            self.wordInfo = randomQuizWordInfoArray[self.number]
            
            guard let word = self.wordInfo?.word,
                  let meaning = self.wordInfo?.meaning else { return }
            self.view?.setQuizText(word: word, meaning: meaning)
        } else {
            self.view?.quizEnd()
        }
    }
}

//MARK: - QuizPresenterProtocol

extension QuizPresenter: QuizInputProtocol {
    func viewDidLoad(view: QuizOutputProtocol) {
        self.view = view
        guard let wordInfoArray = wordInfoArray else { return }
        self.randomQuizWordInfoArray = Array(wordInfoArray).shuffled()
        
        self.wordInfo = randomQuizWordInfoArray[self.number]
        
        guard let word = self.wordInfo?.word,
              let meaning = self.wordInfo?.meaning else { return }
        self.view?.setInit(word: word, meaning: meaning)
    }
    
    func viewWillDisappear() {
        self.number = 0
    }
    
    func tappedOKButton() {
        guard let wordInfo = self.wordInfo,
              let realm = self.realm else { return }
        if wordInfo.imageNumber < 4 {
            try? realm.write {
                wordInfo.imageNumber += 1
                realm.add(wordInfo, update: .modified)
            }
        }
        self.setNextQuiz()
    }
    
    func tappedNGButton() {
        guard let wordInfo = self.wordInfo,
              let realm = self.realm else { return }
        if wordInfo.imageNumber != 0 {
            try? realm.write {
                wordInfo.imageNumber -= 1
                realm.add(wordInfo, update: .modified)
            }
        }
        self.setNextQuiz()
    }
    
    func hintButton(isHidden: Bool) {
        let isHidden = isHidden ? false : true
        self.view?.switchHint(isHidden: isHidden)
    }
}
