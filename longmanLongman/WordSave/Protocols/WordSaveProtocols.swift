//
//  WordSaveProtocols.swift
//  longmanLongman
//
//  Created by 小野拓人 on 2022/08/14.
//

import Foundation

// view → presenter
protocol WordSaveInputProtocol: AnyObject {
    func viewDidLoad(view: WordSaveOutputProtocol)
    func saveWord(word: String, meaning: String)
}

// presenter → view
protocol WordSaveOutputProtocol: AnyObject {
    func saveEnd()
}
