//
//  AnimalCell.swift
//  Cutimals
//
//  Created by Elena Rybina on 3/31/21.
//

import Foundation
import UIKit

class AnimalCell: UITableViewCell {
    
    lazy var animalImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let titleLabel: UILabel = UILabel()
    let subtitleLabel: UILabel = UILabel()
    
    let paddingConst: CGFloat = 10
    let innerPaddingConst: CGFloat = 5

    
    override init(style: UITableViewCell.CellStyle,
                  reuseIdentifier: String?) {
        super.init(style: style,
                   reuseIdentifier: reuseIdentifier)
        
        layout()
    }


    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func layout() {
        animalImageView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(animalImageView)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(titleLabel)
        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(subtitleLabel)
  //      subtitleLabel.numberOfLines = 0

        NSLayoutConstraint.activate([
            animalImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            animalImageView.widthAnchor.constraint(equalToConstant: 80),
            animalImageView.heightAnchor.constraint(equalToConstant: 80),
            animalImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10)
        ])
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor,
                                            constant: paddingConst),
            titleLabel.leadingAnchor.constraint(equalTo: animalImageView.trailingAnchor,
                                                constant: paddingConst),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,
                                                 constant: -paddingConst),
            titleLabel.heightAnchor.constraint(equalToConstant: 30)
        ])

        NSLayoutConstraint.activate([
            subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor,
                                               constant: innerPaddingConst),
            subtitleLabel.leadingAnchor.constraint(equalTo: animalImageView.trailingAnchor,
                                                   constant: paddingConst),
            subtitleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,
                                                    constant: -paddingConst),
            subtitleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,
                                              constant: -paddingConst)
        ])

    }
}
