let index = "/"
let install = "/install"
let packages = "/packages"
let packages_search = "/packages/search"
let packages_autocomplete_fragment = "/packages/autocomplete"

let ocaml_org = "https://ocaml.org"

let rocq_org = "https://rocq-prover.org"

module Package : sig
  val overview : ?hash:string -> ?version:string -> string -> string
  val versions : ?hash:string -> ?version:string -> string -> string

  val documentation :
    ?hash:string -> ?version:string -> ?page:string -> string -> string

  val file :
    ?hash:string -> ?version:string -> filepath:string -> string -> string

  val search_index : ?version:string -> digest:string -> string -> string
end = struct
  let with_hash = Option.fold ~none:"/p" ~some:(( ^ ) "/u/")
  let with_version = Option.fold ~none:"/latest" ~some:(( ^ ) "/")

  let base ?hash ?version page name =
    with_hash hash ^ "/" ^ name ^ with_version version ^ page

  let overview ?hash ?version = base ?hash ?version ""
  let versions ?hash ?version = base ?hash ?version "/versions"

  let documentation ?hash ?version ?(page = "index.html") =
    base ?hash ?version ("/doc/" ^ page)

  let file ?hash ?version ~filepath = base ?hash ?version ("/" ^ filepath)
  let search_index ?version ~digest = base ?version ("/search-index/" ^ digest)
end

let sitemap = "/sitemap.xml"
let community = "/community"
let consortium = "/consortium"
let resources = "/resources"
let events = "/events"
let success_story v = "/success-stories/" ^ v
let industrial_users = "/industrial-users"
let industrial_businesses = "/industrial-users/businesses"
let academic_users = "/academic-users"
let academic_institutions = "/academic-users/institutions"
let about = "/about"
let why = "/why"
let roadmap = "/roadmap"

let minor v =
  match String.split_on_char '.' v with
  | x :: y :: _ -> x ^ "." ^ y
  | _ -> invalid_arg (v ^ ": invalid  version")

let patch v =
  let branch, version = 
    match String.split_on_char '.' v with
    | x :: y :: z :: _ -> false, x ^ "." ^ y ^ "." ^ z
    | x :: y :: [] -> 
      (match String.split_on_char '+' y with
      | [] -> assert false
      | [y] -> false, x ^ "." ^ y
      | y :: z :: [] -> false, x ^ "." ^ y ^ "+" ^ z
      | _ -> invalid_arg (v ^ ": invalid version"))
    | ["master"] -> true, v
    | _ -> invalid_arg (v ^ ": invalid  version")
  in if branch then version else "V" ^ version

let v2 = "https://v2.ocaml.org"
let manual_with_version v = "/doc/" ^ patch v ^ "/refman/index.html"
let manual = "/refman"
let corelib_with_version v = "/doc/" ^ patch v ^ "/corelib/index.html"
let corelib = "/corelib"
let stdlib_with_version v = "/doc/" ^ patch v ^ "/stdlib/index.html"
let stdlib = "/stdlib"
let stdlib_manual_with_version v = "/doc/" ^ patch v ^ "/refman-stdlib/index.html"
let stdlib_manual = "/refman-stdlib"
let api_with_version v = "/doc/" ^ patch v ^ "/api/index.html"
let api = "/api"
let books = "/books"
let changelog = "/changelog"
let changelog_entry id = "/changelog/" ^ id
let releases = "/releases"
let release v = "/releases/" ^ v
let conferences = "/conferences"
let conference v = "/conferences/" ^ v
let rocq_planet = "/rocq-planet"
let local_blog source = "/blog/" ^ source
let blog_post source v = "/blog/" ^ source ^ "/" ^ v
let news = "/news"
let news_post v = "/news/" ^ v
let jobs = "/jobs"
let donation = "/donation"
let rocq_team id =
  match id with
  | None -> "/rocq-team"
  | Some id -> "/rocq-team/" ^ id
let privacy_policy = "/policies/privacy-policy"
let governance_policy = "/policies/governance"
let code_of_conduct = "/policies/code-of-conduct"
let playground = "https://x80.org/rhino-down/"
let papers = "/papers"

let paper id = "/papers/" ^ id
let learn = "/docs"
let learn_docs = "/docs/docs"
let learn_guides = "/docs/tools"
let learn_platform = "/docs/platform-docs"
let platform = "/platform"
let platform_page name = platform ^ "/" ^ name
let consortium_page name = consortium ^ "/" ^ name
let tutorial name = "/docs/" ^ name
let tutorial_search = "/docs/search"
let getting_started = learn ^ "#beginner_section"
let exercises = "/exercises"
let logos = "/logo"

let github_opam_file package_name package_version =
  Printf.sprintf
    "https://github.com/rocq-prover/opam/blob/master/released/packages/%s/%s.%s/opam"
    package_name package_name package_version

let wiki = "https://github.com/rocq-prover/rocq/wiki"