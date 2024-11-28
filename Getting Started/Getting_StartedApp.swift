//
//  Getting_StartedApp.swift
//  Getting Started
//
//  Created by Gagana Ananda on 11/27/24.
//

import Amplify
import AWSCognitoAuthPlugin
import AWSS3StoragePlugin
import AWSAPIPlugin
import SwiftUI

@main
struct Getting_StartedApp: App {
    init() {
            do {
                try Amplify.add(plugin: AWSCognitoAuthPlugin())
                try Amplify.add(plugin: AWSAPIPlugin(modelRegistration: AmplifyModels()))
                try Amplify.add(plugin: AWSS3StoragePlugin())
                try Amplify.configure()
                print("Initialized Amplify");
            } catch {
                print("Could not initialize Amplify: \(error)")
            }
        }

        var body: some Scene {
            WindowGroup {
                LandingView()
                    .environmentObject(NotesService())
                    .environmentObject(AuthenticationService())
                    .environmentObject(StorageService())
            }
        }
    }
