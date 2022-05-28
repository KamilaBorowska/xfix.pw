import <nixpkgs/nixos/tests/make-test-python.nix> {
  nodes.machine = ../services/babelmark.nix;

  testScript = ''
    machine.wait_for_open_port(8081)
    out = machine.succeed(
        "curl http://127.0.0.1:8081/api/babelmark/pulldown-cmark?text=_hi_"
    )
    assert "<em>hi</em>" in out
  '';
}
