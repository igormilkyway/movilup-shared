//

public struct CargoDTO: Codable {
  public var photos: [CargoPhotoDTO]
  public var list: CargoListDTO

  public init(photos: [CargoPhotoDTO], list: CargoListDTO) {
    self.photos = photos
    self.list = list
  }
}
