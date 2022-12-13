//
//  ToDoCell.swift
//  ToDOS
//
//  Created by 郝义鹏 on 2022/10/15.
//

import UIKit

class ToDoCell: UITableViewCell {

    
    
    @IBOutlet weak var CheckButton: UIButton!
    
    @IBOutlet weak var ToDoLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        CheckButton.setImage(UIImage(systemName: "checkmark.circle.fill"), for: .selected)
        
        CheckButton.setImage(UIImage(systemName: "circle"), for: .normal)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
