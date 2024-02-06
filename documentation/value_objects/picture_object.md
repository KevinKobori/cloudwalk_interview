# Picture Object:
    - ApodDate date;
    - String explanation;
    - String hdurl;
    - String mediaType;
    - String serviceVersion;
    - String title;
    - String url;

## Domain Layer:
> **PictureEntity**
    - ApodDate date;

## Data Layer:
> **PictureModel**
    - DateTime date;

## Presentation Layer:
> **PictureViewModel**
    - String date;

## Infra Layer:
> **PictureDTO**
    - ApodDate date;

> **PictureMapper:**
    - Data <<< FROM <<< Domain:
        - fromEntityToModel()
        - fromEntityListToModelList()
    - Data >>> TO >>> Domain:
        - fromModelToEntity()
        - fromModelListToEntityList()

    - Presentation <<< FROM <<< Domain:
        - fromEntityToViewModel()
        - fromEntityListToViewModelList()
    - Presentation >>> TO >>> Domain:
        - fromViewModelToEntity()
        - fromViewModelListToEntityList()

    - Infra <<< FROM <<< Data:
        - fromModelToJson()
        - fromModelListToJsonList()
    - Infra >>> TO >>> Data:
        - fromJsonToModel()
        - fromJsonListToModelList()