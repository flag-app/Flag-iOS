//
//  MainMenuBar.swift
//  Flag-iOS
//
//  Created by 최지우 on 2023/08/10.
//

import UIKit

protocol HomeMenuBarDelegate: AnyObject {
    func didSelectMenuBarItem(didSelectItemAt item: Int)
}

class MainMenuBar: BaseUIView {
    
    // MARK: - Properties
    
    let cellId = "cellId"
    private let flagMenuTitle = [TextLiterals.confirmedFlag, TextLiterals.progressFlag]
    
    var delegate: HomeMenuBarDelegate?
    
    var selectedItem: Int? {
        didSet {
            updateBar(from: selectedItem)
        }
    }
    
    // MARK: - UI Component
    
    var menuCollectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        let view = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        view.showsHorizontalScrollIndicator = false
        return view
    }()
    
    let menuHorizontalBarView: UIView = {
        let view = UIView()
        view.backgroundColor = .purple300
        return view
    }()
    
    // MARK: - Life Cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setDelegate()
        setCollectionView()
        setBeginningIndex()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setUI() {
        addSubviews(menuCollectionView,
                    menuHorizontalBarView)
    }
    
    override func setLayout() {
        menuCollectionView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        menuHorizontalBarView.snp.makeConstraints {
            $0.leading.bottom.equalToSuperview()
            $0.height.equalTo(3)
        }
    }
    
    func setDelegate() {
        menuCollectionView.dataSource = self
        menuCollectionView.delegate = self
    }
    
    func setCollectionView() {
        menuCollectionView.register(MainMenuCollectionViewCell.self, forCellWithReuseIdentifier: cellId)
    }
    
    func setBeginningIndex() {
        let selectedIndexPath = IndexPath(item: 0, section: 0)
        menuCollectionView.selectItem(at: selectedIndexPath,
                                  animated: false,
                                  scrollPosition: .top)
    }
    
    
    func updateBar(from index: Int?) {
        guard let index else { return }
        let indexPath = IndexPath(item: index, section: 0)

        menuCollectionView.selectItem(at: indexPath,
                                  animated: true,
                                  scrollPosition: .centeredHorizontally)

        updateMenuHorizontalBar(index: index)
    }

    func updateMenuHorizontalBar(index: Int) {
        let x = CGFloat(index) * frame.width / 2
        
        menuHorizontalBarView.snp.updateConstraints {
            $0.leading.equalToSuperview().offset(x)
        }

        UIView.animate(withDuration: 0.3) {
            self.layoutIfNeeded()
        }
        
    }
    
}

// MARK: - UICollectionViewDataSource

extension MainMenuBar: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! MainMenuCollectionViewCell
        cell.titleLabel.text = flagMenuTitle[indexPath.item]
        return cell
    }
    
}

// MARK: - UICollectionViewDelegate

extension MainMenuBar: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedItem = indexPath.item
        delegate?.didSelectMenuBarItem(didSelectItemAt: indexPath.item)
    }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension MainMenuBar: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSizeMake(frame.width / 2, frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0 
    }
}
