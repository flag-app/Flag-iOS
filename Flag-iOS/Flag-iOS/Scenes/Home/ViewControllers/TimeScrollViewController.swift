//
//  TimeScrollViewController.swift
//  Flag-iOS
//
//  Created by 성현주 on 2023/08/06.
//
import UIKit

import SnapKit

final class TimeScrollViewController: BaseUIViewController {
    
    // MARK: - Properties
    var selectedDates: [Date] = []
    var selcetedTime: Int = 0
    
    // MARK: - UI Components
    private let timeScrollView = TimeScrollView()
    
    // MARK: - Life Cycle
    
    // MARK: - Custom Method
    
    override func setUI() {
        view.addSubviews(timeScrollView)
    }
    
    override func setLayout() {
        timeScrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    override func addTarget() {
        timeScrollView.nextButton.addTarget(self, action: #selector(didTappedNextButton), for: .touchUpInside)
    }
    
    override func setDelegate(){
        timeScrollView.collectionView.dataSource = self
        timeScrollView.collectionView.delegate = self
        timeScrollView.collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
    }

    
    @objc
    func didTappedNextButton() {
        let homeVC = BaseTabBarController()
        self.navigationController?.pushViewController(homeVC, animated: true)
    }
    
}
     // MARK: - CollectionViewDataSource
extension TimeScrollViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
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
            dateFormatter.dateFormat = "MM/dd(E)" // 요일도 추가
            let dateLabel = UILabel(frame: cell.bounds)
            dateLabel.textAlignment = .center
            dateLabel.textColor = .black
            dateLabel.text = dateFormatter.string(from: selectedDates[indexPath.row])
            cell.contentView.addSubview(dateLabel)
        }
        
        if indexPath.row < selectedDates.count {
            // 첫 번째 행의 셀 테두리 색상
            cell.layer.borderColor = UIColor.white.cgColor
        } else {
            // 나머지 행의 셀 테두리 색상
            cell.layer.borderColor = UIColor.systemGray4.cgColor
        }
        cell.layer.borderWidth = 1.0
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let columnCount = selectedDates.count
        let sectionCount = 13
        
        if indexPath.item < columnCount {
            // 첫 번째 행의 아이템 크기
            let itemWidth = collectionView.bounds.width / CGFloat(columnCount)
            let itemHeight: CGFloat = 40.0 // 첫 번째 행의 고정된 세로 크기//40
            return CGSize(width: itemWidth, height: itemHeight)
        } else {
            // 나머지 행의 아이템 크기
            let itemWidth = collectionView.bounds.width / CGFloat(columnCount)
            let itemHeight = collectionView.bounds.height / CGFloat(sectionCount)
            return CGSize(width: itemWidth, height: itemHeight)
        }
    }
}



