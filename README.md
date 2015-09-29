## About Redirect-Stream
This is a very simple implementation of a gray stream that redirects all stream operations it receives to another stream. This is useful in situations where you would like to change the target of operations at any point in time without being able to change the actual binding of the stream that is being operated on.

## How To
Load it with Quicklisp or ASDF

    (ql:quickload :redirect-stream)

Let's create a redirect stream.

    (defvar *stream* (redirect-stream:make-redirect-stream))

At this point there's no stream inside the redirect-stream, so doing anything won't result in anything useful.

    (print 0 *stream*)

So let's change that.

    (setf (redirect-stream:stream *stream*) *standard-output*)
    (print 0 *stream*)

We can also use it for input.

    (setf (redirect-stream:stream *stream*) *standard-input*)
    (read-line *stream*)

And that's pretty much it, really. It just redirects everything, just as one might guess.
