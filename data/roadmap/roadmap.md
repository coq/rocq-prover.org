## Vision

The Rocq Development Team, building on 40 years of experience with
Coq, is pleased to announce the launch of The Rocq Prover, a 
next-generation proof assistant. The Rocq Prover is designed to
empower a diverse range of users, from mathematicians seeking 
formal rigor to software engineers building high-assurance systems.

The Rocq Prover builds upon the rich heritage and diverse ecosystem of Coq. We
promote a fast-paced development methodology to deliver impactful
changes frequently, supporting academic and industrial research, and
continuously improving user experience. At the same time, we are
mindful of compatibility and ecosystem maintainability.

This roadmap outlines our vision for Rocq's future, focusing on four
key pillars:

- **Open and Accessible**: The Rocq Prover provides user-friendly
  installation, comprehensive educational resources, and a thriving
  community to ensure everyone can benefit from its power. We also
  explore AI-powered features to enhance usability and productivity.

- **Trustworthy**: The Rocq Prover prioritizes self-verification,
  ensuring the highest level of trust in your formal proofs.

- **Maintainable**: We are committed to a clean and streamlined
  codebase, simplifying future development and reducing burden on
  developers and users.

- **Widely applicable**: We do our best to improve the usability of
  Rocq for diverse research and industrial applications. This includes
  improving performance, streamlining domain-specific tools, etc.

*Join us in shaping the future of formal verification!*

## Target Audiences

*A,B,C,D,E are used hereafter to refer to the target audiences of each
 feature, references are given at the end of this roadmap.*

- **(A) Math Education**: The Rocq Prover is a great tool for
  improving mathematical writing skills. Machine-checking mathematics
  can even become an addictive serious game.

- **(B) Computer Science Education**: The Rocq Prover is used
  worldwide to teach software foundations and program verification,
  both in academia and in the industry.

- **(C) Computer Engineering**: Software developers use the Rocq
  Prover for producing high-assurance code embedded in critical
  components (*e.g,.* [BlueRock Security](https://www.bluerock.io/)
  and [Formal Vindication](https://formalv.com/)).

- **(D) Interactive Theorem Proving Research**: Academics explore novel
  applications, usage and extensions of the Rocq Prover.

- **(E) Research users**: The Rocq Prover is used as a research instrument
  in a wide range of domains including programming language research, fundamental mathematics,
  computer algebra, robotics, cryptography, hardware design, etc.

## 1. Open and Accessible

- **Accessibilty:** The Rocq Platform delivers easy installation
  and package integration. We are also actively working on IDE
  improvements for the various usages of the Rocq Prover (all audiences).

- **Documentation:** We strive to document best practices, tools, and
  packages, so as to enhance usability for newcomers and experienced
  users alike (all audiences).

- **AI-powered Features:** Leverage AI for improved suggestion
  mechanisms, proof search, information retrieval, error reporting,
  and visualization (A, B, C, E).

- **Community:** Meet us at the RocqPL, Rocq Workshops, and Rocq Users and Developers Workshop (RUDW)
  meetings! We will also continue fostering a strong and collaborative
  community through initiatives like Rocq-community (all
  audiences).

## 2. Trustworthy

- **Certified Type Theory and Extraction:** The Rocq Prover is based
  on the formal verification of its type theory implementation and
  extraction system, minimizing the trusted code base and increasing
  user confidence in results (C, D, E).

## 3. Maintainable

- **Codebase Consolidation:** We are planning to streamline the
  codebase by selecting the best solutions from various experiments
  already implemented in the Coq proof assistant, *e.g.,* unification
  algorithms, tactic sets, overloading mechanisms, universe handling
  mechanisms, and function definition methods. This goal is to reduce
  duplication and simplify user experience (all audiences).

- **Ltac2 Transition:** Our proof assistant provides a lightweight
  language for automating small proving tasks (Ltac).  Experience
  showed that this language is becoming a power tool. We provide a
  more principled version (Ltac2) and facilitate a smooth transition
  from Ltac to Ltac2 for improved extensibility (all audiences).

- **Agile Backward Compatibility:** We prioritize user support and
  documentation for evolving features without committing to full
  backward compatibility, taming the burden of adapting older
  developments but at the time allowing for major innovations (all
  audiences).

- **API Stability:** We ensure stable APIs for external tools like
  automation frameworks, interfaces, and plugins (C, D).

- **Library Integration:** Simplify collaboration and integration of
  existing and future libraries from diverse contributors (C, E).

## 4. Widely applicable

- **Performance**: address performance limitations that impact
  projects that are widely used in industry and academia (C, D, E).

- **Theory Transfer Support:** Develop tools for transferring proofs
  and concepts between different representations, *e.g.*,
  proof-oriented vs. computation-oriented structures (D, E).

- **Multi-theory and Logic Support:** Enable support for classical,
  exceptional, and observational logics within the same system (D, E).

- **Domain-Specific Customization:** Provide user interface
  adaptations for efficient use in specific domains like education and
  engineering (A, B, C).

- **Metaprogramming support:** Multiple platforms for metaprogramming
  tactics and terms manipulations (Ltac2, Elpi, MetaCoq) (C, D, E)

- **Improved Notation and Structuring Mechanisms:** Improve the
  notation system and structuring tools such as Hierarchy Builder (all
  audiences).

- **Balancing Generality with Domain Specificity:** Maintain a general
  framework with core libraries while simultaneously supporting
  domain-specific libraries (*e.g.,* Iris) (all audiences).


**_This roadmap represents our ongoing commitment to making the Rocq
  Prover a powerful, user-friendly, and reliable proof assistant for a
  broad range of users. We welcome feedback and contributions from the
  community to help us achieve this vision._**
