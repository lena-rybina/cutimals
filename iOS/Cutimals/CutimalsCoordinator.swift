//
//  CutimalsCoordinator.swift
//  Cutimals
//
//  Created by Elena Rybina on 3/31/21.
//

import UIKit
import Foundation

class CutimalsCoordinator {
    var navigationController: UINavigationController
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    /// Starts coordinator and creates MVVM flow
    func start() {
        let model = CutimalsModel()
        let viewModel = CutimalsViewModel(model: model)
        let view = ListOfCardsViewController (viewModel: viewModel)

        /// Injecting coordinator for starting new flows 
        view.coordinator = self

        /// Setting up initial navigation stack
        navigationController.viewControllers = [view]
    }

    /// Starts details flow
    func startDetails(for detailsText: String,
                      withTitle title: String,
                      withImage imageURL: URL?) {
        let detailsVC = DetailsViewController(detailsCopy: detailsText,
                                              imageURL: imageURL)
        detailsVC.title = title
        navigationController.pushViewController(detailsVC,
                                                animated: true)
    }
}
