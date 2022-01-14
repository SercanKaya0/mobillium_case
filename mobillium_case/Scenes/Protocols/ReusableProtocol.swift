//
//  ReusableProtocol.swift
//  mobillium_case
//
//  Created by Sercan KAYA on 12.01.2022.
//

import Foundation
import UIKit
public protocol ReusableView: AnyObject {
    static var defaultReuseIdentifier: String { get }
}


public extension ReusableView where Self : UIView {
    static var defaultReuseIdentifier : String {
        return String(describing: self)
    }
}
