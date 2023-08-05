//
//  DatePickViewController.swift
//  Flag-iOS
//
//  Created by 성현주 on 2023/08/05.
//

import Foundation
import UIKit
final class DatePickViewController: BaseUIViewController {
    
    // MARK: - Properties
    var selectedDates: [Date] = []
    // MARK: - UI Components
    private let datePickView = DatePickView()
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
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
        datePickView.popButton.addTarget(self, action: #selector(didTapPlusButton), for: .touchUpInside)
    }
    override func setDelegate(){
        datePickView.dateView.delegate = self
        let dateSelection = UICalendarSelectionMultiDate(delegate: self)
        datePickView.dateView.selectionBehavior = dateSelection
    }
    
    @objc
    func didTappedNextButton() {
        let homeVC = BaseTabBarController()
        self.navigationController?.pushViewController(homeVC, animated: true)
    }
    @objc private func didTapPlusButton() {
            let alertController = UIAlertController(title: "직접 입력", message: nil, preferredStyle: .alert)
            alertController.addTextField { textField in
                textField.placeholder = "직접 시간을 입력해주세요.ex)13"
                textField.keyboardType = .numberPad
            }
            let confirmAction = UIAlertAction(title: "확인", style: .default) { _ in
                if let timeString = alertController.textFields?.first?.text,
                   let selectedTime = Int(timeString) {
                    self.datePickView.selcetedTime = selectedTime
                } else {
                    self.datePickView.selcetedTime = -1
                }
                print(self.datePickView.selcetedTime)
                let endtime = self.datePickView.selcetedTime + 5
                self.datePickView.displayLabel.text = "\(self.datePickView.selcetedTime):00 ~ \(endtime):59"
            }
            let cancelAction = UIAlertAction(title: "취소", style: .cancel, handler: nil)
            alertController.addAction(confirmAction)
            alertController.addAction(cancelAction)
            present(alertController, animated: true, completion: nil)
        }
    
    
    
}
// MARK: - Extension
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
