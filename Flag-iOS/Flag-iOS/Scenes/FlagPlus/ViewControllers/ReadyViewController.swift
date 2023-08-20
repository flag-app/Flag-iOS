//
//  ReadyViewController.swift
//  Flag-iOS
//
//  Created by 성현주 on 2023/08/15.
//
import Foundation

final class ReadyViewController: BaseUIViewController {
    
    // MARK: - Properties
    
    // MARK: - UI Components
   
    private let readyView = ReadyView()
    
    // MARK: - Life Cycle
    
    // MARK: - Custom Method
    
    override func setUI() {
        view.addSubviews(readyView)
        print(FlagPlusInfo.shared.name)
        print(FlagPlusInfo.shared.guestId)
        print(FlagPlusInfo.shared.dates)
        print(FlagPlusInfo.shared.minTime)
        print(FlagPlusInfo.shared.timeSlot)
        print(FlagPlusInfo.shared.possibleDates)
        print(FlagPlusInfo.shared.memo)
        print(FlagPlusInfo.shared.place)
    }
    
    override func setLayout() {
        readyView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    override func addTarget() {
        readyView.nextButton.addTarget(self, action: #selector(didTappedNextButton), for: .touchUpInside)
    }
    
    @objc
    func didTappedNextButton() {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
}


