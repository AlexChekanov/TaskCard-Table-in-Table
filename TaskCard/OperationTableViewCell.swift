import UIKit

class OperationTableViewCell: UITableViewCell {
    
    enum TableViewKind: String {
        
        case instructions
        case actions
    }
    
    @IBOutlet weak var instructionsTableView: UITableView!
    @IBOutlet weak var actionsTableView: UITableView!
    
//    @IBOutlet weak var instructionsTableViewHeightConstraint: NSLayoutConstraint!
//    @IBOutlet weak var actionsTableViewHeightConstraint: NSLayoutConstraint!
//
//    var instructionsTableViewHeight: CGFloat? {
//        get {
//            return instructionsTableViewHeightConstraint.constant
//        }
//
//        set {
//            guard let height = newValue else { return }
//            instructionsTableViewHeightConstraint.constant = height
//        }
//    }
//
//    var actionsTableViewHeight: CGFloat? {
//        get {
//            return actionsTableViewHeightConstraint.constant
//        }
//
//        set {
//            guard let height = newValue else { return }
//            actionsTableViewHeightConstraint.constant = height
//        }
//    }
    
    let instructionCellIdentifier = "instruction"
    let instructionCellNibName = "InstructionTableViewCell"
    let instructionToolboxCellIdentifier = "instructionToolbox"
    let instructionToolboxCellNibName = "InstructionToolboxTableViewCell"
    
    let actionCellIdentifier = "action"
    let actionCellNibName = "ActionTableViewCell"
    let actionToolboxCellIdentifier = "actionToolbox"
    let actionToolboxCellNibName = "ActionToolboxTableViewCell"
    
    
    // MARK: - Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
        
        instructionsTableView.dataSource = self
        instructionsTableView.delegate = self
        actionsTableView.dataSource = self
        actionsTableView.delegate = self
        
        configureInstructionsTableViewData()
        configureInstructionsTableViewVisual()
        
        configureActionsTableViewData()
        configureActionsTableViewVisual()
        
//        instructionsTableViewHeight = instructionsTableView.contentSize.height
//        actionsTableViewHeight = actionsTableView.contentSize.height
        
        
//        instructionsTableView.reloadData()
//        actionsTableView.reloadData()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    
    // MARK: - Configure Instructions
    func configureInstructionsTableViewData() {
        // Configure data
        
    }
    
    func configureInstructionsTableViewVisual() {
        instructionsTableView.estimatedRowHeight = UITableViewAutomaticDimension
        instructionsTableView.estimatedRowHeight = 240
        
        // Register Nibs
        instructionsTableView.register(UINib(nibName: instructionCellNibName, bundle: nil), forCellReuseIdentifier: instructionCellIdentifier)
        instructionsTableView.register(UINib(nibName: instructionToolboxCellNibName, bundle: nil), forCellReuseIdentifier: instructionToolboxCellIdentifier)
        
        instructionsTableView.tableFooterView = UIView()
    }
    
    // MARK: - Configure Actions
    func configureActionsTableViewData() {
        // Configure data
        
    }
    
    func configureActionsTableViewVisual() {
        actionsTableView.estimatedRowHeight = UITableViewAutomaticDimension
        actionsTableView.estimatedRowHeight = 240
        
        // Register Nibs
        actionsTableView.register(UINib(nibName: actionCellNibName, bundle: nil), forCellReuseIdentifier: actionCellIdentifier)
        actionsTableView.register(UINib(nibName: actionToolboxCellNibName, bundle: nil), forCellReuseIdentifier: actionToolboxCellIdentifier)
        
        actionsTableView.tableFooterView = UIView()
    }
}

// MARK: - Delegate & Datasource
extension OperationTableViewCell: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        guard let tableViewKind = getTableViewKind(of: tableView) else { return 0 }
        
        switch tableViewKind {
            
        case .instructions:
            return 5
        case .actions:
            return 5
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let tableViewKind = getTableViewKind(of: tableView) else { return UITableViewCell() }
        
        switch tableViewKind {
            
        case .instructions:
            let cell = indexPath.section == 0 ? instructionsTableView.dequeueReusableCell(withIdentifier: instructionCellIdentifier, for: indexPath) :
                instructionsTableView.dequeueReusableCell(withIdentifier: instructionToolboxCellIdentifier, for: indexPath)
            return cell
            
        case .actions:
            let cell = indexPath.section == 0 ? actionsTableView.dequeueReusableCell(withIdentifier: actionCellIdentifier, for: indexPath) :
                actionsTableView.dequeueReusableCell(withIdentifier: actionToolboxCellIdentifier, for: indexPath)
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0
    }
    
    func getTableViewKind(of tableView: UITableView) -> TableViewKind? {
        
        guard let tableViewRestorationIdentifier = tableView.restorationIdentifier,
            let tableViewKind = TableViewKind(rawValue: tableViewRestorationIdentifier) else { return nil }
        
        return tableViewKind
        
    }
}
