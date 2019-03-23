//
//  Cell.swift
//  AlexanderTestsDemo
//
//  Created by 潘皓群 on 2019/3/23.
//  Copyright © 2019 潘皓群. All rights reserved.
//

import UIKit
import Reusable
import Kingfisher

class Cell: UITableViewCell , Reusable{

    lazy var icon:UIImageView = {
        
        let imageView = UIImageView(frame:.zero)
        return imageView
        
    }()
    
    lazy var label:UILabel = {
        
        let label = UILabel(frame:.zero)
        label.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        label.textColor = UIColor.black
        label.textAlignment = .left
        label.setContentCompressionResistancePriority(.required, for: .horizontal)
        label.setContentCompressionResistancePriority(.required, for: .vertical)
        return label
        
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.contentView.addSubview(self.icon)
        self.icon.snp.makeConstraints { (make) in
            make.height.equalTo(200)
            make.width.equalTo(200)
            make.centerY.equalTo(self.contentView.snp.centerY)
            make.left.equalTo(self.contentView.snp.left).offset(16)
        }
        
        self.contentView.addSubview(self.label)
        self.label.snp.makeConstraints { (make) in
            make.centerY.equalTo(self.contentView.snp.centerY)
            make.left.equalTo(self.icon.snp.right).offset(16)
            make.right.equalTo(self.contentView.snp.right).offset(-16)
        }
        
        
    }
    
    
    func updateValue(cotacts:Contacts) {
        
        

        self.label.text = cotacts.name
        self.icon.image = UIImage.init(named: cotacts.image)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
