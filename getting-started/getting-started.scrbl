#lang scribble/manual

@(require scribble/eval)
@(require scriblib/footnote)

@title{Getting Started}

This Chapter covers why Racket is interesting, what this book is about, how to get Racket installed on your system, and the major components of a Racket install. If you have already installed Racket make sure it is at least version @eval[(version)], the version I used when writing this book.


@section{Why Racket?}

Why learn Racket? The best answer I have is that Racket is a fun and fast way to solve practical programming problems, and also an interesting language to study for its own right. Racket is a great language for web sites, systems programming, image processing, and more. Racket is a multiparadigm language. It is functional, object-oriented, dynamically typed@note{Those who study type systems say there is no such thing as dynamic typing. I use the term here in the widely used, if ill-defined, meaning.}, statically typed, concurrent, parallel, and more. The lessons learned from studying Racket can be applied to programming in any language, and they will make you a better programmer for it.

One thing that makes Racket unique is that it explicitly supports language extension, to the extent that the Racket distribution comes with many interoperable language implementations (I'll mention some in @Secref{the-racket-system}) and encourages the developer (you!) to implement their own languages. This extensibility ranges from small additions to Racket, called macros, to entirely new languages with completely different syntax and semantics to Racket.

@subsection{Racket as a Scheme}

Many people come to Racket when they decide to learn Scheme. Till relatively recently Racket was known as PLT Scheme, and it is reasonable to say that Racket is a Scheme dialect. This raises two more questions: what is Scheme, and what does it mean to be a Scheme dialect?

Scheme is a programming language in the Lisp family, invented in 1975 by Guy Steele and Gerald Sussman. Scheme was the source of many important advances in programming language theory, and one of the first functional languages. 

Scheme has always been very loosely standardised. The Scheme standard, the latest version at the time of writing being R7RS, has been problematic for people looking for a practical Scheme implementation. The standards have always been very minimal, not specifying features important for practical programming. For example, only in R6RS was a module system specified. There have been various efforts to address this, notably the @link["http://srfi.schemers.org/" "SRFIs"] system, but these efforts have been plagued by the problem of working with the lowest common denominator specified in the standard. The other issue is the working on the standardisation process. It has been difficult to find consensus on the direction of Scheme and this has meant standards that move very slowly. This net result is that those trying to innovate in the space of Scheme-like languages have been forced to blaze their own trail. Racket is one such system. Though it supports standard Scheme this is not the main focus of the implementation, and the Racket language provides many features not found in standard Scheme.

This book covers the Racket language, not its close cousin Scheme. Learning Racket will give yout he ability to write Scheme, but the a focus of this book is practical programming which requires we go beyond the limited facilities offered by the standard.


@section[#:tag "what-is-this-book-about"]{What is This Book About?}

The main goal of this book is make you an accomplished programmer in Racket. This entails more than simply understanding the language constructs and libraries, or pragmatics. To construct larger systems we need to explore and understand the tradeoffs between different designs, or design patterns. To do this efficiently we must learn from the experience of others, so where appropriate I'll link to interesting systems and publications. Finally I will cover an efficient process for constructing code. This extends beyond the boundaries of Racket, encompassing build process, version control, and other tools. In summary, this book is about @bold{pragmatics, patterns, and processes}. I'm not arrogant enough to believe I can provide the definitive text of any of these aspects. Luckily, as this book is published online there is no need to attempt such a feat. If you have a contribution to any aspect of the book you can email me or mention it in the forum. If I agree with your suggestion I'll include it in the next update.

There is another goal of this book: @bold{to be fun}. I want it to be fun to read, and I also want it to be fun to write! This impacts the book in a few different ways. The book is mostly organised around implementing projects. I find it much more fun to write about concepts in the context of some practical problem, and hopefully you'll find it more enjoyable to read this kind of book as well. It also means I have an excuse to implement loads of projects for which I've never been able to justify the time! I'm not making any particular attempt to select projects that I feel are representative in some way. The projects are squarely aimed at my interests. Hopefully you'l find them interesting as well. Finally, I couldn't bear writing an introductory book on Racket. There are already great books in this area, @link["http://htdp.org/" "How to Design Programs"] being one. I'm assuming you know some Racket, or can at least catch up quickly (possibly with the help of another book.)


@section{Up and Running With Racket}

Let's get on to installing Racket and setting up a development environment. Installing Racket is a straightforward process, as pre-packaged installers are available for all major platforms. I'm also going to cover installing development versions of Racket so, like me, you can live on the bleeding edge if you wish. Finally, I'm going to discuss setting up @link["http://emacs.org" "Emacs"] for Racket. You don't need to use Emacs with Racket, but many people do and there are some great Emacs packages available.

@subsection{Installing Racket}

Installing a released version of Racket is as simple as going to @link["http://download.racket-lang.org/" "http://download.racket-lang.org/"] and grabbing the installer for your platform. On Linux systems you can see if your package manager has an up-to-date package for Racket. If your package manager is not up-to-date, you should try the Linux install [TODO: finish]

@subsubsection{Installing Nightly Builds}

Nightly builds provide a simple way to keep up with Racket's development. They are a particularly good way to get hold of bug fixes without having to build from source. Nightly builds are provided in the same range of installers as the releases. 

@subsubsection{Building from Source}

If you need the latest and greatest (and you know you do), building from source is the only way to go. On Unix and OS X building from source just requires the familiar @tt{configure}, @tt{make}, and @tt{make install} steps. On Windows I don't have a clue, as I haven't used that operating system with any regularity for over a decade. Luckily, other people do have a clue and once you have the source you can read the documenation in @tt{src/README} for full instructions for all platforms.

@subsection{Setting Up Racket}

There is one step to setting up Racket beyond installing it: choosing the default language. Rememeber that Racket supports many different languages. Most of the time the first line in any Racket program specifies the language to use. For historical reasons DrRacket, Racket's IDE, can be configured to use a fixed language as the language for any program. We want to use the language declared in the source. Let's set that up now. Start DrRacket, go to the Language menu and select Choose Language. When the dialog box open, make sure "Use the language declared in the source" is selected.

@subsection{Setting up Emacs}

If Emacs is your text editor of choice, I suggest you install Neil van Dyke's @link["http://neilvandyke.org/" "Quack"] package which extends @tt{scheme-mode} with some useful functions. The @link["Geiser" "TODO: fix me"] package provides excellent tools for interacting with a running Racket system. The @link["par-edit" "TODO: fix me"] package provides a structured editor for Racket code. It takes some getting used to, but I recommend making the effort. I use three all packages when editing Racket code.

@section[#:tag "the-racket-system"]{The Racket System}

Now that we've installed Racket, what do we have? The main executables are @tt{racket}, @tt{drracket}, @tt{raco}, and @tt{plt-help}.

@tt{Racket} is the command-line interpreter@note{Racket provides a just-in-time compiler, so isn't really an interpreter} for Racket. Run it and you'll be presented with a prompt, known as a read-eval-print-loop or REPL, where you can type Racket code and see the results. You can pass command line options to Racket to have files run instead.

DrRacket is a development environment for Racket. If you're not familiar with Emacs (or some other text editor) and the command-line using DrRacket is the best choice for developing Racket code.

@tt{Raco} is the "Racket command object". It provides access to useful functions that fall outside the Racket interpreter. You access these commands by running @tt{raco <commandname>}. Commands include:

@itemlist[
        @item{@tt{make} to compile source to byte-code. Byte-code doesn't run any faster but it does load faster, which is useful for large projects.}

        @item{@tt{docs} to view help on a topic.}

        @item{@tt{planet} to create and manage packages installed through @link["http://planet.racket-lang.org/" @PLaneT], Racket's package distribution method.}
]

@section{Racket Languages}

To give you an idea of the flexibility of Racket, here are some of the languages included with the Racket distribution:

@itemlist[
        @item{@bold{Typed Racket} is a statically typed version of Racket. Using Typed Racket gains use compile-time checking and additional speed, at the cost of foregoing some language features that aren't (currently) compatible with Typed Racket's type system. Typed Racket and Racket code, like all Racket languages, are fully interoperable.}

        @item{@bold{FrTime} is a language for writing interactive programs using a style known as functional reactive programming.}

        @item{@bold{R6RS Scheme} is the Scheme language specified in the R6RS standard.}

        @item{@bold{Datalog} is a logic programming language in the style of Prolog.}
]

