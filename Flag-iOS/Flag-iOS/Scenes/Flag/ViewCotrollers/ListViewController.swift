//
//  ListViewController.swift
//  Flag-iOS
//
//  Created by 성현주 on 2023/08/12.
//

import UIKit


final class ListViewController: BaseUIViewController {
    
    // MARK: - Properties
    
    private let listView = ListView()
    var selectedCellIndex: Int? = nil
    let progressViewController = ProgressViewController()
    
    // MARK: - UI Components

    // MARK: - Life Cycle
    
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

    
    @objc
    func buttonTapped(_ sender: UIButton) {
        guard let cell = sender.superview?.superview as? CustomTableViewCell,
              let indexPath = listView.tableView.indexPath(for: cell) else {
            return
        }
        
        if selectedCellIndex == indexPath.row {
            selectedCellIndex = nil
        } else {
            selectedCellIndex = indexPath.row
            print("선택된 날짜리스트 : \(indexPath.row)")
        }
        listView.tableView.reloadData()
    }
}

// MARK: - TableViewDataSource

extension ListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath) as! CustomTableViewCell
        
        cell.titleLabel.text = "제목들어갈 자리, 셀번호 : \(indexPath.row + 1)"
        cell.subtitleLabel.text = "날짜들어갈 자리, 셀번호 : \(indexPath.row + 1)"
        cell.actionButton.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
        cell.selectionStyle = .none
        
        let checkFillImage = UIImage(named: "checkFill")
        let uncheckImage = UIImage(named: "check")
        if let selectedCellIndex = selectedCellIndex, selectedCellIndex == indexPath.row {
            cell.actionButton.setImage(checkFillImage, for: .normal)
        } else {
            cell.actionButton.setImage(uncheckImage, for: .normal)
        }
        
        return cell
    }
}

extension ListViewController: UITableViewDelegate {
}
