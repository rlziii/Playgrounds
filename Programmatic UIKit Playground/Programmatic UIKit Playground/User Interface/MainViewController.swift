import UIKit

class MainViewController: UIViewController {
    private let mainView = MainView(frame: .zero)

    init() {
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable) required init?(coder: NSCoder) { fatalError() }

    override func loadView() {
        view = mainView
    }
}
