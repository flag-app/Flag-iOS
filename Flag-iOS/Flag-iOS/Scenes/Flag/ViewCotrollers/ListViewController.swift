//
//  ListViewController.swift
//  Flag-iOS
//
//  Created by 성현주 on 2023/08/12.
//

import UIKit
import Moya

protocol ListViewControllerDelegate: AnyObject {
    func didDismissModal(with information: Int?)
}

final class ListViewController: BaseUIViewController {
    
    // MARK: - Properties
    
    var flagId: Int = 0 {
        didSet {
            print("♥️\(flagId)listview")
        }
    }
    
    var selectedCellIndex: Int? = nil
    weak var delegate: ListViewControllerDelegate?
    var numberFlagList: Int = 0
    var flagListData: [FlagList] = [] {
        didSet {
            print("flagListData: \(flagListData)")
        }
    }
    
    //더미
    let sections = ["참여 가능 인원 5명","참여 가능 인원 4명"]
    
    // MARK: - UI Components
    
    private let listView = ListView()
    let progressViewController = ProgressViewController()

    // MARK: - Life Cycle
    
    // MARK: - Custom Method
    
    override func setUI() {
        view.addSubviews(listView)
        getFlagList()
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
        print(selectedCellIndex!)
        sendFlagListIndexToServer()
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
    
    //MARK: -NetWork
    
    func getFlagList() {
            let provider = MoyaProvider<FlagListAPI>()
            
        // Make the API request
        provider.request(.showFlagList(flagId: flagId)) { result in
                switch result {
                case .success(let response):
                    // Handle successful response
                    let statusCode = response.statusCode
                        print("Status Code: \(statusCode)")
                        // Process the response data as needed
                        do {
                            let responseData = try response.map([FlagList].self)
                            print(responseData)
                            self.numberFlagList = responseData.count
                            print(self.numberFlagList)
                            self.flagListData = responseData
                            
                            if responseData.isEmpty {
                                let alertView = UIAlertController(title: "\(TextLiterals.flagNonExistText)", message: "", preferredStyle: .alert)
                                let deleteAction = UIAlertAction(title: TextLiterals.flagBackHomeText, style: .default) { [self] _ in
                                    delegate?.didDismissModal(with: -1)
                                    dismiss(animated: true, completion: nil)
                                }
                                alertView.addAction(deleteAction)
                                
                                let cancelAction = UIAlertAction(title: TextLiterals.flagBackProgressText, style: .default){_ in
                                    self.dismiss(animated: true, completion: nil)
                                }
                                alertView.addAction(cancelAction)
                                
                                self.present(alertView, animated: true, completion: nil)
                                
                            }
                            self.listView.tableView.reloadData()
                        } catch {
                            print("Response Parsing Error: \(error)")
                        }
                    
                    
                case .failure(let error):
                    // Handle network error
                    print("Network Error: \(error)")
                }
            }
        }
    
    func sendFlagListIndexToServer() {
            let provider = MoyaProvider<FlagListAPI>()
            
            // Create a FlagPlus object with appropriate data
            let flagListIndex =  selectedCellIndex!
        print("=========================")
        print(progressViewController.flagId)
            
            // Make the API request
        provider.request(.flagCandidateFix(flagId: flagId, requestBody: selectedCellIndex!)) { result in
            switch result {
            case .success(let response):
                // Handle successful response
                let statusCode = response.statusCode
                print("Status Code: \(statusCode)")
                
                // Access response data
                let responseData = response.data
                if let dataString = String(data: responseData, encoding: .utf8) {
                    print("Response Data: \(dataString)")
                }
                
                // Access response headers
                let responseHeaders = response.response?.allHeaderFields
                print("Response Headers: \(responseHeaders)")
                
                // Access the entire response object
                print("Entire Response: \(response)")
                    
                case .failure(let error):
                    // Handle network error
                    print("Network Error: \(error)")
                }
            }
        }
    
}

// MARK: - TableViewDataSource

extension ListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numberFlagList
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath) as! CustomTableViewCell
        
//        cell.dateAndTimeLabel.text = "제목들어갈 자리, 셀번호 : \(indexPath.row + 1)"
        cell.dateAndTimeLabel.text = "\(flagListData[indexPath.row].date)     \(flagListData[indexPath.row].startTime)~\(flagListData[indexPath.row].endTime)"
        
        cell.ableUserName = flagListData[indexPath.row].candidates
        
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
}

extension ListViewController: UITableViewDelegate {
}
