//
//  ListViewController.swift
//  Flag-iOS
//
//  Created by 성현주 on 2023/08/12.
//

import UIKit

final class ListViewController: BaseUIViewController {
    
    // MARK: - UI Components
   
    private let listView = ListView()
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // MARK: - Custom Method
    
    override func setUI() {
        view.addSubviews(listView)
    }
    
    override func setLayout() {
        listView.snp.makeConstraints{ make in
            make.edges.equalToSuperview()
        }
    }
    
    override func addTarget() {
        listView.confirmButton.addTarget(self, action: #selector(tap), for: .touchUpInside)
    }
    
    override func setDelegate(){
        listView.tableView.dataSource = self
        listView.tableView.delegate = self
    }
    
    @objc
    func tap() {
        print("tap")
    }
    
    @objc func buttonTapped(_ sender: UIButton) {
        guard let cell = sender.superview?.superview as? CustomTableViewCell,
              let indexPath = listView.tableView.indexPath(for: cell) else {
            return
        }
        
        let checkFillImage = UIImage(named: "checkFill")
        sender.setImage(checkFillImage, for: .normal)

        print("Button tapped in row \(indexPath.row + 1)")
    }

}


extension ListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath) as! CustomTableViewCell
        
        cell.titleLabel.text = "Custom Row \(indexPath.row + 1)"
        cell.subtitleLabel.text = "Subtitle for Row \(indexPath.row + 1)"
        cell.actionButton.setTitle("Button", for: .normal)
        cell.actionButton.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
        
        return cell
    }
}

extension ListViewController: UITableViewDelegate {
}
