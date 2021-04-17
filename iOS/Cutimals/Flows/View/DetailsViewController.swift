//
//  DetailsViewController.swift
//  Cutimals
//
//  Created by Elena Rybina on 3/31/21.
//

import UIKit
import Foundation

class DetailsViewController: UIViewController {
    let imageURL: URL?
    let detailsCopy: String
    let detailsTextView = UITextView()
    lazy var animalImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    init(detailsCopy: String,
         imageURL: URL?) {
        self.imageURL = imageURL
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
        view.addSubview(animalImageView)
        view.addSubview(detailsTextView)
        
        animalImageView.translatesAutoresizingMaskIntoConstraints = false
      
        ImageDownloader
            .downloadImage(from: imageURL) { image in
                self.animalImageView.image = image
        }
        
        detailsTextView.alwaysBounceVertical = true
        detailsTextView.translatesAutoresizingMaskIntoConstraints = false

        detailsTextView.font = UIFont.boldSystemFont(ofSize: 18)
        let heightAnchor: NSLayoutConstraint = animalImageView.heightAnchor.constraint(equalToConstant: 150)

        NSLayoutConstraint.activate([
            animalImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,
                                                  constant: 15),
            heightAnchor,
       //     animalImageView.widthAnchor.constraint(equalToConstant: 100),
            animalImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
        
        NSLayoutConstraint.activate([
            detailsTextView.leadingAnchor.constraint(equalTo: view.leadingAnchor,
                                                     constant: 20),
            detailsTextView.trailingAnchor.constraint(equalTo: view.trailingAnchor,
                                                      constant: -20),
            detailsTextView.topAnchor.constraint(equalTo: animalImageView.bottomAnchor, constant: 20),
            detailsTextView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}
