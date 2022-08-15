//
//  WordSavePresenter.swift
//  longmanLongman
//
//  Created by 小野拓人 on 2022/08/14.
//

import Foundation
import RealmSwift

final class wordSavePresenter {
    
    private weak var view: WordSaveOutputProtocol?
    
    let realm = try? Realm()
    
    var text: String?
}

extension wordSavePresenter: WordSaveInputProtocol {
    func viewDidLoad(view: WordSaveOutputProtocol) {
        self.view = view
    }
    
    func saveWord(word: String, meaning: String) {
        guard let realm = realm else { return }
        let wordInfo = WordInfo()
        let allWordInfo = realm.objects(WordInfo.self)
        if allWordInfo.count != 0 {
            wordInfo.id = allWordInfo.max(ofProperty: "id")! + 1
        }
        wordInfo.word = word
        wordInfo.meaning = meaning
        
        try? realm.write {
            realm.add(wordInfo)
        }
        self.view?.saveEnd()
    }
}
