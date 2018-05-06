import UIKit

class SectionHeaderView: UIView {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!

    convenience public init() {
        self.init(frame: CGRect.zero)
        commonInit()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }

    private func commonInit() {

    }

    func setTitle(title: String?) {
        titleLabel.text = title
    }

}
