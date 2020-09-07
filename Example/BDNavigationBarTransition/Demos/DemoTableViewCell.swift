//
//  DemoTableViewCell.swift
//  NavigationDemo
//
//  Created by dengliwen on 2020/9/3.
//  Copyright © 2020 dsjk. All rights reserved.
//

import UIKit

protocol DemoTableViewCellDelegate: NSObjectProtocol {
    func pushButtonClickedAt(_ indexPath: IndexPath)
    func presentButtonClickedAt(_ indexPath: IndexPath)
}

class DemoTableViewCell: UITableViewCell {

    var indexPath: IndexPath?
    weak var delegate: DemoTableViewCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func pushButtonClicked(_ sender: Any) {
        self.delegate?.pushButtonClickedAt(self.indexPath!)
    }
    
    @IBAction func presentButtonClicked(_ sender: Any) {
        self.delegate?.presentButtonClickedAt(self.indexPath!)
    }
    
}
