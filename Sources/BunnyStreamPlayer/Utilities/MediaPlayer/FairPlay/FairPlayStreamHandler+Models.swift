import Foundation

extension FairPlayStreamHandler {
  struct CertificateResponse: Decodable {
    let certificate: String
  }

  struct CKCResponse: Decodable {
    let ckc: String
  }

  struct SPCRequest: Encodable {
    let spc: String
  }
  
  enum FairPlayHandlerError: Error {
    case invalidCertificateData
    case invalidCKCData
    case unexpectedResponse
  }
}
