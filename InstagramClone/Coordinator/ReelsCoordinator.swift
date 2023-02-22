import UIKit

protocol ReelsCoordinatorProtocol {}

class ReelsCoordinator: Coordinator, ReelsCoordinatorProtocol {

    weak var navigationController: UINavigationController?

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let reelsViewController = ReelsViewController()
        reelsViewController.coordinator = self

        navigationController?.pushViewController(reelsViewController, animated: false)
    }
}
