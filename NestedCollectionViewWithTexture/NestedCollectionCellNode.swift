//
//  NestedCollectionCellNode.swift
//  NestedCollectionViewWithTexture
//
//  Created by seongjong_kim on 04/07/2019.
//  Copyright © 2019 seongjong_kim. All rights reserved.
//

import AsyncDisplayKit

final class NestedCollectionCellNode: ASCellNode {
    let nestedSampleData: [String]

    let collectionNode = ASCollectionNode(collectionViewLayout: LeftAlignedCollectionViewFlowLayout())

    init(data: [String]) {
        nestedSampleData = data
        super.init()
        automaticallyManagesSubnodes = true
        backgroundColor = .gray
        
        collectionNode.cellLayoutMode = .alwaysReloadData
        collectionNode.alwaysBounceVertical = false
        collectionNode.alwaysBounceHorizontal = false
        collectionNode.backgroundColor = .green
        collectionNode.dataSource = self
    }

    override func didLoad() {
        super.didLoad()
    }

    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        collectionNode.style.preferredSize = CGSize(width: constrainedSize.max.width - 40, height: 320)
        let collectionInsetLayoutSpec = ASInsetLayoutSpec(insets: UIEdgeInsets(top: 8, left: 20, bottom: 8, right: 20),
                                                          child: collectionNode)
        let stackLayoutSpec = ASStackLayoutSpec(direction: .horizontal,
                                                spacing: 0,
                                                justifyContent: .center,
                                                alignItems: .center,
                                                children: [collectionInsetLayoutSpec])
        return stackLayoutSpec
    }

    override func layout() {
        super.layout()
    }
}

extension NestedCollectionCellNode: ASCollectionDataSource {
    func numberOfSections(in collectionNode: ASCollectionNode) -> Int {
        return 1
    }

    func collectionNode(_ collectionNode: ASCollectionNode, numberOfItemsInSection section: Int) -> Int {
        return nestedSampleData.count
    }

    func collectionNode(_ collectionNode: ASCollectionNode, nodeBlockForItemAt indexPath: IndexPath) -> ASCellNodeBlock {
        return {
            let cellData = self.nestedSampleData[indexPath.item]
            let nestedCellNode = NestedItemCellNode()

            let centerAlignment = NSMutableParagraphStyle()
            centerAlignment.alignment = .center

            let targetText = NSMutableAttributedString(string: String(cellData))
            targetText.addAttributes([.font: UIFont.systemFont(ofSize: 32, weight: .regular),
                                      .foregroundColor: UIColor.white,
                                      .paragraphStyle: centerAlignment],
                                     range: NSRange(location: 0, length: targetText.length))
            nestedCellNode.textNode.attributedText = targetText
            return nestedCellNode
        }
    }
}

