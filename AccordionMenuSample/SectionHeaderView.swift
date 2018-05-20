import UIKit

class SectionHeaderView: UIView {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    var section: Int = 0

    class func instance() -> SectionHeaderView {
        let nib = UINib(nibName: "SectionHeaderView", bundle: nil)
        guard let view = nib.instantiate(withOwner: self, options: nil).first as? SectionHeaderView else { fatalError() }
        return view
    }

    func setTitle(title: String?) {
        titleLabel.text = title
    }

    func setImage(isOpen: Bool?) {
        guard let isOpen = isOpen else {
            imageView.image = nil
            return
        }
        imageView.image = isOpen ? UIImage(named: "up-arrow") : UIImage(named: "down-arrow")
    }
}
