class BowOpenapi < Formula
  desc "Functional HTTP client generate from an OpenAPI/Swagger specification"
  homepage "https://github.com/bow-swift/bow-openapi"
  url "https://github.com/bow-swift/bow-openapi/archive/0.1.0.tar.gz"
  sha256 "723ee0272ae606f537215f3071508bd1b1d9a4dd70e637b7feb5315f324e72eb"

  depends_on macos: :mojave
  depends_on :xcode => "11.0"
  depends_on 'swagger-codegen'

  def install
    build_project_structure
    build_project

    bin.install "./bin/bow-openapi"
    lib.install "./lib/bow"
  end

  test do
    print ""
  end

  def build_project_structure
      FileUtils.mkdir_p("./bin")
      FileUtils.mkdir_p("./lib/bow/openapi/templates")
  end

  def build_project
    system "swift", "build", "--disable-sandbox", "--build-path", "release"
    FileUtils.cp "./release/x86_64-apple-macosx/debug/bow-openapi", "./bin"
    FileUtils.cp_r './Templates/.', "./lib/bow/openapi/templates"
  end

end
