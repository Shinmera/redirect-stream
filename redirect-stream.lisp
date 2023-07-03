(in-package #:cl-user)
(defpackage #:redirect-stream
  (:nicknames #:org.shirakumo.redirect-stream)
  (:use #:cl #:trivial-gray-streams)
  (:shadow #:stream)
  (:export
   #:redirect-stream
   #:stream
   #:make-redirect-stream))
(in-package #:org.shirakumo.redirect-stream)

(defclass redirect-stream (fundamental-character-output-stream
                           fundamental-character-input-stream
                           fundamental-binary-output-stream
                           fundamental-binary-input-stream)
  ((stream :initarg :stream :accessor stream))
  (:default-initargs
   :stream NIL))

(defmacro define-redirect-method (name args)
  (let ((redirect (first args))
        (clean-args (loop for arg in (rest args)
                          unless (find arg LAMBDA-LIST-KEYWORDS)
                          collect arg)))
    `(defmethod ,name ((,redirect redirect-stream) ,@(rest args))
       (when (stream ,redirect)
         (,name (stream ,redirect) ,@clean-args)))))

#+()
(defun generate-wrappers ()
  (mapcar (lambda (s) `(define-redirect-method ,s ,(arg:arglist s)))
          '(stream-read-char stream-unread-char stream-read-char-no-hang
            stream-peek-char stream-listen stream-read-line
            stream-clear-input stream-write-char stream-line-column
            stream-start-line-p stream-write-string stream-terpri
            stream-fresh-line stream-finish-output stream-force-output
            stream-clear-output stream-advance-to-column
            stream-read-byte stream-write-byte stream-read-sequence
            stream-write-sequence stream-file-position)))

(define-redirect-method stream-read-char (stream))
(define-redirect-method stream-unread-char (stream character))
(define-redirect-method stream-read-char-no-hang (stream))
(define-redirect-method stream-peek-char (stream))
(define-redirect-method stream-listen (stream))
(define-redirect-method stream-read-line (stream))
(define-redirect-method stream-clear-input (stream))
(define-redirect-method stream-write-char (stream character))
(define-redirect-method stream-line-column (stream))
(define-redirect-method stream-start-line-p (stream))
(define-redirect-method stream-write-string (stream string &optional start end))
(define-redirect-method stream-terpri (stream))
(define-redirect-method stream-fresh-line (stream))
(define-redirect-method stream-finish-output (stream))
(define-redirect-method stream-force-output (stream))
(define-redirect-method stream-clear-output (stream))
(define-redirect-method stream-advance-to-column (stream column))
(define-redirect-method stream-read-byte (stream))
(define-redirect-method stream-write-byte (stream integer))
(define-redirect-method stream-read-sequence (stream sequence start end &key &allow-other-keys))
(define-redirect-method stream-write-sequence (stream sequence start end &key &allow-other-keys))
(define-redirect-method stream-file-position (stream))

(defun make-redirect-stream (&optional stream)
  (make-instance 'redirect-stream :stream stream))

