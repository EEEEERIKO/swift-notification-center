//
//  SceneDelegate.swift
//  example
//
//  Created by Erik Valencia Cardona on 7/10/26.
//
import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {
        guard let _ = scene as? UIWindowScene else {
            return
        }
    }

    func stateRestorationActivity(
        for scene: UIScene
    ) -> NSUserActivity? {
        return nil
    }

    func scene(
        _ scene: UIScene,
        restoreInteractionStateWith stateRestorationActivity: NSUserActivity
    ) {
    }
}
