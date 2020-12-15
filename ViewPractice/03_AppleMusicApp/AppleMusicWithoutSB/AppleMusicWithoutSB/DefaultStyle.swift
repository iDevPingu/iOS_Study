//
//  DefaultStyle.swift
//  AppleMusicWithoutSB
//
//  Created by Ick on 2020/09/21.
//  Copyright © 2020 ick. All rights reserved.
//

import UIKit

public enum DefaultStyle{
    public enum Colors{
        public static let tint: UIColor = {
            if #available(iOS 13.0, *) {
                return UIColor { traitCollection in
                    if traitCollection.userInterfaceStyle == .dark{
                        return .white
                    } else{
                        return .black
                    }
                }
            } else {
                return .black
            }
        }()
    }
}
