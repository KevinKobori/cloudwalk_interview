core
- configuration
    - factories
        - adapters
            - clients(need something like "remote")
                - http_client_factory.dart
            - device(need something like "local" because i have external bluetooth devices what i need to use this nomenclature to manipulate them)
                - local_storage_adapter_factory.dart
- data
    - datasources
    - failures
    - mappers
    - models
    - repositories
    - adapters
- domain
    - entities
    - failures
    - repositories
    - usecases
- external
    - failures
    - network
    - adapters
- presentation
    - design_system
    - failures
    - i18n
    - presenters
        - managers
    - ui
        - gestures
        - managers
    - viewmodels
        - picture_viewmodel.dart(its a viewmodel like a class model that transforms from PicturesModel to PictureViewModel and not from mvvm)
Features
- pictures
    - configuration
    - data
    - domain
    - external
    - presentation
        - 
- ...