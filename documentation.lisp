#|
 This file is a part of redirect-stream
 (c) 2015 Shirakumo http://tymoon.eu (shinmera@tymoon.eu)
 Author: Nicolas Hafner <shinmera@tymoon.eu>
|#

(in-package #:org.shirakumo.redirect-stream)

(defmacro setdocs (&body pairs)
  `(progn
     ,@(loop for (var doc) in pairs
             collect (destructuring-bind (var &optional (type 'function))
                         (if (listp var) var (list var))
                       `(setf (documentation ',var ',type) ,doc)))))

(setdocs
  ((redirect-stream type)
   "A gray-stream class that redirects all stream operations to its STREAM object.

If STREAM is NIL, a stream operation will do nothing and return NIL. Otherwise
the exact same operation with the exact same parameters is performed on STREAM.

See STREAM")

  (stream
   "Returns the stream the REDIRECT-STREAM redirects to.

SETF-able.

See REDIRECT-STREAM")

  (make-redirect-stream
   "Creates a new REDIRECT-STREAM that directs all operations to STREAM.

See STREAM
See REDIRECT-STREAM"))
