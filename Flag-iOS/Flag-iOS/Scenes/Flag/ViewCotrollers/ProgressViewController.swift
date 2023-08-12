//
//  ProgressViewController.swift
//  Flag-iOS
//
//  Created by 성현주 on 2023/08/09.
//

import UIKit

import SnapKit

final class ProgressViewController: BaseUIViewController {
    
    // MARK: - Properties
   
    //더미데이터
    var selectedDates: [Date] = [
        Calendar.current.date(from: DateComponents(year: 2023, month: 8, day: 22))!,
        Calendar.current.date(from: DateComponents(year: 2023, month: 8, day: 24))!,
        Calendar.current.date(from: DateComponents(year: 2023, month: 8, day: 23))!,
        Calendar.current.date(from: DateComponents(year: 2023, month: 8, day: 21))!,
        Calendar.current.date(from: DateComponents(year: 2023, month: 8, day: 20))!
    ]
    var array = [15, 40, 18, 30, 46, 31, 20, 44, 56, 61, 34, 42, 29, 32, 37, 36, 63, 41, 54, 28, 5, 52, 58, 62, 10, 35, 49, 8, 53, 51, 45, 13, 47, 24, 57, 23, 39, 25,46, 47, 15, 10, 35, 36, 41, 53, 33, 25, 27, 17, 16, 18, 44, 32, 48, 37, 28, 43, 42,54, 28, 25, 47, 59, 43, 40, 41, 19, 39, 52, 15, 44, 49, 38, 53, 37, 33, 22, 30, 57, 20, 42, 36, 63, 12, 27, 64, 17, 45, 62, 51, 61, 10, 46, 35, 48, 56, 58, 14, 20, 38, 29, 10,10,37,37,35,42,20,36,28,28]
    var selcetedTime: Int = 1
    //여기까지
    
    var labels: [UILabel] = []
    var frequencyDict: [Int: Int] = [:]
    var selectedIndexPath: IndexPath?
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
    
    // MARK: - Custom Method
    
    override func setUI() {
        setStackView()
        progressView.setLabels(labels)
        selectedDates.sort()
        view.addSubviews(progressView)
        categorizeNumbers()
    }
    
    override func setLayout() {
        progressView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    override func addTarget() {
        progressView.nextButton.addTarget(self, action: #selector(didTappedNextButton), for: .touchUpInside)
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
        self.navigationController?.pushViewController(homeVC, animated: true)
    }
    
    @objc
    private func presentModalBtnTap() {
        
        let vc = ListViewController()
        
        vc.modalPresentationStyle = .pageSheet
        
        if let sheet = vc.sheetPresentationController {
            
            sheet.detents = [.medium(), .large()]
            sheet.delegate = self
            sheet.prefersGrabberVisible = true
            
        }
        
        present(vc, animated: true, completion: nil)
    }
    
    func categorizeNumbers() {
        for element in array {
            if let count = frequencyDict[element] {
                frequencyDict[element] = count + 1
            } else {
                frequencyDict[element] = 1
            }
        }
        for (element, count) in frequencyDict {
            if count == 1 {
                one.append(element)
            } else if count == 2 {
                two.append(element)
            } else if count == 3 {
                three.append(element)
            }else if count == 4 {
                four.append(element)
            }else if count == 5 {
                five.append(element)
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
                    print("선택된 셀 번호 : \(indexPath.row)")
                }
            }
        }
    }

extension ProgressViewController: UISheetPresentationControllerDelegate {
    func sheetPresentationControllerDidChangeSelectedDetentIdentifier(_ sheetPresentationController: UISheetPresentationController) {
    }
}
