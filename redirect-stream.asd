#|
 This file is a part of redirect-stream
 (c) 2015 Shirakumo http://tymoon.eu (shinmera@tymoon.eu)
 Author: Nicolas Hafner <shinmera@tymoon.eu>
|#

(in-package #:cl-user)
(asdf:defsystem redirect-stream
  :version "1.0.0"
  :license "Artistic"
  :author "Nicolas Hafner <shinmera@tymoon.eu>"
  :maintainer "Nicolas Hafner <shinmera@tymoon.eu>"
  :description "Offers a stream that redirects all actions to an inner stream."
  :homepage "https://github.com/Shinmera/redirect-stream"
  :serial T
  :components ((:file "redirect-stream")
               (:file "documentation"))
  :depends-on (:trivial-gray-streams))
