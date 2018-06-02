import UIKit

class ViewController: UITableViewController {

    private var viewModel = ViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableFooterView = UIView(frame: .zero)

        addSectionContents()

        let button = UIButton(frame: CGRect(x: (self.view.frame.width / 2) - 100, y: self.view.frame.height - 150, width: 200, height: 50))
        button.setTitle("Change row animation", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.backgroundColor = UIColor.gray
        button.addTarget(self, action: #selector(self.showAnimationActionSheet), for: .touchUpInside)
        view.addSubview(button)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func addSectionContents() {
        viewModel.addSectionContent(content: SectionContents(categoryTitle: "1", genreTitles: ["1-1", "1-2", "1-3", "1-4", "1-5"]))
        viewModel.addSectionContent(content: SectionContents(categoryTitle: "2", genreTitles: ["2-1", "2-2", "2-3", "2-4"]))
        viewModel.addSectionContent(content: SectionContents(categoryTitle: "3", genreTitles: ["3-1", "3-2", "3-3"]))
        viewModel.addSectionContent(content: SectionContents(categoryTitle: "4", genreTitles: ["4-1", "4-2", "4-3", "4-4", "4-5"]))
        viewModel.addSectionContent(content: SectionContents(categoryTitle: "5", genreTitles: ["5-1", "5-2"]))
        viewModel.addSectionContent(content: SectionContents(categoryTitle: "6", genreTitles: ["6-1", "6-2", "6-3", "6-4", "6-5"]))
    }

    @objc func toggleCategoryHeader(gestureRecognizer: UITapGestureRecognizer) {
        guard let header = gestureRecognizer.view as? SectionHeaderView else { return }
        // nilにしないと上下矢印が一瞬重なって見えてしまう
        header.setImage(isOpen: nil)
        viewModel.changeIsOpen(section: header.section)
        tableView.beginUpdates()
        tableView.reloadSections([header.section], with: .fade)
        tableView.endUpdates()
    }

    @objc func showAnimationActionSheet() {
        let alertSheet = UIAlertController(title: "種別選択", message: "アニメーションの種類を選択してください", preferredStyle: .actionSheet)
        for row in 0...6 {
            let action = UIAlertAction(title: UITableViewRowAnimation(rawValue: row)?.rowName(), style: .default, handler: { _ in

            })
            alertSheet.addAction(action)
        }
        // automaticのrowValueが100だったので個別add
        let automaticAction = UIAlertAction(title: UITableViewRowAnimation.automatic.rowName(), style: .default, handler: { _ in

        })
        alertSheet.addAction(automaticAction)
        self.present(alertSheet, animated: true, completion: nil)
    }
}

extension ViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.sectionCount()
    }

    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = SectionHeaderView.instance()
        header.setTitle(title: viewModel.categoryTitle(section: section))
        header.section = section
        header.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(ViewController.toggleCategoryHeader(gestureRecognizer: ))))
        header.setImage(isOpen: viewModel.isOpen(in: section))
        return header
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.rowCount(section: section)
    }

    private func cellTitleForRowAtIndexPath(_ indexPath: IndexPath) -> String? {
        return viewModel.cellTitle(indexPath: indexPath)
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = cellTitleForRowAtIndexPath(indexPath)
        return cell
    }
}

extension UITableViewRowAnimation {
    func rowName() -> String {
        switch self {
        case .fade:
            return "fade"
        case .right:
            return "right"
        case .left:
            return "left"
        case .top:
            return "top"
        case .bottom:
            return "bottom"
        case .none:
            return "none"
        case .middle:
            return "middle"
        case .automatic:
            return "automatic"
        }
    }
}
