//

import struct Foundation.UUID
import struct Foundation.Date

public struct OrderDTO: Codable {
  public let id: UUID

  public let arrivedAtDeparturePlannedDate: Date
  public let createdDate: Date
  public let estimatedDate: Date?
  public let approvedDate: Date?
  public let driverTakenDate: Date?
  public let arrivedAtDepartureDate: Date?
  public let loadedDate: Date?
  public let arrivedAtDestinationDate: Date?
  public let closedDate: Date?

  public let customer: UserDTO
  public let estimator: UserDTO?
  public let driver: UserDTO?

  public init(id: UUID,

              arrivedAtDeparturePlannedDate: Date,
              createdDate: Date, 
              estimatedDate: Date?,
              approvedDate: Date?,
              driverTakenDate: Date?,
              arrivedAtDepartureDate: Date?,
              loadedDate: Date?,
              arrivedAtDestinationDate: Date?,
              closedDate: Date?,

              customer: UserDTO,
              estimator: UserDTO?,
              driver: UserDTO?) {
    self.id = id
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
  }
}
