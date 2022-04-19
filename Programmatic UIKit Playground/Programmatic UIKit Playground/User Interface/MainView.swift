import UIKit

class MainView: UIView {
    private let label = UILabel(frame: .zero)

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSelf()
    }

    @available(*, unavailable) required init?(coder: NSCoder) { fatalError() }

    private func setupSelf() {
        backgroundColor = .systemBackground
        setupSubviews()
        setupConstraints()
    }

    private func setupSubviews() {
        setupLabel()
    }

    private func setupLabel() {
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Hello, world!"
        addSubview(label)
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: centerXAnchor),
            label.centerYAnchor.constraint(equalTo: centerYAnchor),
        ])
    }
}
