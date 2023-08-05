//
//  DatePickView.swift
//  Flag-iOS
//
//  Created by 성현주 on 2023/08/05.
//

import Foundation
import UIKit

final class DatePickView: BaseUIView {
    
    // MARK: - Properties
    let datepicker = UIDatePicker()
    var selectedDates: [Date] = []
    var selcetedTime: Int = -1
    
    
    // MARK: - UI Components
    lazy var nextButton: BaseFillButton = {
        let button = BaseFillButton()
        button.setTitle(TextLiterals.nextText, for: .normal)
        return button
    }()
    private let dateLabel: UILabel = {
        let label = UILabel()
        label.text = TextLiterals.flagDateText
        label.font = .title1
        return label
    }()
    private let timeLabel: UILabel = {
        let label = UILabel()
        label.text = TextLiterals.flagTimeText
        label.font = .title1
        return label
    }()
    lazy var popButton: UIButton = {
        let button = UIButton(type: .system)
        button.layer.cornerRadius = 16
        button.showsMenuAsPrimaryAction = true
        let one = UIAction(title: "새벽(24:00~5:59)", handler: { _ in
            print("24")
            self.selcetedTime = 0
            self.displayLabel.text = "새벽🌚"
            self.displayLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        })
        let two = UIAction(title: "저녁(18:00~23:59)",  handler: { _ in
            print("18")
            self.selcetedTime = 18
            self.displayLabel.text = "저녁🌙"
            self.displayLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)


        })
        let three = UIAction(title: "오후(12:00~17:59)",  handler: { _ in
            print("12")
            self.selcetedTime = 12
            self.displayLabel.text = "오후🌞"
            self.displayLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)


        })
        let four = UIAction(title: "오전(6:00~11:59)",  handler: { _ in
            print("6")
            self.selcetedTime = 6
            self.displayLabel.text = "오전🌅"
            self.displayLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)


        })
        let plus = UIAction(title: "직접입력",  handler: { _ in
            print("plus")
//            let alertController = UIAlertController(title: "직접 입력", message: nil, preferredStyle: .alert)
//            alertController.addTextField { textField in
//                textField.placeholder = "직접 시간을 입력해주세요.ex)13"
//                textField.keyboardType = .numberPad
//            }
//            let confirmAction = UIAlertAction(title: "확인", style: .default) { _ in
//                if let timeString = alertController.textFields?.first?.text,
//                   let selectedTime = Int(timeString) {
//                    self.selcetedTime = selectedTime
//                } else {
//                    self.selcetedTime = -1
//                }
//                print(self.selcetedTime)
//                let endtime = self.selcetedTime + 5
//                self.displayLabel.text = "\(self.selcetedTime):00 ~ \(endtime):59"
//            }
//            let cancelAction = UIAlertAction(title: "취소", style: .cancel, handler: nil)
//            alertController.addAction(confirmAction)
//            alertController.addAction(cancelAction)
//            self.present(alertController, animated: true, completion: nil)
        })
        button.menu = UIMenu(title: "시간대를 골라주세요!",
                             identifier: nil,
                             options: .displayInline,
                             children: [one,two,three,four,plus])
        button.showsMenuAsPrimaryAction = true
        button.changesSelectionAsPrimaryAction = true
        return button
    }()

    lazy var displayLabel : UILabel = {
        let label = UILabel()
        label.text = "시간고르면 상태?표시 라벨"
        return label
    }()
    
    lazy var dateView: UICalendarView = {
        let view = UICalendarView()
        view.wantsDateDecorations = true
        return view
    }()
  
    
    
    // MARK: - Custom Method
    override func setUI() {
        self.addSubviews(nextButton,dateLabel,popButton,displayLabel,dateView,timeLabel)
        
    }
    override func setLayout() {
        nextButton.snp.makeConstraints {
            $0.bottom.equalTo(safeAreaLayoutGuide).inset(21)
            $0.horizontalEdges.equalToSuperview().inset(25)
            $0.height.equalTo(49)
        }
        dateLabel.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide).offset(93)
            $0.leading.equalToSuperview().offset(25)
        }
        dateView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(dateLabel.snp.bottom).offset(20)
            make.height.equalTo(405)
            make.leading.trailing.equalToSuperview()
        }
        timeLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(31)
            make.top.equalTo(dateView.snp.bottom).offset(10)
        }
        popButton.snp.makeConstraints { make in
            make.top.equalTo(timeLabel.snp.bottom).offset(10)
            make.leading.equalToSuperview().inset(31)
        }
        displayLabel.snp.makeConstraints { make in
            make.top.equalTo(popButton.snp.bottom).offset(10)
            make.leading.equalToSuperview().inset(31)
        }
    }

}
