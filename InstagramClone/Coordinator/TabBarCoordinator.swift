import UIKit

class TabBarCoordinator: Coordinator {
    let navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let tabBarController = MainTabbarViewController()
        tabBarController.coordinator = self

        let homeNavigationController = UINavigationController()
        homeNavigationController.tabBarItem.image = UIImage(systemName: "house")
        homeNavigationController.tabBarItem.selectedImage = UIImage(systemName: "house.fill")
        let homeCoordinator = HomeCoordinator(navigationController: homeNavigationController)

        let searchNavigationController = UINavigationController()
        searchNavigationController.tabBarItem.image = UIImage(systemName: "magnifyingglass")
        let searchCoordinator = SearchCoordinator(navigationController: searchNavigationController)

        let reelsNavigationController = UINavigationController()
        reelsNavigationController.tabBarItem.image = UIImage(systemName: "play.tv")
        reelsNavigationController.tabBarItem.selectedImage = UIImage(systemName: "play.tv.fill")
        let reelsCoordinator = ReelsCoordinator(navigationController: reelsNavigationController)

        let shopNavigationController = UINavigationController()
        shopNavigationController.tabBarItem.image = UIImage(systemName: "bag")
        shopNavigationController.tabBarItem.selectedImage = UIImage(systemName: "bag.fill")
        let shopCoordinator = ShopCoordinator(navigationController: shopNavigationController)

        let profileNavigationController = UINavigationController()
        profileNavigationController.tabBarItem.image = UIImage(systemName: "person.crop.circle")
        profileNavigationController.tabBarItem.selectedImage = UIImage(systemName: "person.crop.circle.fill")
        let profileCoordinator = ProfileCoordinator(navigationController: profileNavigationController)

        tabBarController.viewControllers = [
            homeNavigationController,
            searchNavigationController,
            reelsNavigationController,
            shopNavigationController,
            profileNavigationController
        ]

        tabBarController.modalPresentationStyle = .fullScreen

        DispatchQueue.main.async {
            self.navigationController.present(tabBarController, animated: false, completion: nil)
        }

        coordinate(to: homeCoordinator)
        coordinate(to: searchCoordinator)
        coordinate(to: reelsCoordinator)
        coordinate(to: shopCoordinator)
        coordinate(to: profileCoordinator)
    }
}
