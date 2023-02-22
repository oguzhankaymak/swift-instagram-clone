import UIKit

protocol ShopCoordinatorProtocol {}

class ShopCoordinator: Coordinator, ShopCoordinatorProtocol {

    weak var navigationController: UINavigationController?

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let shopViewController = ShopViewController()
        shopViewController.coordinator = self

        navigationController?.pushViewController(shopViewController, animated: false)
    }
}
