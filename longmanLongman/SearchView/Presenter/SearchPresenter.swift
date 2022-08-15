//
//  SearchViewPresenter.swift
//  longmanLongman
//
//  Created by 小野拓人 on 2022/08/14.
//

import Foundation
import RealmSwift

final class searchPresenter {
    
    private weak var view: SearchOutputProtocol?
    
    
}

extension searchPresenter: SearchInputProtocol {
    func viewDidLoad(view: SearchOutputProtocol) {
        self.view = view
        print(Realm.Configuration.defaultConfiguration.fileURL!)
    }
    
}
