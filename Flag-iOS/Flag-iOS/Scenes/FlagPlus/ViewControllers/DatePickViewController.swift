//
//  DatePickViewController.swift
//  Flag-iOS
//
//  Created by 성현주 on 2023/08/05.
//

import UIKit

final class DatePickViewController: BaseUIViewController {
    
    // MARK: - Properties
    
    var selectedDates: [Date] = []
    var selcetedTime: Int = -1
    
    // MARK: - UI Components
    
    private let datePickView = DatePickView()
    
    // MARK: - Life Cycle
    
    // MARK: - Custom Method
    
    override func setUI() {
        view.addSubviews(datePickView)
    }
    
    override func setLayout() {
        datePickView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    override func addTarget() {
        datePickView.nextButton.addTarget(self, action: #selector(didTappedNextButton), for: .touchUpInside)            
    }
    
    override func setDelegate(){
        datePickView.dateView.delegate = self
        let dateSelection = UICalendarSelectionMultiDate(delegate: self)
        datePickView.dateView.selectionBehavior = dateSelection
    }
    
    @objc
    func didTappedNextButton() {
        let homeVC = LocationViewController()
        homeVC.selectedDates = selectedDates
        homeVC.selcetedTime = datePickView.selcetedTime
        _ = Calendar.current
        self.navigationController?.pushViewController(homeVC, animated: true)
    }
}

// MARK: - UITabelViewDataSource
extension DatePickViewController: UICalendarViewDelegate, UICalendarSelectionMultiDateDelegate {
    func multiDateSelection(_ selection: UICalendarSelectionMultiDate, didSelectDate dateComponents: DateComponents) {
        guard let date = Calendar.current.date(from: dateComponents) else {
            return
        }
        selectedDates.append(date)
    }
    
    func multiDateSelection(_ selection: UICalendarSelectionMultiDate, didDeselectDate dateComponents: DateComponents) {
        guard let date = Calendar.current.date(from: dateComponents) else {
            return
        }
        
        if let index = selectedDates.firstIndex(of: date) {
            selectedDates.remove(at: index)
        }
    }
    
    func dateSelection(_ selection: UICalendarSelectionMultiDate, didSelectDates dateComponents: [DateComponents]) {
        let calendar = Calendar.current
        selectedDates = dateComponents.compactMap { calendar.date(from: $0) }
    }
}
