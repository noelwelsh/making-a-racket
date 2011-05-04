#lang scribble/manual

@(require scribble/eval)

@title{Testing Testing ...}

In this section we're going to build a tool every programmer should have: a testing framework. This is a fairly simple exercise that will introduce us to several features in Racket, providing insight into different design decisions, and produce a tool we'll use for the following projects in this book.

@section{Initial Spike}

The first thing to do is create a directory for the project and setup source control. I'm calling this package @tt{racktest}, and thus I'm storing it in the @tt{racktest} directory. From the command line:

@verbatim{
  > mkdir racktest
  > cd racktest
  > git init
}

Now we're all ready to create our initial spike. What is our library going to do? The simplest thing possible is to check the result of some expression matches the expected value, and output an error if this is not the case. That is, we want to be able to write something the following and have a useful message that the test failed.

@racket[(check (+ 1 1) 1)]

This is simple enough to implement. We have a function @racket{check} taking two arguments, the @tt{actual} and @tt{expected} values, and printing a message if they are not equal:

@interaction[
  (define (check actual expected)
     (unless (equal? actual expected)
       (format "Test failed. ~a is not equal to ~a." actual expected)))
  (check (+ 1 1) 1)
]

This code should be fairly straightforward. A couple of notes: In Racket @racket[if] must have two arms (that is, a true and a false case). If we want just one case, as above, we use @racket[when] or @racket[unless]. @racket[format] is a way of producing formatted output. It substitutes the printed representation of the given values (@racket[actual] and @racket[expected]) above for the @tt{~a} symbols in the string. There are other symbols that can be used for different effects; see the Racket documentation for more.


@section{Game Time}

Ok, we're ready to go for real. We want to do two things: write the testing library and write tests for said library in said library. Writing these tests will uncover flaws in our library and drive its further development. Start by creating a file @tt{check.rkt} and put in it the definition of @racket[check] above. Now create a file @tt{check-test.rkt} to test @racket[check]. In this file, put... what? How do we test @racket[check]? We can't easily test it, as currently written. What we need is some way to capture the output of @racket[check] and inspect it. We can't have @racket[check] return a value because that wouldn't work in its normal use case. The solution is to have some other value that tells @racket[check] what to do with its result. We could use a mutable variable for this, but the cleanest, safest, and most styling way to do this in Racket is with a @bold{parameter}.

@subsection{Parameters}

So, what is a parameter? A parameter is mutable state made safe. Safe in the presence of threads and continuations (two things we haven't discussed yet) and safe in that we can change the value of a parameter for a given @emph{dynamic} scope and it will be automatically restored when evaluation leaves that scope. Huh? How about an example:

@interaction[
  (define test-parameter (make-parameter "Initial value"))
  (define (current-value)
    (printf "Current value of test-parameter is: ~a\n" (test-parameter)))
  (begin
    (current-value)
    (parameterize ([test-parameter "New value"])
      (current-value))
    (current-value))
]

We start by creating a parameter and binding it to the name @racket[test-parameter]. We then define a procedure to print out the value of @racket[test-parameter]. Note that we get the value of a parameter by just calling it as a function. Finally we show how the value of the parameter is set (by calling @racket[parameterize]) and automatically restored when evaluation leaves the scope of the @racket[parameterize] block. 

There are a couple of conventions governing parameters that you should be aware of. Parameters are usually named @racket[current-foo-bar], where @racket[foo-bar] is subsituted for something appropriate. Sometimes a parameter will provide short-cut syntax for calling @racket[parameterize]. For a parameter called @racket[current-foo-bar] the short-cut form should be called @racket[with-foo-bar]. You will see many examples if you search the Racket documentation for @racket[current-] or @racket[with-]

We can use a parameter to control what @racket[check] does with its result. In normally usage it will barf out text, but when we're testing @racket[check] we can intercept the result and check it is what we expect. This bit of infrastructure will be pervasive in our testing framework, so rather than putting it in @tt{check.rkt}, we'll put it in a file called @tt{base.rkt}. We also want add some structures to represent check success or failure. This is what I have:

@#reader scribble/comment-reader
(racketmod
#:file "base.rkt"
racket/base

;; Test results
(struct test-result ())
;; A success
(struct success test-result ())
;; A failure. Currently contains no useful information -- we'll soon change that.
(struct failure test-result ())

;; default-test-listener: test-result -> void
;;
;; The default processing of test results
(define (default-test-listener result)
  (when (failure? result)
    (error "Test failed")))

;; The parameter through which tests report results
(define current-test-listener
  (make-parameter default-test-listener))


(provide
 (struct-out test-result)
 (struct-out success)
 (struct-out failure)

 default-test-listener
 current-test-listener)
)

