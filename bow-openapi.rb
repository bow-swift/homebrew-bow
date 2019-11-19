class BowOpenapi < Formula
  desc "Functional HTTP client generate from an OpenAPI/Swagger specification"
  homepage "https://github.com/bow-swift/bow-openapi"
  url "https://github.com/bow-swift/bow-openapi/archive/0.2.0.tar.gz"
  sha256 "289e6a3b5755edb370c6db318c74dba0b0128ec7ebf5ce52151f0abd6bd9ca7c"

  depends_on :xcode => "11.4"
  depends_on 'swagger-codegen'

  def install
    system "make", "macos", "prefix=#{prefix}"
  end
end
