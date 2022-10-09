//
//  UIViewController+Ext.swift
//  CustomButton
//
//  Created by Hertz on 10/6/22.
//

import Foundation
import UIKit

#if DEBUG
import SwiftUI

extension UIViewController {
    
    private struct VCRepresentable : UIViewControllerRepresentable {
        
        let viewController : UIViewController
        
        func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        }
        
        func makeUIViewController(context: Context) -> some UIViewController {
            return viewController
        }
        
    }
    func getPreview() -> some View {
        VCRepresentable(viewController: self)
    }
}


#endif
