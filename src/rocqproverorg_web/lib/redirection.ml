open Rocqproverorg

let make ?(permanent = false) t =
  let status = if permanent then `Moved_Permanently else `See_Other in
  Dream.scope ""
    [ Dream_encoding.compress ]
    (List.filter_map
       (fun (origin, new_) ->
         if origin = new_ then None
         else
           Some (Dream.get origin (fun req -> Dream.redirect ~status req new_)))
       t)

let package req =
  let package = Dream.param req "name" in
  Dream.redirect req (Url.Package.overview package)

let package_docs req =
  let package = Dream.param req "name" in
  Dream.redirect req (Url.Package.documentation package)

let opam req =
  Dream.redirect req ("https://rocq-prover.github.io/" ^ Dream.target req)

let t =
  Dream.scope "" []
    ([
       make ~permanent:true [ ("roadmap.html", "/roadmap") ];
       make ~permanent:true [ ("favicon.ico"), "/logos/favicon.ico"];
       Dream.get "/p/:name" package;
       Dream.get "/u/:hash/p/:name" package;
       Dream.get "/p/:name/doc" package_docs;
       Dream.get "/opam/**" opam
     ])
