//

import struct Foundation.UUID
import struct Foundation.Date

extension OrderDTO: ServerRequest {}
extension OrderDTO: ServerResponse {}

public struct OrderDTO: Codable {
  public typealias Response = CreateOrderResponse
  public static let url = "create_order"

  public let id: UUID?

  public let customer: UserDTO?
  public let estimator: UserDTO?
  public let driver: UserDTO?

  public let arrivedAtDeparturePlannedDate: Date
  public let createdDate: Date?
  public let estimatedDate: Date?
  public var approvedDate: Date?
  public let driverTakenDate: Date?
  public let arrivedAtDepartureDate: Date?
  public let loadedDate: Date?
  public let arrivedAtDestinationDate: Date?
  public let closedDate: Date?

  public let state: OrderState?

  public let route: OrderRouteDTO
  //  @Published var cargo: Cargo

  public init(id: UUID?,

              route: OrderRouteDTO,
              arrivedAtDeparturePlannedDate: Date,

              createdDate: Date?,
              estimatedDate: Date?,
              approvedDate: Date?,
              driverTakenDate: Date?,
              arrivedAtDepartureDate: Date?,
              loadedDate: Date?,
              arrivedAtDestinationDate: Date?,
              closedDate: Date?,

              customer: UserDTO?,
              estimator: UserDTO?,
              driver: UserDTO?,

              state: OrderState?) {
    self.id = id

    self.route = route
    self.arrivedAtDeparturePlannedDate = arrivedAtDeparturePlannedDate
    
    self.createdDate = createdDate
    self.estimatedDate = estimatedDate
    self.approvedDate = approvedDate
    self.driverTakenDate = driverTakenDate
    self.arrivedAtDepartureDate = arrivedAtDepartureDate
    self.loadedDate = loadedDate
    self.arrivedAtDestinationDate = arrivedAtDestinationDate
    self.closedDate = closedDate

    self.customer = customer
    self.estimator = estimator
    self.driver = driver

    self.state = state
  }
}
