//
//  TestTimeScrollViewController.swift
//  Flag-iOS
//
//  Created by 최지우 on 2023/08/23.
//

import UIKit

import Moya

class GuestTimeScrollViewController: BaseUIViewController {
    
    // MARK: - Properties
    
    var flagId: Int = 0 {
        didSet {
            print("♥️\(flagId)")
        }
    }
    
    var selectedDates: [Date] = []
    var selcetedTime: Int = 0
    var minTime: Int = 0
    var labels: [UILabel] = []
    var selectedIndexPaths: [IndexPath] = []
    var previouslySelectedIndexPaths: Set<IndexPath> = []
    var panGestureRecognizer: UIPanGestureRecognizer!
    var touchGestureRecognizer: UITapGestureRecognizer!
    
    // MARK: - UI Components
    
    
    private let guestTimeScrollView = GuestTimeScrollView()
    
    // MARK: - Life Cycle
    
    
    // MARK: - Custom Method
    
    override func setUI() {
//        setStackView()
//        guestTimeScrollView.setLabels(labels)
        selectedDates.sort()
        view.addSubviews(guestTimeScrollView)
        buttonStatus()
        showProgress()
    }
    
    override func setLayout() {
        guestTimeScrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    override func addTarget() {
        guestTimeScrollView.nextButton.addTarget(self, action: #selector(didTappedNextButton), for: .touchUpInside)
    }
    
    override func setDelegate(){
        guestTimeScrollView.collectionView.dataSource = self
        guestTimeScrollView.collectionView.delegate = self
        guestTimeScrollView.collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
        
        panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(handlePanGesture(_:)))
        panGestureRecognizer.delegate = self
        guestTimeScrollView.collectionView.addGestureRecognizer(panGestureRecognizer)
        
        touchGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleTouchGesture(_:)))
        touchGestureRecognizer.delegate = self
        guestTimeScrollView.collectionView.addGestureRecognizer(touchGestureRecognizer)
        
        
        
    }
    
    @objc
    private func handlePanGesture(_ recognizer: UIPanGestureRecognizer) {
        let touchLocation = recognizer.location(in: guestTimeScrollView.collectionView)
        if let indexPath = guestTimeScrollView.collectionView.indexPathForItem(at: touchLocation) {
            if indexPath.row >= selectedDates.count {
                
                if recognizer.state == .changed {
                    if !previouslySelectedIndexPaths.contains(indexPath) {
                        guestTimeScrollView.collectionView.cellForItem(at: indexPath)?.backgroundColor = .purple200
                        previouslySelectedIndexPaths.insert(indexPath)
                    }
                }
            }
        }
        buttonStatus()
    }
    
    @objc
    private func handleTouchGesture(_ recognizer: UITapGestureRecognizer) {
        let touchLocation = recognizer.location(in: guestTimeScrollView.collectionView)
        if let indexPath = guestTimeScrollView.collectionView.indexPathForItem(at: touchLocation) {
            if indexPath.row >= selectedDates.count {
                    if previouslySelectedIndexPaths.contains(indexPath) {
                        guestTimeScrollView.collectionView.cellForItem(at: indexPath)?.backgroundColor = .white
                        previouslySelectedIndexPaths.remove(indexPath)
                    } else {
                        guestTimeScrollView.collectionView.cellForItem(at: indexPath)?.backgroundColor = .purple200
                        previouslySelectedIndexPaths.insert(indexPath)
                    }
            }
        }
        buttonStatus()
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

    func buttonStatus() {
        let selectedCellIndices = previouslySelectedIndexPaths.map { $0.item }
        if selectedCellIndices.isEmpty {
            guestTimeScrollView.nextButton.isEnabled = false
        } else{
            guestTimeScrollView.nextButton.isEnabled = true
        }
    }
    
    @objc
    func didTappedNextButton() {
        let selectedCellIndices = previouslySelectedIndexPaths.map { $0.item }
        print(selectedCellIndices)
        sendGuestCellIndexToServer()
        print("tap")
        navigationController?.popToRootViewController(animated: true)
     
    }
    
    //MARK: -NetWork
   
    func showProgress() {
            let provider = MoyaProvider<FlagProgressAPI>()
            
        // Make the API request
            provider.request(.showProgress(flagId: flagId)) { result in
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
                //selectedDates.sort()
            }
            selcetedTime = responseData.timeSlot
            self.guestTimeScrollView.collectionView.reloadData()
            setStackView()
            guestTimeScrollView.setLabels(labels)
        }
    
    func sendGuestCellIndexToServer() {
            let provider = MoyaProvider<FlagGuestAPI>()
            
            // Create a FlagPlus object with appropriate data
           // let guestCellIndex =  [1,2,3,4]
        let selectedCellIndices = previouslySelectedIndexPaths.map { $0.item }
        let guestFlagDate = GuestFlag(possibleDates: selectedCellIndices)
            
            // Make the API request
        provider.request(.flagGuestScrollCell(flagId: flagId, requestBody: guestFlagDate)) { result in
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

     // MARK: - CollectionViewDataSource

extension GuestTimeScrollViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
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
            dateFormatter.dateFormat = "E\nMM/dd"
            let dateLabel = UILabel(frame: cell.bounds)
            dateLabel.textAlignment = .center
            dateLabel.textColor = .black
            dateLabel.numberOfLines = 0
            dateLabel.text = dateFormatter.string(from: selectedDates[indexPath.row])
            dateLabel.font = .body2
            cell.contentView.addSubview(dateLabel)
        }
        
        if indexPath.row < selectedDates.count {
            cell.layer.borderColor = UIColor.white.cgColor
        } else {
            cell.layer.borderColor = UIColor.systemGray4.cgColor
        }
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
}


extension GuestTimeScrollViewController: UIGestureRecognizerDelegate {
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
}

