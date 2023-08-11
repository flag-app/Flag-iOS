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
    var menuHorizontalBarLeading: CGFloat = 26
    var delegate: HomeMenuBarDelegate?
    private let flagMenuTitle = [TextLiterals.confirmedFlag, TextLiterals.progressFlag]
    
    // MARK: - UI Component
    
    private var collectionView: UICollectionView = {
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
        addSubviews(collectionView,
                    menuHorizontalBarView)
    }
    
    override func setLayout() {
        collectionView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        menuHorizontalBarView.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(menuHorizontalBarLeading)
            $0.bottom.equalToSuperview()
            $0.width.equalTo(170)
            $0.height.equalTo(3)
        }
    }
    
    func setDelegate() {
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    func setCollectionView() {
        collectionView.register(MainMenuCollectionViewCell.self, forCellWithReuseIdentifier: cellId)
    }
    
    func setBeginningIndex() {
        let selectedIndexPath = IndexPath(item: 0, section: 0)
        collectionView.selectItem(at: selectedIndexPath,
                                  animated: false,
                                  scrollPosition: .top)
    }
    
}

// MARK: - UICollectionViewDataSource

extension MainMenuBar: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! MainMenuCollectionViewCell
        cell.titleLabel.text = flagMenuTitle[indexPath.item]
        return cell
    }
    
    
}

// MARK: - UICollectionViewDelegate

extension MainMenuBar: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.item)
        
        let x = CGFloat(indexPath.item) * frame.width / 2
        menuHorizontalBarLeading = x
        
        UIView.animate(withDuration: 0.75, delay: 0, usingSpringWithDamping: 2, initialSpringVelocity: 2, animations: { self.layoutIfNeeded() })
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
