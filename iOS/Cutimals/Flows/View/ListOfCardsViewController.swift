//
//  CardsViewController.swift
//  Cutimals
//
//  Created by Elena Rybina on 3/29/21.
//

import UIKit
import Foundation

class ListOfCardsViewController: UIViewController {
    
    /// Datasource
    private var rows: [CutimalsRows] = []

    let viewModel: CutimalsViewModel
    
    weak var coordinator: CutimalsCoordinator?

    /// Table view lazy init
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero)

        /// Registering custom cells
        tableView.register(AnimalCell.self,
                           forCellReuseIdentifier: "\(AnimalCell.self)")
        
        return tableView
    }()

    init(viewModel: CutimalsViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil,
                   bundle: nil)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        layout()
        bind()
       
        title = "List of Animals"
    }
   
    private func bind() {
        tableView.delegate = self
        tableView.dataSource = self

        /// Fetching and reloading tableView
        viewModel.fetchRows { [weak self] result in
            guard let self = self else { return }

            switch result {
            case .success(let rows):
                self.rows = rows
            case .failure(let error):
                /// TODO: Handle alert

               self.rows = []
               print("[DEBUG] - Error happened - \(error.localizedDescription)")
            }

            /// Reloading tableView
            self.tableView.reloadData()
        }
    }
    /// Custom layout setup
    private func layout() {
        view.backgroundColor = .orange
        tableView.backgroundColor = .orange

        view.addSubview(tableView)
        tableView.tableFooterView = UIView()
        tableView.translatesAutoresizingMaskIntoConstraints = false

        /// Setting up layout constraint with safe layout guide
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
}

/// TableViewDataSource conformance
extension ListOfCardsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        rows.count
    }
    /// Cell setup
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        /// Get current row
        let row = rows[indexPath.row]

        print("[DEBUG] - displaying \(indexPath)")

        let cell = tableView.dequeueReusableCell(withIdentifier: "\(AnimalCell.self)",
                                                 for: indexPath) as! AnimalCell
       
        cell.titleLabel.text = row.name
        cell.titleLabel.font = UIFont.boldSystemFont(ofSize: 25)
        cell.subtitleLabel.text = row.details
        
        ImageDownloader
            .downloadImage(from: row.animalImage) { [weak cell] image in
                cell?.animalImageView.image = image
        }
        
        cell.selectionStyle = .none
        return cell
    }
}
extension ListOfCardsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView,
                   didSelectRowAt indexPath: IndexPath) {
        print("[DEBUG] - tapped on \(indexPath)")
        /// Getting current row[
        let row = rows[indexPath.row]
       
        let animalDetailsCopy = row.details
        let titleCopy = "\(row.name)"
        let image = row.animalImage

        /// Triggering coordinator action
        coordinator?.startDetails(for: animalDetailsCopy,
                                  withTitle: titleCopy,
                                  withImage: image)
    }
}
