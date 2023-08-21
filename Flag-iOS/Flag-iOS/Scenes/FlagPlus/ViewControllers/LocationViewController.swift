//
//  LocationViewController.swift
//  Flag-iOS
//
//  Created by 성현주 on 2023/08/05.
//

import Foundation

import SnapKit

class LocationViewController: BaseUIViewController {
    
    // MARK: - Properties
    
    var selectedDates: [Date] = []
    var selcetedTime: Int = 0
    var minTime: Int = 0
    
    // MARK: - UI Components
    
    private let locationView = LoactionView()
    
    // MARK: - Life Cycle
    
    // MARK: - Custom Method
    
    override func setUI() {
        view.addSubviews(locationView)
    }
    
    override func setLayout() {
        locationView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    override func addTarget() {
        locationView.nextButton.addTarget(self, action: #selector(didTappedNextButton), for: .touchUpInside)
    }
    
    @objc
    func didTappedNextButton() {
        let timeScrollVC = TimeScrollViewController()
        timeScrollVC.selectedDates = selectedDates
        timeScrollVC.selcetedTime = selcetedTime
        timeScrollVC.minTime = minTime
        self.navigationController?.pushViewController(timeScrollVC, animated: true)
        
        let flagPlusInfo = FlagPlusInfo.shared
        flagPlusInfo.place = locationView.locationTextField.text ?? ""
        flagPlusInfo.memo = locationView.memoTextView.text
    }
    
}


