//
//  DatePickView.swift
//  Flag-iOS
//
//  Created by 성현주 on 2023/08/05.
//
import UIKit

final class DatePickView: BaseUIView {
    
    // MARK: - Properties
    var selectedDates: [Date] = []
    var selcetedTime: Int = -1
    
    // MARK: - UI Components
    
    let datePicker = UIDatePicker()
    
    lazy var nextButton: BaseFillButton = {
        let button = BaseFillButton()
        button.setTitle(TextLiterals.nextText, for: .normal)
        button.isEnabled = true
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
        
        let times: [UIAction] = [
            UIAction(title: "새벽(24:00~5:59)", handler: selectTimeAction(0, "새벽🌚")),
            UIAction(title: "저녁(18:00~23:59)", handler: selectTimeAction(18, "저녁🌙")),
            UIAction(title: "오후(12:00~17:59)", handler: selectTimeAction(12, "오후🌞")),
            UIAction(title: "오전(6:00~11:59)", handler: selectTimeAction(6, "오전🌅")),
            UIAction(title: "직접입력", handler: directInputAction)
        ]
        
        button.menu = UIMenu(title: "시간대를 골라주세요",
                             identifier: nil,
                             options: .displayInline,
                             children: times)
        button.showsMenuAsPrimaryAction = true
        button.changesSelectionAsPrimaryAction = true
        return button
    }()

    lazy var displayLabel : UILabel = {
        let label = UILabel()
        label.text = "Tip:무더운 여름엔 오후에 약속을 잡는건 어때요?"
        return label
    }()
    
    lazy var dateView: UICalendarView = {
        let view = UICalendarView()
        view.wantsDateDecorations = true
        return view
    }()
    
    //MARK: - Func
    
    func selectTimeAction(_ time: Int, _ label: String) -> UIActionHandler {
        return { [weak self] _ in
            self?.selcetedTime = time
            self?.displayLabel.text = label
            self?.displayLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        }
    }
    
    func directInputAction(_ action: UIAction) {
        let alertController = UIAlertController(title: "직접 입력", message: nil, preferredStyle: .alert)
        alertController.addTextField { textField in
            textField.placeholder = "직접 시간을 입력해주세요.ex)13"
            textField.keyboardType = .numberPad
        }
        let confirmAction = UIAlertAction(title: "확인", style: .default) { _ in
            if let timeString = alertController.textFields?.first?.text,
               let selectedTime = Int(timeString) {
                self.selcetedTime = selectedTime
            } else {
                self.selcetedTime = -1
            }
            let endtime = self.selcetedTime + 5
            self.displayLabel.text = "\(self.selcetedTime):00 ~ \(endtime):59"
        }
        let cancelAction = UIAlertAction(title: "취소", style: .cancel, handler: nil)
        alertController.addAction(confirmAction)
        alertController.addAction(cancelAction)
        self.window?.rootViewController?.present(alertController, animated: true, completion: nil)
    }
    
    // MARK: - Custom Method
    override func setUI() {
        self.addSubviews(nextButton,
                         dateLabel,
                         popButton,
                         displayLabel,
                         dateView,
                         timeLabel)
        
    }
    override func setLayout() {
        nextButton.snp.makeConstraints {
            $0.bottom.equalTo(safeAreaLayoutGuide).inset(21)
            $0.horizontalEdges.equalToSuperview().inset(25)
            $0.height.equalTo(49)
        }
        dateLabel.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide).offset(40)
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
