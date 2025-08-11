(asdf:defsystem redirect-stream
  :version "1.0.0"
  :license "zlib"
  :author "Yukari Hafner <shinmera@tymoon.eu>"
  :maintainer "Yukari Hafner <shinmera@tymoon.eu>"
  :description "Offers a stream that redirects all actions to an inner stream."
  :homepage "https://shinmera.com/docs/redirect-stream/"
  :bug-tracker "https://shinmera.com/project/redirect-stream/issues"
  :source-control (:git "https://shinmera.com/project/redirect-stream.git")
  :serial T
  :components ((:file "redirect-stream")
               (:file "documentation"))
  :depends-on (:trivial-gray-streams))
