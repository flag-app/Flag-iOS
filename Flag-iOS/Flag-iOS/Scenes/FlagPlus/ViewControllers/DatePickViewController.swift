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
    var stringSelectedDates: [String] = []
    var selcetedTime: Int = -1
    
    // MARK: - UI Components
    
    private let datePickView = DatePickView()
    
    // MARK: - Life Cycle
    
    // MARK: - Custom Method
    
    override func setUI() {
        view.addSubviews(datePickView)
        buttonStatus()
    }
    
    override func setLayout() {
        datePickView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    override func addTarget() {
        datePickView.nextButton.addTarget(self, action: #selector(didTappedNextButton), for: .touchUpInside)
        datePickView.delegate = self
    }
    
    override func setDelegate(){
        datePickView.dateView.delegate = self
        let dateSelection = UICalendarSelectionMultiDate(delegate: self)
        datePickView.dateView.selectionBehavior = dateSelection
    }
    
    @objc
    func didTappedNextButton() {
        guard selectedDates.count > 0, selectedDates.count <= 5 else {
            return
        }
        let locationVC = LocationViewController()
        locationVC.selectedDates = selectedDates
        locationVC.selcetedTime = datePickView.selectedTime
        locationVC.minTime = datePickView.minTime
        _ = Calendar.current
        self.navigationController?.pushViewController(locationVC, animated: true)
        
        dateFormatter()
        let flagPlusInfo = FlagPlusInfo.shared
        flagPlusInfo.dates = stringSelectedDates
        flagPlusInfo.timeSlot = datePickView.selectedTime
        flagPlusInfo.minTime = datePickView.minTime
    }

    func dateFormatter() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        stringSelectedDates = selectedDates.map { dateFormatter.string(from: $0) }
    }
    
    
    func buttonStatus() {
        if selectedDates.isEmpty || selectedDates.count > 5 || datePickView.minTime == -1 || datePickView.selectedTime == -1 {
            datePickView.nextButton.isEnabled = false
        } else {
            datePickView.nextButton.isEnabled = true
        }
    }
}

// MARK: - UITabelViewDataSource
extension DatePickViewController: UICalendarViewDelegate, UICalendarSelectionMultiDateDelegate {
    func multiDateSelection(_ selection: UICalendarSelectionMultiDate, didSelectDate dateComponents: DateComponents) {
        guard let date = Calendar.current.date(from: dateComponents) else {
            return
        }
        selectedDates.append(date)
        buttonStatus()
        dateFormatter()
    }
    
    func multiDateSelection(_ selection: UICalendarSelectionMultiDate, didDeselectDate dateComponents: DateComponents) {
        guard let date = Calendar.current.date(from: dateComponents) else {
            return
        }
        
        if let index = selectedDates.firstIndex(of: date) {
            selectedDates.remove(at: index)
        }
        buttonStatus()
    }
    
    func dateSelection(_ selection: UICalendarSelectionMultiDate, didSelectDates dateComponents: [DateComponents]) {
        let calendar = Calendar.current
        selectedDates = dateComponents.compactMap { calendar.date(from: $0) }
    }
}

//MARK: - ButtonStatus

extension DatePickViewController: DatePickViewDelegate {
    func timeValuesDidChange(selectedTime: Int, minTime: Int) {
        buttonStatus()
    }
}


//@objc
//func didTappedNextButton() {
//    let flagPlusInfo = FlagPlusInfo.shared
//    flagPlusInfo.guestId = guestNames
//    let datePickVC = DatePickViewController()
//    self.navigationController?.pushViewController(datePickVC, animated: true)
//}
