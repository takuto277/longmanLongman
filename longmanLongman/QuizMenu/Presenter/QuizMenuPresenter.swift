//
//  QuizMenuPresenter.swift
//  longmanLongman
//
//  Created by 小野拓人 on 2022/08/14.
//

import Foundation
import RealmSwift

final class QuizMenuPresenter {
    
    private weak var view: QuizMenuOutputProtocol?
    
    var realm = try? Realm()
    
    var wordInfoArray = try? Realm().objects(WordInfo.self)
}

extension QuizMenuPresenter: QuizMenuInputProtocol {
    func viewDidLoad(view: QuizMenuOutputProtocol) {
        self.view = view
}
    
    func startButtonIsHidden() {
        let isHidden = wordInfoArray?.count == 0 ? true : false
        self.view?.startButtonIsHidden(isHidden: isHidden)
    }
}
