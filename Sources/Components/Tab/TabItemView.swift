protocol TabItemViewDelegate: class {
    func didTapTabItemAt(index: Int)
}

class TabItemView: UIView {

    enum State {
        case selected
        case normal
    }

    let titleLabel = UILabel()

    weak var delegate: TabItemViewDelegate?

    private let index: Int

    private var state: State = .normal {
        didSet {
            handleState()
        }
    }

    init(index: Int, title: String) {
        self.index = index
        super.init(frame: .zero)
        titleLabel.text = title.uppercased()
        setup()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension TabItemView {

    func changeStateBySelectedIndex(_ selectedIndex: Int) {
        state = selectedIndex == index ? .selected : .normal
    }
}

extension TabItemView {

    private func setup() {
        backgroundColor = .clear

        titleLabel.font = Fonts.button
        titleLabel.textAlignment = .center

        addLabel()
        handleState()

        let gesture = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        self.addGestureRecognizer(gesture)
    }

    private func addLabel() {
        addSubview(titleLabel)

        titleLabel.translatesAutoresizingMaskIntoConstraints = false

        let constraints = [
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8)
        ]

        NSLayoutConstraint.activate(constraints)
    }
}

extension TabItemView {

    @objc func handleTap() {
        delegate?.didTapTabItemAt(index: index)
    }

    private func handleState() {
        switch state {
        case .normal:
            titleLabel.textColor = Colors.Content.mediumEmphasis
        case .selected:
            titleLabel.textColor = Colors.highlight
        }
    }
}
