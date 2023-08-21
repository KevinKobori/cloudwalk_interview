## External Objects Treatment
> **From JSON Encoded to Map(JSON Decoded)**
- From:
    - "[{},...]" (json.encoded)
    - "{...}" (json.encoded)
- To:
    - List<Map<String, String>> = json.decode([{},...])
    - Map<String, String> = json.decode({...})
- Mappers:
    - PictureMapper {
        PictureModel fromMapToModel(); external > infra
        <!-- Map<String, String> fromModelToMap(); infra > external -->

        PictureEntity fromModelToEntity(); Data > Domain
        <!-- PictureModel fromEntityToModel(); Domain > Data -->

        PictureEntity fromEntityToViewModel(); Domain > Presenter
        <!-- PictureModel fromViewModelToEntity(); Presenter > Domain -->
    }

## Infra Objects Treatment
> **From Map To Model**
- From: {...}
- Mapper: PictureMapper.fromMapToModel()
- To: PictureModel

## Data Objects Treatment
> **From To Models**
- From: PictureModel
- Mapper: PictureMapper.fromModelToEntity()
- To: PictureEntity

## Domain Objects Treatment
> **From To Entities**

## Presentation Objects Treatment
> **From Entities To ViewModels**
- From: PictureEntity
- Mapper: PictureMapper.fromEntityToViewModel()
- To: PictureViewModel