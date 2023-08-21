# External Exception
**ApodExternalException < response.status**

# Infra Exception
**ApodInfraException < IApodExternalException**

# Data Exception
**ApodDataException < IApodInfraException**

# Domain Exception
**ApodDomainException < IApodDataException**

# Presenter Exception
**PresenterException < IApodDomainException**
**UI < IPresenterException**