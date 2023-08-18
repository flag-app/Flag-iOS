//
//  ListViewController.swift
//  Flag-iOS
//
//  Created by 성현주 on 2023/08/12.
//

import UIKit

protocol ListViewControllerDelegate: AnyObject {
    func didDismissModal(with information: Int?)
}

final class ListViewController: BaseUIViewController {
    
    // MARK: - Properties
    
    var selectedCellIndex: Int? = nil
    weak var delegate: ListViewControllerDelegate?
    
    //더미
    let sections = ["참여 가능 인원 5명","참여 가능 인원 4명"]
    
    // MARK: - UI Components
    
    private let listView = ListView()
    let progressViewController = ProgressViewController()

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
        listView.confirmButton.addTarget(self, action: #selector(didTappedConfirmButton), for: .touchUpInside)
    }
    
    override func setDelegate(){
        listView.tableView.dataSource = self
        listView.tableView.delegate = self
    }
    
    @objc
    func didTappedConfirmButton() {
        delegate?.didDismissModal(with: selectedCellIndex)
        dismiss(animated: true, completion: nil)
    }

    @objc
    func didTappedSelectButton(_ sender: UIButton) {
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
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath) as! CustomTableViewCell
        
        cell.dateAndTimeLabel.text = "제목들어갈 자리, 셀번호 : \(indexPath.row + 1)"
        cell.possibleUserLabel.text = "날짜들어갈 자리, 셀번호 : \(indexPath.row + 1)"
        cell.selectButton.addTarget(self, action: #selector(didTappedSelectButton(_:)), for: .touchUpInside)
        cell.selectionStyle = .none
        
        let checkFillImage = UIImage(named: "checkFill")
        let uncheckImage = UIImage(named: "check")
        if let selectedCellIndex = selectedCellIndex, selectedCellIndex == indexPath.row {
            cell.selectButton.setImage(checkFillImage, for: .normal)
        } else {
            cell.selectButton.setImage(uncheckImage, for: .normal)
        }
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sections[section]
    }
}

extension ListViewController: UITableViewDelegate {
}
