---
id: "platform-docs"
title: "The Rocq Platform Docs"
description: |
  Documentation and Tutorials for the Rocq Platform
category: "Introduction"
---

## About

The [Rocq Platform Docs](https://coq.inria.fr/platform-docs/) aims to collaboratively create an action-oriented and interactive documentation for the Rocq Prover and its Platform.
Each core functionality and plugin of the Rocq Prover and the Rocq Platform will have one or several interactive tutorials and/or how-to guides explaining how to use them in practice.
They should further be available online through an interactive interface, which this website is a demo page.

The first tutorials are already available and can be checked out below. They can either be run interactively in a web browser thanks to JsRocq, or downloaded and run with a text editor able to interact with Rocq (e.g. RocqIDE, Emacs with Proof General, Vim with CoqTail, VS Code
with VsRocq).

Some Ressources:

-   The [Zulip channel](https://coq.zulipchat.com/#narrow/stream/437203-Platform-docs)
    we use to discuss and work on the project
-   The associated [RFC](https://github.com/coq/ceps/pull/91) describing the
    project in details
-   The associated [GitHub repository](https://github.com/coq/platform-docs)

## Contributing

We welcome contributions, and there are plenty to do depending on how
much available time you have:

-   Give feedback on the existing tutorial and how-to guides on
    [Zulip](https://coq.zulipchat.com/#narrow/stream/437203-Platform-docs)
-   Answer people's questions and share folklore that should be known
    by all on
    [Zulip](https://coq.zulipchat.com/#narrow/stream/437203-Platform-docs)
-   Help to review tutorials and how-to guides, whether you are an
    expert or not
-   Help to improve and write tutorial and how-to guides
-   Help with the technical aspects of the project

## Small Disclamer

This is a demo, so not everything is working perfectly yet:

-   In the future, the documentation is planned to be indexed on the Coq
    Platform's version, but as of yet, it is only guaranteed to fully
    work with the latest version of the [Coq
    Platform](https://github.com/coq/platform/blob/main/doc/README~8.19~2024.10.md)
    for Coq 8.19.2.
-   The interactive interface is relying on JsCoq1 that only supports
    Coq up to 8.17 so it may fail on some content requiring Coq 8.19. We
    are working towards switching to JsCoq2.

