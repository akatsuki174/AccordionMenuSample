import UIKit

class SectionHeaderView: UIView {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!

    class func instance() -> SectionHeaderView {
        let nib = UINib(nibName: "SectionHeaderView", bundle: nil)
        guard let view = nib.instantiate(withOwner: self, options: nil).first as? SectionHeaderView else { fatalError() }
        return view
    }

    func setTitle(title: String?) {
        titleLabel.text = title
    }

}
