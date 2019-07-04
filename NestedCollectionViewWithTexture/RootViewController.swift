//
//  RootViewController.swift
//  NestedCollectionViewWithTexture
//
//  Created by seongjong_kim on 04/07/2019.
//  Copyright © 2019 seongjong_kim. All rights reserved.
//

import UIKit
import AsyncDisplayKit

class RootViewController: ASViewController<ASCollectionNode> {

/// RxASDataSources 0.4 is currently unavailable.
///   let dataSource = RxASCollectionReloadDataSource<Int>

    let sampleData: [Any] = [1, 2, 3, 4, 5, 6, 7,
                                ["andante","below","coffee","dead","energy","frost","games"],
                            9, 10]

    init() {
        let collectionLayout = UICollectionViewFlowLayout()
        collectionLayout.minimumLineSpacing = 8.0
        collectionLayout.minimumInteritemSpacing = 8.0
        collectionLayout.sectionInset = UIEdgeInsets(top: 32, left: 0, bottom: 32, right: 0)

        let node = ASCollectionNode(collectionViewLayout: collectionLayout)
        node.backgroundColor = UIColor.white
        super.init(node: node)
        node.automaticallyRelayoutOnSafeAreaChanges = true
        node.automaticallyManagesSubnodes = true
        node.cellLayoutMode = .alwaysReloadData

        node.dataSource = self
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension RootViewController: ASCollectionDataSource {
    func numberOfSections(in collectionNode: ASCollectionNode) -> Int {
        return 1
    }

    func collectionNode(_ collectionNode: ASCollectionNode, numberOfItemsInSection section: Int) -> Int {
        return sampleData.count
    }

    func collectionNode(_ collectionNode: ASCollectionNode, nodeBlockForItemAt indexPath: IndexPath) -> ASCellNodeBlock {
        return {
            let item = self.sampleData[indexPath.item]
            if item is Int {
                guard let cellData = item as? Int else { return ASCellNode() }

                let rootCellNode = RootCellNode()
                let targetText = NSMutableAttributedString(string: String(cellData))
                targetText.addAttributes([.font: UIFont.systemFont(ofSize: 32, weight: .bold),
                                          .foregroundColor: UIColor.white],
                                         range: NSRange(location: 0, length: targetText.length))
                rootCellNode.textNode.attributedText = targetText
                return rootCellNode

            } else {
                guard let cellData = item as? [String] else { return ASCellNode() }

                let nestedCollectionCellNode = NestedCollectionCellNode(data: cellData)
                return nestedCollectionCellNode
            }
        }
    }
}
