# External Errors
> **ApodHttpException extends IApodExternalException < resource.status**

# Infra Errors
> **ApodMapperException extends IApodInfraException < IApodExternalException**

# Data Errors
> **ApodDataException extends IApodDataException < IApodInfraException**

# Domain Errors
> **ApodDomainException extends IApodDomainException < IApodDataException**
# Presentation Errors
> **String < IApodDomainException**