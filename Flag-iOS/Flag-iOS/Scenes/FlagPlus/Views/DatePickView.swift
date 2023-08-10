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
            UIAction(title: TextLiterals.flagDawnText, handler: selectTimeAction(0, TextLiterals.flagDawnImage)),
            UIAction(title: TextLiterals.flagDinnerText, handler: selectTimeAction(18, TextLiterals.flagDinnerImage)),
            UIAction(title: TextLiterals.flagAfternoonText, handler: selectTimeAction(12, TextLiterals.flagAfternoonImage)),
            UIAction(title: TextLiterals.flagMorningText, handler: selectTimeAction(6, TextLiterals.flagMorningImage)),
            UIAction(title: TextLiterals.flagDirectInput, handler: directInputAction)
        ]
        
        button.menu = UIMenu(title: TextLiterals.flagTimePickText,
                             identifier: nil,
                             options: .displayInline,
                             children: times)
        button.showsMenuAsPrimaryAction = true
        button.changesSelectionAsPrimaryAction = true

        return button
    }()
    
    lazy var displayLabel : UILabel = {
        let label = UILabel()
        label.text = TextLiterals.flagTipText
        return label
    }()
    
    lazy var dateView: UICalendarView = {
        let view = UICalendarView()
        view.wantsDateDecorations = true
        return view
    }()
    
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
    
    func selectTimeAction(_ time: Int, _ label: String) -> UIActionHandler {
        return { [weak self] _ in
            self?.selcetedTime = time
            self?.displayLabel.text = label
            self?.displayLabel.font = .head1
        }
    }
    
    func directInputAction(_ action: UIAction) {
        let alertController = UIAlertController(title: TextLiterals.flagDirectInput, message: nil, preferredStyle: .alert)
        alertController.addTextField { textField in
            textField.placeholder = TextLiterals.flagDirectInputHint
            textField.keyboardType = .numberPad
        }
        let confirmAction = UIAlertAction(title: TextLiterals.flagConfirmText, style: .default) { _ in
            if let timeString = alertController.textFields?.first?.text,
               let selectedTime = Int(timeString) {
                self.selcetedTime = selectedTime
            } else {
                self.selcetedTime = -1
            }
            let endtime = self.selcetedTime + 5
            self.displayLabel.text = "\(self.selcetedTime):00 ~ \(endtime):59"
        }
        let cancelAction = UIAlertAction(title: TextLiterals.flagCancelText, style: .cancel, handler: nil)
        alertController.addAction(confirmAction)
        alertController.addAction(cancelAction)
        self.window?.rootViewController?.present(alertController, animated: true, completion: nil)
        
    }
}
