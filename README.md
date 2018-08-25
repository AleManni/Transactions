# Transactions
## Features


> Network security

 - The app uses an ephemeral session to fetch transactions, so that no sensitive data is cached on disk
 - The app uses a different session in order to fetch and cache images (URLCache)
 - No endpoint is whitelisted, so ATS applies to all connections
 
 > Data persistence
 >
 - The app persists transactions using an encrypted database (Realm 64-byte key backed by AES-256+SHA2)
 - The database acts as a foldback when an error is returned by the NetworkService or when the app cannot reach the network. In both cases the user is alerted that the data presented might not be up to date.

 ## Architecture
 >
 The app implements a Viper architecture, with a "twist": the concrete Router classes are implemented as extensions of a single NavigationService, common to the whole app. The NavigationService is held by an AppCordinator, in charge of observing and delivering events common to the whole app (e.g. in this demo, change of Reachability status)

 The NavigationService uses a ModulesFactory (wireframe) in order to generate the modules. The ModulesFactory can be instantiated with different Repositories (data providers), e.g. ProductionRepositories/UITestsRepositories/... by using a simple flag.

The NavigationService is inspired by MVVM+C architecture and injected into  Viper architecture by conforming to the  Router protocols of the different modules.

SOLID principles are respected and a better control over navigation is achieved (IMO).

 

