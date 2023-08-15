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
    var selcetedTime: Int = 0
    var minTime: Int = 0
    var timeText: String = ""
    var minTimeText: String = ""
    var time: Float = 0.0
    var timer: Timer?
    
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
    
    private let minTimeLabel: UILabel = {
        let label = UILabel()
        label.text = TextLiterals.flagMinimumTimeText
        label.font = .title1
        return label
    }()
    
    lazy var minTimePopButton: UIButton = {
        let button = UIButton(type: .system)
        button.layer.cornerRadius = 16
        button.showsMenuAsPrimaryAction = true
        button.isEnabled = false
        
        let times: [UIAction] = [
            UIAction(title: TextLiterals.flagMinTimeTextOne, handler: selectMinTimeAction(1, TextLiterals.flagMinTimeOne)),
            UIAction(title: TextLiterals.flagMinTimeTextTwo, handler: selectMinTimeAction(2, TextLiterals.flagMinTimeTwo)),
            UIAction(title: TextLiterals.flagMinTimeTextThree, handler: selectMinTimeAction(3, TextLiterals.flagMinTimeThree)),
            UIAction(title: TextLiterals.flagMinTimeTextFour, handler: selectMinTimeAction(4, TextLiterals.flagMinTimeFour)),
            UIAction(title: TextLiterals.flagMinTimeTextFive, handler: selectMinTimeAction(5, TextLiterals.flagMinTimeFive)),
            UIAction(title: TextLiterals.flagMinTimeTextSix, handler: selectMinTimeAction(6, TextLiterals.flagMinTimeSix))
        ]
        
        button.menu = UIMenu(title: TextLiterals.flagTimePickText,
                             identifier: nil,
                             options: .displayInline,
                             children: times)
        button.showsMenuAsPrimaryAction = true
        button.changesSelectionAsPrimaryAction = true

        return button
    }()
    
    lazy var timePopButton: UIButton = {
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
    
    lazy var progressView: UIProgressView = {
        let view = UIProgressView()
        view.trackTintColor = .gray200
        view.progressTintColor = .purple300
        view.progress = 0.30
        return view
    }()
    
    // MARK: - Custom Method
    override func setUI() {
        self.addSubviews(nextButton,
                         dateLabel,
                         timePopButton,
                         minTimePopButton,
                         displayLabel,
                         dateView,
                         timeLabel,
                         minTimeLabel,
                         progressView)
        progressAnimation()
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
            make.top.equalTo(safeAreaLayoutGuide).offset(70)
            make.bottom.equalToSuperview().inset(350)
            make.leading.trailing.equalToSuperview().inset(20)
        }
        timeLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(31)
            make.top.equalTo(dateView.snp.bottom).offset(10)
        }
        timePopButton.snp.makeConstraints { make in
            make.top.equalTo(timeLabel.snp.bottom).offset(10)
            make.leading.equalToSuperview().inset(31)
        }
        minTimeLabel.snp.makeConstraints { make in
            make.top.equalTo(timePopButton.snp.bottom).offset(30)
            make.leading.equalToSuperview().inset(31)
        }
        minTimePopButton.snp.makeConstraints { make in
            make.top.equalTo(minTimeLabel.snp.bottom).offset(10)
            make.leading.equalToSuperview().inset(31)
        }
        displayLabel.snp.makeConstraints { make in
            make.top.equalTo(minTimePopButton.snp.bottom).offset(20)
            make.leading.equalToSuperview().inset(31)
        }
        progressView.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide).offset(10)
            make.leading.trailing.equalToSuperview().inset(25)
        }
    }
    
    func selectTimeAction(_ time: Int, _ label: String) -> UIActionHandler {
        return { [weak self] _ in
            self?.selcetedTime = time
            self?.displayLabel.text = label
            self?.displayLabel.font = .head1
            self?.timeText = label
            self?.minTimePopButton.isEnabled = true
        }
    }
    
    func selectMinTimeAction(_ time: Int, _ label: String) -> UIActionHandler {
        return { [weak self] _ in
            self?.minTime = time
            self?.minTimeText = label
            self?.displayLabel.text = "\(self!.timeText)에 \(self!.minTimeText) 만나야 해요"
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
    
    func progressAnimation() {
        timer?.invalidate()
        timer = Timer.scheduledTimer(timeInterval: 0.05, target: self, selector: #selector(setProgress), userInfo: nil, repeats: true)
    }
    
    @objc
    func setProgress() {
        time += 0.05
        progressView.setProgress(time, animated: true)
        if time >= 0.60 { timer?.invalidate() }
    }
}
