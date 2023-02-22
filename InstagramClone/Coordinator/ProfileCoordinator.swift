import UIKit

protocol ProfileCoordinatorProtocol {}

class ProfileCoordinator: Coordinator, ProfileCoordinatorProtocol {

    weak var navigationController: UINavigationController?

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let profileViewController = ProfileViewController()
        profileViewController.coordinator = self

        navigationController?.pushViewController(profileViewController, animated: false)
    }
}
