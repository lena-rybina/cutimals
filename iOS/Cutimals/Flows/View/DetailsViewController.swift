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
    let tableView: UITableView = {
        let tableView = UITableView(frame: .zero)

        tableView.register(AnimalCell.self,
                           forCellReuseIdentifier: "\(AnimalCell.self)")
        
        return tableView
    }()
    

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

  //      detailsTextView.text = detailsCopy
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
 
        
        tableView.backgroundColor = .orange

        view.addSubview(tableView)
        tableView.tableFooterView = UIView()
        tableView.translatesAutoresizingMaskIntoConstraints = false

        animalImageView.translatesAutoresizingMaskIntoConstraints = false
      
        ImageDownloader
            .downloadImage(from: imageURL) { image in
                self.animalImageView.image = image
        }
        
       let heightAnchor: NSLayoutConstraint = animalImageView.heightAnchor.constraint(equalToConstant: 150)

        NSLayoutConstraint.activate([
            animalImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,
                                                  constant: 15),
            heightAnchor,
       //     animalImageView.widthAnchor.constraint(equalToConstant: 100),
            animalImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
    
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: animalImageView.bottomAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])

    }
}
