//
//  VideoCollectionViewCell.swift
//  Camera App
//
//  Created by Joel Crawford on 7/12/22.
//

import UIKit

class VideoCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "VideoCollectionViewCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .systemRed
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
