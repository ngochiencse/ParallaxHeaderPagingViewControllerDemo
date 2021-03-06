import UIKit

class TableViewController: UITableViewController {
    private static let CellIdentifier = "CellIdentifier"
    
    var count: Int = 20 {
        didSet {
            tableView.reloadData()
        }
    }
    
    convenience init(count: Int) {
        self.init(style: .plain)
        self.count = count
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: TableViewController.CellIdentifier)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        tableView.contentInsetAdjustmentBehavior = .never
        tableView.contentInset = UIEdgeInsets(top: 0, left: 0,
                                              bottom: (view.window?.safeAreaInsets.bottom ?? 0),
                                              right: 0)
    }

    override func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        return count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TableViewController.CellIdentifier, for: indexPath)
        cell.textLabel?.text = "Title \(indexPath.row)"
        return cell
    }
}
