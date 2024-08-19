//

public enum UserAuth: Codable, Sendable {
  case password(hash: String)
  case google(id: String)
}
