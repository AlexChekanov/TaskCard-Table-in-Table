import UIKit

class TaskCardViewController: UIViewController {

    @IBOutlet weak var operationsTableView: UITableView!
    
    let stepcellIdentifier = "step"
    
    let operationCellIdentifier = "operation"
    let operationToolboxCellIdentifier = "operationToolbox"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}


extension TaskCardViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = indexPath.section == 0 ? tableView.dequeueReusableCell(withIdentifier: operationCellIdentifier, for: indexPath) : tableView.dequeueReusableCell(withIdentifier: operationToolboxCellIdentifier, for: indexPath)
 
        return cell
    }
}

//
//extension TaskCardViewController: UICollectionViewDelegate, UICollectionViewDataSource {
//
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return 1
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        return collectionView.dequeueReusableCell(withReuseIdentifier: stepcellIdentifier, for: indexPath)
//    }
//}
//
