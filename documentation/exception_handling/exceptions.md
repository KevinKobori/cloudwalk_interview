# External Errors
**ApodExternalException < resource.status**

# Infra Errors
**ApodInfraException < IApodExternalException**

# Data Errors
**ApodDataException < IApodInfraException**

# Domain Errors
**ApodDomainException < IApodDataException**

# Presentation Errors
**String < IApodDomainException**