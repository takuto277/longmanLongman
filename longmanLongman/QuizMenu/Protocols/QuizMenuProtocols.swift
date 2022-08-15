//
//  QuizMenuProtocols.swift
//  longmanLongman
//
//  Created by 小野拓人 on 2022/08/14.
//

import Foundation

// view → presenter
protocol QuizMenuInputProtocol: AnyObject {
    func viewDidLoad(view: QuizMenuOutputProtocol)
    func startButtonIsHidden()
}

// presenter → view
protocol QuizMenuOutputProtocol: AnyObject {
    func startButtonIsHidden(isHidden: Bool)
}
