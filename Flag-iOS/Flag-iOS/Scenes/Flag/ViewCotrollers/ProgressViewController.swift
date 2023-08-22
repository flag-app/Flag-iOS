//
//  ProgressViewController.swift
//  Flag-iOS
//
//  Created by 성현주 on 2023/08/09.
//

import UIKit

import SnapKit
import Moya

final class ProgressViewController: BaseUIViewController {
    
    // MARK: - Properties
   
    var selectedDates: [Date] = []
    var array = [1]
    var selcetedTime: Int = 1
    var allUserNumber: Int = 5
    
    var labels: [UILabel] = []
    var frequencyDict: [Int: Int] = [:]
    var selectedIndexPath: IndexPath?
    var selectedCell: Int = 1
    var one: [Int] = []
    var two: [Int] = []
    var three : [Int] = []
    var four : [Int] = []
    var five : [Int] = []
    var previouslySelectedIndexPaths: Set<IndexPath> = []
    var touchGestureRecognizer: UITapGestureRecognizer!
    
    // MARK: - UI Components
    
    private let progressView = ProgressView()
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        showProgress()
        userAcceptStatus()
        super.viewDidLoad()// showProgress()를 viewDidLoad()에서 호출
       }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
//        presentModalViewController()
    }
    
    // MARK: - Custom Method
    
    override func setUI() {
//        setStackView()
//        progressView.setLabels(labels)
        selectedDates.sort()
        view.addSubviews(progressView)
//        categorizeNumbers()
    }
    
    override func setLayout() {
        progressView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    override func addTarget() {
        progressView.modalButton.addTarget(self, action: #selector(presentModalBtnTap), for: .touchUpInside)
    }
    
    override func setDelegate(){
        progressView.collectionView.dataSource = self
        progressView.collectionView.delegate = self
        progressView.collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
    }
    
   
    
    @objc
    func didTappedNextButton() {
        let homeVC = BaseTabBarController()
        navigationController?.pushViewController(homeVC, animated: true)
    }

    @objc
    func presentModalBtnTap() {
        presentModal()
    }
    
    
    func presentModal(){
        let vc = ListViewController()
        vc.delegate = self
        vc.modalPresentationStyle = .pageSheet
        if let sheet = vc.sheetPresentationController {
            sheet.detents = [.medium(), .large()]
            sheet.delegate = self
            sheet.prefersGrabberVisible = true
        }
        present(vc, animated: true, completion: nil)
    }
    

    private func presentModalViewController() {
        presentModal()
    }
    
    func categorizeNumbers() {
        for element in array {
            if let count = frequencyDict[element] {
                frequencyDict[element] = count + 1
            } else {
                frequencyDict[element] = 1
            }
        }
        let borderNumber = allUserNumber/5
        for (element, count) in frequencyDict {
            switch count{
            case 0...borderNumber: one.append(element)
            case borderNumber...borderNumber*2: two.append(element)
            case borderNumber*2...borderNumber*3: three.append(element)
            case borderNumber*3...borderNumber*4: four.append(element)
            default: five.append(element)
            }
        }
    }
    
    func setStackView() {
        let endtime = selcetedTime + 5
        for i in selcetedTime...endtime {
            let label = UILabel()
            label.text = "\(i)"
            label.textAlignment = .center
            label.textColor = .black
            label.font = .body3
            labels.append(label)
        }
    }
    
    func getColorForIndexPath(_ indexPath: IndexPath) -> UIColor {
        if one.contains(indexPath.row) {
            return .purple1
        } else if two.contains(indexPath.row) {
            return .purple2
        } else if three.contains(indexPath.row) {
            return .purple3
        } else if four.contains(indexPath.row) {
            return .purple4
        } else if five.contains(indexPath.row) {
            return .purple5
        } else {
            return .white
        }
    }
}

     // MARK: - CollectionViewDataSource

extension ProgressViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let sectionCount = 13
        return (selectedDates.count) * sectionCount
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
        cell.backgroundColor = .white
        cell.layer.borderColor = UIColor.black.cgColor
        cell.layer.borderWidth = 1.0
        
        if indexPath.row < selectedDates.count  {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "E\nMM.dd"
            let dateLabel = UILabel(frame: cell.bounds)
            dateLabel.textAlignment = .center
            dateLabel.textColor = .black
            dateLabel.font = .body2
            dateLabel.numberOfLines = 0
            dateLabel.text = dateFormatter.string(from: selectedDates[indexPath.row])
            cell.contentView.addSubview(dateLabel)
        }
        
        if indexPath.row < selectedDates.count {
            cell.layer.borderColor = UIColor.white.cgColor
        } else {
            cell.layer.borderColor = UIColor.systemGray4.cgColor
        }
        cell.backgroundColor = getColorForIndexPath(indexPath)
        cell.layer.borderWidth = 1.0
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let columnCount = selectedDates.count
        let sectionCount = 13
        
        let itemWidth = collectionView.bounds.width / CGFloat(columnCount)
        let itemHeight = collectionView.bounds.height / CGFloat(sectionCount)
        
        return CGSize(width: itemWidth, height: itemHeight)
    }
   
    func showProgress() {
            let provider = MoyaProvider<FlagProgressAPI>()
            
        // Make the API request
            provider.request(.showProgress(flagId: 7)) { result in
                switch result {
                case .success(let response):
                    // Handle successful response
                    let statusCode = response.statusCode
                        print("Status Code: \(statusCode)")
                        // Process the response data as needed
                        do {
                            let responseData = try response.map(FlagProgress.self)
                            self.handleResponse(responseData) // 파싱된 데이터를 처리하는 메서드 호출
                            print(responseData)
                            let nonResponseUsers = responseData.nonResponseUsers
                            let acceptUsers = responseData.acceptUsers
                            self.progressView.acceptUsers.text = "\(acceptUsers)"
                            self.progressView.nonResponseUsers.text = "\(nonResponseUsers)"
                        } catch {
                            print("Response Parsing Error: \(error)")
                        }
                    
                    
                case .failure(let error):
                    // Handle network error
                    print("Network Error: \(error)")
                }
            }
        }
        
        func handleResponse(_ responseData: FlagProgress) {
            array = responseData.ableCells
            formet()
            
            func formet() {
                let dateStringArray = responseData.dates
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "yyyy-MM-dd"
                
                var dateArray: [Date] = []
                
                for dateString in dateStringArray {
                    if let date = dateFormatter.date(from: dateString) {
                        dateArray.append(date)
                    }
                }
                
                selectedDates = dateArray // 변환된 날짜 배열 출력
            }
            categorizeNumbers()
            allUserNumber = responseData.userTotalCount
            selcetedTime = responseData.timeSlot
            self.progressView.collectionView.reloadData()
            setStackView()
            progressView.setLabels(labels)
        }
   
    func selectTimeCell() {
            let provider = MoyaProvider<FlagProgressAPI>()
            
        // Make the API request
        provider.request(.selectTimeCell(flagId: 7, cellIndex: selectedCell )) { result in
                switch result {
                case .success(let response):
                    // Handle successful response
                    let statusCode = response.statusCode
                        print("Status Code: \(statusCode)")
                        // Process the response data as needed
                        do {
                            let responseData = try response.map(SelectTimeCell.self)
                            print(responseData)
                            let date = responseData.date
                            let startTime = responseData.startTime
                            let endTime = responseData.endTime
                            let members = responseData.members
                            self.progressView.friendDisplayLabel.text = "\(date) \(startTime)~\(endTime)에 가능한 친구들"
                            self.progressView.membersDisplayLabel.text = "\(members)"
                        } catch {
                            print("Response Parsing Error: \(error)")
                        }
                    
                    
                case .failure(let error):
                    // Handle network error
                    print("Network Error: \(error)")
                }
            }
        }
    
    func userAcceptStatus() {
            let provider = MoyaProvider<FlagProgressAPI>()
        // Make the API request
            provider.request(.userAcceptStatus(flagId: 7)) { result in
                switch result {
                case .success(let response):
                    // Handle successful response
                    let statusCode = response.statusCode
                        print("Status Code: \(statusCode)")
                    //print(String(data: response.data, encoding: .utf8))
                        // Process the response data as needed
                        do {
                            let responseData = try JSONDecoder().decode(Bool.self, from: response.data)
                                print("User Accept Status: \(responseData)")
                            if responseData {
                                self.presentModalViewController()
                                } else {
                                // The value is false
                                    self.progressView.modalButton.isHidden = true
                                    self.progressView.modalButton.removeFromSuperview()
                                    self.progressView.scrollView.snp.makeConstraints { make in
                                        make.bottom.equalToSuperview().offset(-20)
                                    }
                                    
                                            }
                        } catch {
                            print("Response Parsing Error: \(error)")
                        }
                    
                    
                case .failure(let error):
                    // Handle network error
                    print("Network Error: \(error)")
                }
            }
        }
}

extension ProgressViewController: UICollectionViewDelegate {
        func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            if indexPath.row >= selectedDates.count {
                if selectedIndexPath != indexPath {
                    if let previouslySelectedIndexPath = selectedIndexPath {
                        let cell = collectionView.cellForItem(at: previouslySelectedIndexPath)
                        cell?.backgroundColor = getColorForIndexPath(previouslySelectedIndexPath)
                    }

                    let cell = collectionView.cellForItem(at: indexPath)
                    cell?.backgroundColor = .red
                    selectedIndexPath = indexPath
                    selectedCell = indexPath.row
                    print("선택된 셀 번호 : \(indexPath.row)")
                    selectTimeCell()
                }
            }
        }
    }

extension ProgressViewController: UISheetPresentationControllerDelegate {
    func sheetPresentationControllerDidChangeSelectedDetentIdentifier(_ sheetPresentationController: UISheetPresentationController) {
    }
}

extension ProgressViewController: ListViewControllerDelegate {
    func didDismissModal(with information: Int?) {
        if let info = information {
            print("모달로부터 전달된 리스트: \(info)")
        }
        //살짝 에니메이션
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            let homeVC = BaseTabBarController()
            //self.navigationController?.pushViewController(homeVC, animated: true)
            self.navigationController?.popToRootViewController(animated: true)
        }
    }
}
