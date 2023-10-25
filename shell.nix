let
  mozillaOverlay =
    import (builtins.fetchGit {
      url = "https://github.com/mozilla/nixpkgs-mozilla.git";
    });
  nixpkgs = import <nixpkgs> { overlays = [ mozillaOverlay ]; };
  # rust-nightly = with nixpkgs; ((rustChannelOf { date = "2022-11-15"; channel = "nightly"; }).rust);
in
with nixpkgs; pkgs.mkShell {
  nativeBuildInputs = [
      (nixpkgs.rustChannelOf { date = "2023-10-25"; channel = "nightly"; }).rust
  ];
}
