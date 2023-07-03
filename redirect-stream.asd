(asdf:defsystem redirect-stream
  :version "1.0.0"
  :license "zlib"
  :author "Yukari Hafner <shinmera@tymoon.eu>"
  :maintainer "Yukari Hafner <shinmera@tymoon.eu>"
  :description "Offers a stream that redirects all actions to an inner stream."
  :homepage "https://Shinmera.github.io/redirect-stream/"
  :bug-tracker "https://github.com/Shinmera/redirect-stream/issues"
  :source-control (:git "https://github.com/Shinmera/redirect-stream.git")
  :serial T
  :components ((:file "redirect-stream")
               (:file "documentation"))
  :depends-on (:trivial-gray-streams))
