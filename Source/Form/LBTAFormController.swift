//
//  FormViewController.swift
//  LBTATools
//
//  Created by Brian Voong on 5/16/19.
//

import UIKit

open class LBTAFormController: UIViewController {
    
    var lowestElement: UIView!
    public lazy var scrollView: UIScrollView = {
        let sv = UIScrollView()
        if #available(iOS 11.0, *) {
            sv.contentInsetAdjustmentBehavior = .never
        }
        sv.contentSize = view.frame.size
        sv.keyboardDismissMode = .interactive
        return sv
    }()
    
    public let formContainerStackView: UIStackView = {
        let sv = UIStackView()
        sv.isLayoutMarginsRelativeArrangement = true
        return sv
    }()
    
    fileprivate let alignment: FormAlignment
    
    public init(alignment: FormAlignment = .top) {
        self.alignment = alignment
        super.init(nibName: nil, bundle: nil)
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("You most likely have a Storyboard controller that uses this class, please remove any instance of LBTAFormController or sublasses of this component from your Storyboard files.")
    }
    
    override open func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(scrollView)
        scrollView.fillSuperview()
        scrollView.addSubview(formContainerStackView)
        
        if alignment == .top {
            formContainerStackView.anchor(top: scrollView.topAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor)
        } else {
            formContainerStackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
            formContainerStackView.centerInSuperview()
        }
        
        setupKeyboardNotifications()
    }
    
    override open func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if formContainerStackView.frame.height > view.frame.height {
            scrollView.contentSize.height = formContainerStackView.frame.size.height
        }
        
        _ = distanceToBottom
    }
    
    lazy fileprivate var distanceToBottom = self.distanceFromLowestElementToBottom()
    
    fileprivate func distanceFromLowestElementToBottom() -> CGFloat {
        if lowestElement != nil {
            guard let frame = lowestElement.superview?.convert(lowestElement.frame, to: view) else { return 0 }
            let distance = view.frame.height - frame.origin.y - frame.height
            return distance
        }
        
        return view.frame.height - formContainerStackView.frame.maxY
    }
    
    fileprivate func setupKeyboardNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(handleKeyboardShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(handleKeyboardHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc fileprivate func handleKeyboardShow(notification: Notification) {
        guard let value = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else { return }
        let keyboardFrame = value.cgRectValue
        
        scrollView.contentInset.bottom = keyboardFrame.height
        
        // when stackView is center aligned, we need some extra bottom padding, not sure why yet...
        if alignment == .center {
            scrollView.contentInset.bottom += UIApplication.shared.statusBarFrame.height
        }
        
        if distanceToBottom > 0 {
            scrollView.contentInset.bottom -= distanceToBottom
        }
        
        self.scrollView.scrollIndicatorInsets.bottom = keyboardFrame.height
    }
    
    @objc fileprivate func handleKeyboardHide() {
        self.scrollView.contentInset.bottom = 0
        self.scrollView.scrollIndicatorInsets.bottom = 0
    }
    
    public enum FormAlignment {
        case top, center
    }
}
