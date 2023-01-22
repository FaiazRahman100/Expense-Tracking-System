//
//  CustomVC1.swift
//  faiaz_rahman_30024_UiKit
//
//  Created by bjit on 14/12/22.
//

import UIKit

class CustomVC1: UITableViewCell {

    @IBOutlet weak var fExpenseType: UILabel!
    @IBOutlet weak var fExpenseAmount: UILabel!
    @IBOutlet weak var fExpenseDesc: UILabel!
    @IBOutlet weak var fExpenseDate: UILabel!
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
