//
//  Model.swift
//  longmanLongman
//
//  Created by 小野拓人 on 2022/08/11.
//

import Foundation
import RealmSwift

class WordInfo: Object{
    @objc dynamic var id: Int = 0
    @objc dynamic var word = ""
    @objc dynamic var meaning = ""
    @objc dynamic var imageNumber = 0
    
    override static func primaryKey() -> String? {
        return "id"
    }
}
