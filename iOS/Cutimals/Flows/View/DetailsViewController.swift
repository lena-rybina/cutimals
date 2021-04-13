//
//  DetailsViewController.swift
//  Cutimals
//
//  Created by Elena Rybina on 3/31/21.
//

import UIKit
import Foundation

class DetailsViewController: UIViewController {
    let detailsCopy: String
    let detailsTextView = UITextView()
    lazy var animalImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    init(detailsCopy: String) {
        self.detailsCopy = detailsCopy
        super.init(nibName: nil,
                   bundle: nil)

        detailsTextView.text = detailsCopy
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        layout()
    }
    private func layout() {
        view.backgroundColor = .orange
        view.addSubview(detailsTextView)
        view.addSubview(animalImageView)
        
        animalImageView.translatesAutoresizingMaskIntoConstraints = false
      
        detailsTextView.alwaysBounceVertical = true
        detailsTextView.translatesAutoresizingMaskIntoConstraints = false

        detailsTextView.font = UIFont.boldSystemFont(ofSize: 18)
        let heightAnchor: NSLayoutConstraint = animalImageView.heightAnchor.constraint(equalToConstant: 100)
        heightAnchor.priority = .defaultHigh


        NSLayoutConstraint.activate([
            animalImageView.topAnchor.constraint(equalTo: view.topAnchor,
                                                  constant: 15),
            heightAnchor,
            animalImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            animalImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor,
                                                      constant: -20)
        ])
        
        NSLayoutConstraint.activate([
            detailsTextView.leadingAnchor.constraint(equalTo: view.leadingAnchor,
                                                     constant: 20),
            detailsTextView.trailingAnchor.constraint(equalTo: view.trailingAnchor,
                                                      constant: -20),
            detailsTextView.topAnchor.constraint(equalTo: animalImageView.bottomAnchor),
            detailsTextView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}
