//
//  TaskCell.swift
//  MVP
//
//  Created by Romanovich Bogdan on 17.07.2021.
//

import UIKit

class TaskCell: UITableViewCell {
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "test"
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    


    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    


}
