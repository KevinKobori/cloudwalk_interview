# External Objects Treatment
> **From JSON Encoded to Map(JSON Decoded)**
- From:
    - "[{},...]" (json.encoded)
    - "{...}" (json.encoded)
- To:
    - List<Map<String, String>> = json.decode([{},...])
    - Map<String, String> = json.decode({...})
- Mappers:
    - PictureMapper {
        PictureModel fromMapToModel(); External/Cache > Infra
        Map<String, String> fromModelToMap(); Infra > External/Cache

        PictureEntity fromModelToEntity(); Data > Domain
        <!-- PictureModel fromEntityToModel(); Domain > Data -->

        PictureViewModel fromEntityToViewModel(); Domain > Presenter
        <!-- PictureEntity fromViewModelToEntity(); Presenter > Domain -->
    }

# Infra Objects Treatment
> **Maps/Models**
### Map to Model
- From: {...}
- Mapper: PictureMapper.fromMapToModel()
- To: PictureModel

### Model To Map
- From: {...}
- Mapper: PictureMapper.fromModelToMap()
- To: PictureModel

# Data Objects Treatment
> **Models/Entities**
### Model to Entity
- From: PictureModel
- Mapper: PictureMapper.fromModelToEntity()
- To: PictureEntity

# Domain Objects Treatment
- None

# Presentation Objects Treatment
> **Entities/ViewModels**
### Entity to ViewModel
- From: PictureEntity
- Mapper: PictureMapper.fromEntityToViewModel()
- To: PictureViewModel