//
//  ListTableViewCell.swift
//  longmanLongman
//
//  Created by 小野拓人 on 2022/08/12.
//

import UIKit

class ListTableViewCell: UITableViewCell {
    
    @IBOutlet weak var listImage: UIImageView?
    @IBOutlet weak var label: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
