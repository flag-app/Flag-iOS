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
    var labels: [UILabel] = []
    var selectedIndexPaths: [IndexPath] = []
    var previouslySelectedIndexPaths: Set<IndexPath> = []
    var panGestureRecognizer: UIPanGestureRecognizer!
    var touchGestureRecognizer: UITapGestureRecognizer!
    
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
        // 팬 제스처 인식기 생성 및 델리게이트 설정
        panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(handlePanGesture(_:)))
        panGestureRecognizer.delegate = self
        timeScrollView.collectionView.addGestureRecognizer(panGestureRecognizer)
        
        // 터치 제스처 인식기 생성 및 델리게이트 설정
        touchGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleTouchGesture(_:)))
        touchGestureRecognizer.delegate = self
        timeScrollView.collectionView.addGestureRecognizer(touchGestureRecognizer)
        
    }
    
    @objc
    private func handlePanGesture(_ recognizer: UIPanGestureRecognizer) {
        let touchLocation = recognizer.location(in: timeScrollView.collectionView)
        if let indexPath = timeScrollView.collectionView.indexPathForItem(at: touchLocation) {
            if indexPath.row >= selectedDates.count {
                
                if recognizer.state == .changed {
                    if !previouslySelectedIndexPaths.contains(indexPath) {
                        // 셀 선택
                        timeScrollView.collectionView.cellForItem(at: indexPath)?.backgroundColor = .purple200
                        previouslySelectedIndexPaths.insert(indexPath)
                    }
                }
            }
        }
    }
    
    @objc
    private func handleTouchGesture(_ recognizer: UITapGestureRecognizer) {
        let touchLocation = recognizer.location(in: timeScrollView.collectionView)
        if let indexPath = timeScrollView.collectionView.indexPathForItem(at: touchLocation) {
            if indexPath.row >= selectedDates.count {
                    if previouslySelectedIndexPaths.contains(indexPath) {
                        // 셀 선택 해제
                        timeScrollView.collectionView.cellForItem(at: indexPath)?.backgroundColor = .white
                        previouslySelectedIndexPaths.remove(indexPath)
                    } else {
                        // 셀 선택
                        timeScrollView.collectionView.cellForItem(at: indexPath)?.backgroundColor = .purple200
                        previouslySelectedIndexPaths.insert(indexPath)
                    }
            }
        }
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

extension TimeScrollViewController: UIGestureRecognizerDelegate {
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        // 다른 제스처 인식기와 함께 사용할 수 있도록 하는코드
        return true
    }
}

