open Rocqproverorg

let asset_loader =
  Static.loader
    ~read:(fun _root path -> Rocqproverorg_static.Asset.read path |> Lwt.return)
    ~digest:(fun _root path ->
      Option.map Dream.to_base64url (Rocqproverorg_static.Asset.digest path))
    ~not_cached:[ "robots.txt"; "/robots.txt" ]

let media_loader =
  Static.loader
    ~read:(fun _root path -> Rocqproverorg_static.Media.read path |> Lwt.return)
    ~digest:(fun _root path ->
      Option.map Dream.to_base64url @@ Rocqproverorg_static.Media.digest path)

let playground_loader =
  Static.loader
    ~read:(fun _root path -> Rocqproverorg_static.Playground.read path)
    ~digest:(fun _root path ->
      Option.map Dream.to_base64url @@ Rocqproverorg_static.Playground.digest path)

let page_routes _t =
  Dream.scope ""
    [ Dream_encoding.compress ]
    [
      Dream.get Url.index Handler.index;
      Dream.get Url.install Handler.install;
      Dream.get Url.learn Handler.learn;
      Dream.get Url.learn_docs Handler.learn_docs;
      Dream.get Url.learn_guides Handler.learn_guides;
      Dream.get Url.community Handler.community;
      Dream.get Url.consortium Handler.consortium;
      Dream.get (Url.consortium_page ":id") (Handler.consortium_page Commit.hash);
      Dream.get Url.events Handler.events;
      Dream.get Url.changelog Handler.changelog;
      Dream.get (Url.changelog_entry ":id") Handler.changelog_entry;
      Dream.get (Url.success_story ":id") Handler.success_story;
      Dream.get Url.industrial_users Handler.industrial_users;
      Dream.get Url.industrial_businesses Handler.industrial_businesses;
      Dream.get Url.academic_users Handler.academic_users;
      Dream.get Url.academic_institutions Handler.academic_institutions;
      Dream.get Url.about Handler.about;
      Dream.get Url.why Handler.why;
      Dream.get Url.roadmap Handler.roadmap;
      Dream.get Url.books Handler.books;
      Dream.get Url.releases Handler.releases;
      Dream.get Url.resources Handler.resources;
      Dream.get (Url.release ":id") Handler.release;
      Dream.get Url.conferences Handler.conferences;
      Dream.get (Url.conference ":id") Handler.conference;
      Dream.get Url.rocq_planet Handler.rocq_planet;
      Dream.get Url.news Handler.news;
      Dream.get (Url.news_post ":id") Handler.news_post;
      Dream.get Url.jobs Handler.jobs;
      Dream.get Url.privacy_policy Handler.privacy_policy;
      Dream.get Url.code_of_conduct Handler.code_of_conduct;
      Dream.get (Url.rocq_team None) Handler.governance;
      Dream.get (Url.rocq_team (Some ":id")) Handler.governance_team;
      Dream.get Url.governance_policy Handler.governance_policy;
      Dream.get Url.papers Handler.papers;
      Dream.get (Url.paper ":id") Handler.paper;
      Dream.get Url.exercises Handler.exercises;
      Dream.get Url.platform Handler.platform;
      Dream.get (Url.platform_page ":id") (Handler.platform_page Commit.hash);
      Dream.get Url.tutorial_search Handler.learn_documents_search;
      Dream.get (Url.tutorial ":id") (Handler.tutorial Commit.hash);
      Dream.get Url.playground Handler.playground;
      Dream.get Url.logos Handler.logos;
      Dream.get Url.opam_packaging Handler.opam_packaging;
      Dream.get Url.opam_layout Handler.opam_layout;
    ]

let package_route t =
  Dream.scope ""
    [ Dream_encoding.compress ]
    [
      Dream.get Url.packages (Handler.packages t);
      Dream.get Url.packages_search (Handler.packages_search t);
      Dream.get Url.packages_autocomplete_fragment
        (Handler.packages_autocomplete_fragment t);
      Dream.get
        (Url.Package.overview ":name" ~version:":version")
        ((Handler.package_overview t) Handler.Package);
      Dream.get
        (Url.Package.overview ~hash:":hash" ":name" ~version:":version")
        ((Handler.package_overview t) Handler.Universe);
      Dream.get
        (Url.Package.versions ":name" ~version:":version")
        ((Handler.package_versions t) Handler.Universe);
      Dream.get
        (Url.Package.versions ~hash:":hash" ":name" ~version:":version")
        ((Handler.package_versions t) Handler.Universe);
      Dream.get
        (Url.Package.documentation ":name" ~version:":version" ~page:"**")
        ((Handler.package_documentation t) Handler.Package);
      Dream.get
        (Url.Package.documentation ~hash:":hash" ~page:"**" ":name"
           ~version:":version")
        ((Handler.package_documentation t) Handler.Universe);
      Dream.get
        (Url.Package.search_index ":name" ~version:":version" ~digest:":digest")
        ((Handler.package_search_index t) Handler.Package);
      Dream.get
        (Url.Package.file ":name" ~version:":version" ~filepath:"**")
        ((Handler.package_file t) Handler.Package);
      Dream.get
        (Url.Package.file ~hash:":hash" ":name" ~version:":version"
           ~filepath:"**")
        ((Handler.package_file t) Handler.Package);
    ]

let sitemap_routes =
  Dream.scope ""
    [ Dream_encoding.compress ]
    [ Dream.get Url.sitemap Handler.sitemap ]

let graphql_route t =
  Dream.scope ""
    [ Dream_encoding.compress ]
    [
      Dream.any "/graphql" (Dream.graphql Lwt.return (Graphql.schema t));
      Dream.get "/graphiql" (Dream.graphiql "/graphql");
    ]

let router t =
  Dream.router
    [
      Redirection.t;
      page_routes t;
      package_route t;
      graphql_route t;
      sitemap_routes;
      Dream.scope ""
        [ Dream_encoding.compress ]
        [ Dream.get "/doc/**" (Dream.static Config.doc_path) ];
      Dream.scope ""
        [ ]
        [ Dream.get "/media/**" (Dream.static ~loader:media_loader "") ];
      Dream.scope ""
        [ Dream_encoding.compress ]
        [
          Dream.get
            (Rocqproverorg_static.Playground.url_root ^ "/**")
            (Dream.static ~loader:playground_loader "");
        ];
      Dream.scope ""
        [ Dream_encoding.compress ]
        [ Dream.get "/**" (Dream.static ~loader:asset_loader "") ];
    ]
