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
    var one: [Int] = []
    var two: [Int] = []
    var three : [Int] = []
    var four : [Int] = []
    var five : [Int] = []
    
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
            dateFormatter.dateFormat = "E\nMM/dd"
            let dateLabel = UILabel(frame: cell.bounds)
            dateLabel.textAlignment = .center
            dateLabel.textColor = .black
            dateLabel.numberOfLines = 0
            dateLabel.text = dateFormatter.string(from: selectedDates[indexPath.row])
            cell.contentView.addSubview(dateLabel)
        }
        
        if indexPath.row < selectedDates.count {
            cell.layer.borderColor = UIColor.white.cgColor
        } else {
            cell.layer.borderColor = UIColor.systemGray4.cgColor
        }
        if one.contains(indexPath.row) {
                cell.backgroundColor = .purple1
            }
        if two.contains(indexPath.row) {
                cell.backgroundColor = .purple2
            }
        if three.contains(indexPath.row) {
                cell.backgroundColor = .purple3
            }
        if four.contains(indexPath.row) {
                cell.backgroundColor = .purple4
            }
        if five.contains(indexPath.row) {
                cell.backgroundColor = .purple5
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


