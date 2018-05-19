import UIKit

class ViewController: UITableViewController {

    private var viewModel = ViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableFooterView = UIView(frame: .zero)

        addSectionÇontents()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func addSectionÇontents() {
        viewModel.addSectionContent(content: SectionContents(categoryTitle: "1", genreTitles: ["1-1", "1-2", "1-3", "1-4", "1-5"]))
        viewModel.addSectionContent(content: SectionContents(categoryTitle: "2", genreTitles: ["2-1", "2-2", "2-3", "2-4"]))
        viewModel.addSectionContent(content: SectionContents(categoryTitle: "3", genreTitles: ["3-1", "3-2", "3-3"]))
        viewModel.addSectionContent(content: SectionContents(categoryTitle: "4", genreTitles: ["4-1", "4-2", "4-3", "4-4", "4-5"]))
        viewModel.addSectionContent(content: SectionContents(categoryTitle: "5", genreTitles: ["5-1", "5-2"]))
        viewModel.addSectionContent(content: SectionContents(categoryTitle: "6", genreTitles: ["6-1", "6-2", "6-3", "6-4", "6-5"]))
    }
}

extension ViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.sectionCount()
    }

    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = SectionHeaderView.instance()
        header.setTitle(title: viewModel.categoryTitle(section: section))
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
