import UIKit

class Settings: UITableViewController {

    static let appStoreAddress = "itunes.apple.com/gb/app/reading-list-book-tracker/id1217139955"
    static let feedbackEmailAddress = "feedback@readinglistapp.xyz"
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if #available(iOS 11.0, *) {
            navigationController!.navigationBar.prefersLargeTitles = UserSettings.useLargeTitles.value
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch (indexPath.section, indexPath.row) {
        case (0, 1): UIApplication.shared.open(URL(string: "itms-apps://\(Settings.appStoreAddress)?action=write-review")!, options: [:])
        default: return
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        #if DEBUG
            return super.tableView(tableView, numberOfRowsInSection: section)
        #else
            // Hide the Debug cell
            let realCount = super.tableView(tableView, numberOfRowsInSection: section)
            return section == 1 ? realCount - 1 : realCount
        #endif
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let url = sender as? URL, let nav = segue.destination as? UINavigationController, let data = nav.viewControllers.first as? DataVC {
            // In order to trigger an import from an external source, the presenting segue's sender is the URL of the file.
            // Set this on the Data vc, which will load the file the first time the VC appears after the import URL is set.
            data.importUrl = url
        }
    }
}
