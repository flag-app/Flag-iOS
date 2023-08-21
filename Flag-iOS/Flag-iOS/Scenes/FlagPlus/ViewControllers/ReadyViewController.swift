//
//  ReadyViewController.swift
//  Flag-iOS
//
//  Created by 성현주 on 2023/08/15.
//
import Foundation
import Moya

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
        sendFlagToServer()
    }
   
    func sendFlagToServer() {
            let provider = MoyaProvider<FlagPlusAPI>()

            // Create a FlagPlus object with appropriate data
            let flagData = FlagPlus(
                name: FlagPlusInfo.shared.name,
                dates: FlagPlusInfo.shared.dates,
                guestNames: ["val", "izone"],
                memo: FlagPlusInfo.shared.memo,
                minTime: FlagPlusInfo.shared.minTime,
                place: FlagPlusInfo.shared.place,
                possibleDates: FlagPlusInfo.shared.possibleDates, // UNIX timestamps
                timeSlot: FlagPlusInfo.shared.timeSlot
            )

            // Make the API request
        provider.request(.setFlag(body: flagData)) { result in
            switch result {
            case .success(let response):
                // Handle successful response
                let statusCode = response.statusCode
                print("Status Code: \(statusCode)")
                // Process the response data as needed

            case .failure(let error):
                // Handle network error
                print("Network Error: \(error)")
            }
        }

        }
    }
