//
//  FlagViewController.swift
//  Flag-iOS
//
//  Created by 최지우 on 2023/08/10.
//
import UIKit

import Moya
import SnapKit

protocol FixedFlagInfoDelegate: AnyObject {
    func didTappedFixedFlagInfo(fixedFlag: FixedFlagListResponse)
}

final class FlagViewController: BaseUIViewController {
    
    // MARK: - Properties
    
    weak var delegate: FixedFlagInfoDelegate?
    private let provider = MoyaProvider<FlagMainAPI>(plugins: [MoyaLoggerPlugin()])
    
    private var currentIndex: Int = 0 {
       didSet {
           changeItem(index: currentIndex)
       }
   }
    
    private var fixedFlagListData: [FixedFlagListResponse] = [] {
        didSet {
            flagView.flagCollectionView.reloadData()
        }
    }
    
    private var progressFlagListData: [ProgressFlagListResponse] = [] {
        didSet {
            flagView.flagCollectionView.reloadData()
        }
    }

    // MARK: - UI Components
    
    private let flagView = FlagView()

    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setCollectionView()
        getFixedFlag()
        getProgressFlag()
        
        let realm = RealmService()
        print("⭐️\(realm.getAccessToken())")
    }

    // MARK: - Custom Method
    
    override func setupNavigationBar() {
        super.setupNavigationBar()
        navigationItem.title = TextLiterals.flagRawValue
    }

    override func setUI() {
        view.addSubviews(flagView)
    }

    override func setLayout() {
        flagView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }

    override func setDelegate() {
        flagView.flagCollectionView.dataSource = self
        flagView.flagCollectionView.delegate = self
        flagView.menuBar.delegate = self
    }
    
    func setCollectionView() {
        flagView.flagCollectionView.register(FlagCollectionViewCell.self,
                                             forCellWithReuseIdentifier: FlagCollectionViewCell.identifier)
    }
    
    func scrollToMenuIndex(menuIndex: Int) {
        let indexPath = IndexPath(item: menuIndex, section: 0)
        flagView.flagCollectionView.scrollToItem(at: indexPath,
                                                 at: .centeredHorizontally,
                                                 animated: true)
    }
    
    func changeItem(index: Int) {
        flagView.menuBar.selectedItem = index
    }

}

// MARK: - UICollectionViewDataSource

extension FlagViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FlagCollectionViewCell.identifier,
                                                      for: indexPath) as! FlagCollectionViewCell
        cell.delegate = self
        cell.section = indexPath.item
        cell.flagTableView.reloadData()
        return cell
    }
}

// MARK: - UICollectionViewDelegate

extension FlagViewController: UICollectionViewDelegate {
    
}

// MARK: - UICollectionViewDelegateFlowLayout

extension FlagViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.safeAreaLayoutGuide.layoutFrame.height - flagView.menuBar.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        flagView.menuBar.menuHorizontalBarView.snp.updateConstraints {
            $0.leading.equalTo(scrollView.contentOffset.x / 2)
        }

        UIView.animate(withDuration: 0.3) {
            self.flagView.layoutIfNeeded()
        }
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView,
                                   withVelocity velocity: CGPoint,
                                   targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        
        let index = targetContentOffset.pointee.x / view.frame.width
        
        let indexPath = IndexPath(item: Int(index), section: 0)
        flagView.menuBar.menuCollectionView.selectItem(at: indexPath, animated: true,
                                                       scrollPosition: .centeredHorizontally)
    }
}

// MARK: - HomeMenuBarDelegate

extension FlagViewController: HomeMenuBarDelegate {
    func didSelectMenuBarItem(didSelectItemAt item: Int) {
        scrollToMenuIndex(menuIndex: item)
    }
}

// MARK: - FlagCollectionViewCellDelegate

extension FlagViewController: FlagCollectionViewCellDelegate {
    
    func numberOfSections(in tableView: UITableView, at section: Int) -> Int {
        switch section {
        case 0:
            return fixedFlagListData.count
        case 1:
            return progressFlagListData.count
        default:
            return 0
        }
        
    }
    
    func numberOfRows(in tableView: UITableView) -> Int {
        return 1
    }
    
    func cellForRow(at indexPath: IndexPath, in tableView: UITableView, at section: Int) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FlagTableViewCell.identifier,
                                                 for: indexPath) as! FlagTableViewCell
        switch section {
        case 0:
            cell.model = .fixed(fixedFlagListData[indexPath.section])
        case 1:
            cell.model = .progress(progressFlagListData[indexPath.section])
        default:
            return FlagTableViewCell()
        }
        return cell
    }
    
    func didSelectRowAt(at indexPath: IndexPath, in tableView: UITableView, at section: Int) {
        tableView.deselectRow(at: indexPath, animated: true)

        switch section {
        case 0:
            let flagInfoViewController = FlagInfoViewController()
            self.delegate = flagInfoViewController
            delegate?.didTappedFixedFlagInfo(fixedFlag: fixedFlagListData[indexPath.section])
            flagInfoViewController.hidesBottomBarWhenPushed = true
            self.navigationController?.pushViewController(flagInfoViewController, animated: true)
        case 1:
            // host인 경우
//            print("🌕\(progressFlagListData[indexPath.section].role)")
//            print("🌕\(progressFlagListData[indexPath.section].id)")
//            print("🌕\(progressFlagListData[indexPath.section].check)")
            if progressFlagListData[indexPath.section].role == "HOST" {
                let progressViewController = ProgressViewController()
                progressViewController.flagId = progressFlagListData[indexPath.section].id
                progressViewController.role = progressFlagListData[indexPath.section].role
                progressViewController.hidesBottomBarWhenPushed = true
                self.navigationController?.pushViewController(progressViewController, animated: true)
            }
            // guest인 경우
                // check 여부에 따라
                // true: progress
                // false: timeScroll
            else if progressFlagListData[indexPath.section].role == "GUEST" {
                if progressFlagListData[indexPath.section].check == true {
                    let progressViewController = ProgressViewController()
                    progressViewController.flagId = progressFlagListData[indexPath.section].id
                    progressViewController.role = progressFlagListData[indexPath.section].role
                    progressViewController.hidesBottomBarWhenPushed = true
                    self.navigationController?.pushViewController(progressViewController, animated: true)
                } else if progressFlagListData[indexPath.section].check == false {
                    let testTimeScrollViewController = TestTimeScrollViewController()
                    testTimeScrollViewController.flagId = progressFlagListData[indexPath.section].id
                    testTimeScrollViewController.hidesBottomBarWhenPushed = true
                    self.navigationController?.pushViewController(testTimeScrollViewController, animated: true)
                }
                
            }
            
        default:
            break
        }
    }
    
    func didRefreshTable() {
        getFixedFlag()
        getProgressFlag()
        print("api 재호출")
    }
}


// MARK: - Network

extension FlagViewController {
    
    private func getFixedFlag() {
        self.provider.request(.fixedFlag) { response in
            switch response {
            case .success(let moyaResponse):
                do {
                    let responseData = try moyaResponse.map([FixedFlagListResponse].self)
                    self.fixedFlagListData = responseData
                } catch (let err) {
                    print(err.localizedDescription)
                }
            case .failure(let err):
                print(err.localizedDescription)
            }
        }
    }
    
    private func getProgressFlag() {
        self.provider.request(.progressFlag) { response in
            switch response {
            case .success(let moyaResponse):
                do {
                    let responseData = try moyaResponse.map([ProgressFlagListResponse].self)
                    self.progressFlagListData = responseData
                } catch (let err) {
                    print(err.localizedDescription)
                }
            case .failure(let err):
                print(err.localizedDescription)
            }
        }
    }
}
