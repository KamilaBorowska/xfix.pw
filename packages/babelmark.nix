with import <nixpkgs> {};

rustPlatform.buildRustPackage {
  name = "pulldown-cmark-babelmark";

  src = fetchFromGitLab {
    owner = "KonradBorowski";
    repo = "pulldown-cmark-babelmark";
    rev = "1b6456a0a9e2fe541f28a71560a43351e1cda03f";
    sha256 = "1zisrif9si1knwgwfjs2axg8xjaifw5ykmrjrbzghfbn03zj383b";
  };

  cargoSha256 = "12gn0xkdkdc97595fl36inpllmd9pi6q0ldw5hjgj6yyjj9yghh7";
}
