//

public typealias CreateOrderRequest = OrderDTO
public typealias CreateOrderResponse = OrderDTO

public struct ApproveOrderRequest: ServerRequest {
  public typealias Response = ApproveOrderResponse
  public static let url = "approve_order"

  public init() {}
}

public typealias ApproveOrderResponse = OrderDTO
