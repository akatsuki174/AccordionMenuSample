import UIKit

class ViewController: UITableViewController {

    var rowNum = 4

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func plusAction(_ sender: Any) {
        rowNum += 1
        animate()
    }

    @IBAction func minusAction(_ sender: Any) {
        rowNum -= 1
        animate()
    }

    private func animate() {
        tableView.beginUpdates()
        tableView.reloadSections([0], with: .right)
        tableView.endUpdates()
    }
}

extension ViewController {

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rowNum
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "cell"
        return cell
    }
}
