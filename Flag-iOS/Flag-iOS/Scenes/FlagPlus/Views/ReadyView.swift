//
//  ReadyView.swift
//  Flag-iOS
//
//  Created by 성현주 on 2023/08/15.
//

import UIKit

final class ReadyView: BaseUIView {
    
    // MARK: - Properties
    
    var time: Float = 0.0
    var timer: Timer?
    
    // MARK: - UI Components
    
    let sectionCount = 14
    
    lazy var nextButton: BaseFillButton = {
        let button = BaseFillButton()
        button.setTitle(TextLiterals.flagAlarmText, for: .normal)
        button.isEnabled = true
        return button
    }()
    
    private let ReadyLabel: UILabel = {
        let label = UILabel()
        label.text = TextLiterals.flagReadyText
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = .head1
        label.alpha = 0.0
        return label
    }()
    
    lazy var progressView: UIProgressView = {
        let view = UIProgressView()
        view.trackTintColor = .gray200
        view.progressTintColor = .purple300
        view.progress = 0.0
        return view
    }()
    
    // MARK: - Custom Method
    
    override func setUI() {
        self.addSubviews(ReadyLabel,
                         nextButton,
                         progressView)
        progressAnimation()
    }
    
    override func setLayout() {
        ReadyLabel.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
        nextButton.snp.makeConstraints {
            $0.bottom.equalTo(safeAreaLayoutGuide).inset(21)
            $0.horizontalEdges.equalToSuperview().inset(25)
            $0.height.equalTo(49)
        }
        progressView.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide).offset(10)
            make.horizontalEdges.equalToSuperview().inset(25)
        }
    }
    
    func progressAnimation() {
        timer?.invalidate()
        timer = Timer.scheduledTimer(timeInterval: 0.002, target: self, selector: #selector(setProgress), userInfo: nil, repeats: true)
    }
    
    @objc
    func setProgress() {
        time += 0.002
        progressView.setProgress(time, animated: true)
        if time >= 1.0 {
            timer?.invalidate()
            animationDidFinish()
        }
    }
    
    func animationDidFinish() {
        UIView.animate(withDuration: 1.0) {
            self.ReadyLabel.alpha = 1.0
                }
        }
}
