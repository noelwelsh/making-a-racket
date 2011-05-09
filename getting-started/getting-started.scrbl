#lang scribble/manual

@(require scribble/eval)
@(require scriblib/footnote)

@title{Getting Started}

This Chapter covers why Racket is interesting, what this book is about, how to get Racket installed on your system, and the major components of a Racket install. If you have already installed Racket make sure it is at least version @eval[(version)], the version I used when writing this book.


@section{Why Racket?}

Why learn Racket? The best answer I have is that Racket is a fun and fast way to solve practical programming problems, and also an interesting language to study for its own right. Racket is a multiparadigm language. It is functional, object-oriented, dynamically typed @note{Those who study type systems say there is no such thing as dynamic typing. I use the term here in the widely used, if ill-defined, meaning.}, statically typed, concurrent, parallel, and more. The lessons learned from studying Racket can be applied to programming in any language, and they will make you a better programmer for it.

One thing that makes Racket unique is that it explicitly supports language extension, to the extent that the Racket distribution comes with many interoperable language implementations (I'll mention some in @Secref{the-racket-system}) and encourages the developer (you!) to implement their own languages. This extensibility ranges from small additions to Racket, called macros, to entirely new languages with completely different syntax and semantics to Racket.


@subsection{Racket as a Scheme}

Many people come to Racket when they decide to learn Scheme. Till relatively recently Racket was known as PLT Scheme, and it is reasonable to say that Racket is a Scheme dialect. This raises two more questions: what is Scheme, and what does it mean to be a Scheme dialect?

Scheme is a programming language invented in 1975 by Guy Steele and Gerald Sussman. Scheme was the source of many important advances in programming language theory, and one of the first functional languages. 

Scheme has always been very loosely standardised. The Scheme standard, the latest version at the time of writing being R7RS, has always been problematic for people looking for a practical Scheme implementation. There are two reasons for this. The first is that the standards have always been very minimal, not specifying features important for practical programming. For example, only in R6RS was a module system specified. There have been various efforts to address this, notably the @link["http://srfi.schemers.org/" "SRFIs"] system, but these efforts have been plagued by the problem of working with the lowest common denominator specified in the standard. The other issue is down to the working on the standardisation process. It has been difficult to find consensus on the direction of Scheme and this has meant standards that move very slowly. This net result is that those trying to innovate in the space of Scheme-like languages have been forced to blaze their own trail. Racket is one such system, as though it supports standard Scheme this is not the main focus of the implementation and the Racket language provides many features not found in standard Scheme.

This book covers the Racket language, not its close cousin Scheme. Learning Racket will give yout he ability to write Scheme, but the a focus of this book is practical programming which requires we go beyond the limited facilities offered by the standard.


@section[#:tag "what-is-this-book-about"]{What is This Book About?}

The main goal of this book is give you the ability to write in Racket the kind of programs that interest you. I think being an accomplished developer extends beyond simply understanding the semantics of the language constructs. Thus I say this book is about @bold{pragmatics, patterns, and processes}. Pragmatics means how the language is used to accomplish practical tasks. Patterns refer to the way that language features are used together to construct elegant, maintainable, and performant code. In many cases there is no right answer to how a program should be structured, so we will spend some time discussing design tradeoffs. Process covers the actual steps taken to construct code. This is not just writing the code, but how testing is done, how version control is used, and so on. Few programming books say much about process, but I think is an important aspect of development and so cover it here.

There is another goal of this book: @bold{to be fun}. I want this book to be fun to read, and I also want it to be fun to write! This impacts the book in a few different ways. The book is mostly organised around implementing projects. I find it much more fun to write about concepts in the context of some practical problem, and hopefully you'll find it more enjoyable to read this kind of book as well. It also means I have an excuse to implement loads of projects for which I've never been able to justify the time! It also means I'm not making any particular attempt to select projects that I feel are representative in some way. The projects are squarely aimed at my interests. Hopefully you'l find them interesting as well. Finally, I couldn't bear writing an introductory book on Racket. There are already great books in this area, @link["http://htdp.org/" "How to Design Programs"] being one. I'm assuming you know some Racket, or can at least catch up quickly (possibly with the help of another book.)

@section{Up and Running With Racket}

Let's get on to installing Racket and setting up a development environment. Installing Racket is a straightforward process, as pre-packaged installers are available for all major platforms. I'm also going to tell you how to install development versions of Racket so, like me, you can live on the bleeding edge if you wish. Finally, I'm going to discuss setting up @link["http://emacs.org" "Emacs"] for Racket. You don't need to use Emacs with Racket, but many people do and there some great Emacs packages available.

@subsection{Installing Racket}

@subsubsection{Installing Nightly Builds}

@subsubsection{Building from Source}

@subsection{A First Program in Racket}

Setting the language.

@section[#:tag "the-racket-system"]{The Racket System}

@section{Racket Languages}