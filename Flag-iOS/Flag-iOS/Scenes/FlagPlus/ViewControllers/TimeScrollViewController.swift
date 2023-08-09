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
        setStackView()
        timeScrollView.setLabels(labels)
        selectedDates.sort()
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
        
        panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(handlePanGesture(_:)))
        panGestureRecognizer.delegate = self
        timeScrollView.collectionView.addGestureRecognizer(panGestureRecognizer)
        
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
                        timeScrollView.collectionView.cellForItem(at: indexPath)?.backgroundColor = .white
                        previouslySelectedIndexPaths.remove(indexPath)
                    } else {
                        timeScrollView.collectionView.cellForItem(at: indexPath)?.backgroundColor = .purple200
                        previouslySelectedIndexPaths.insert(indexPath)
                    }
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


extension TimeScrollViewController: UIGestureRecognizerDelegate {
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
}

