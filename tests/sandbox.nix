import <nixpkgs/nixos/tests/make-test-python.nix> {
  nodes.machine = ../services/sandbox.nix;

  testScript = ''
    machine.wait_for_open_port(8082)
    out = machine.succeed("""
        curl --data '{"files": {}, "stdin": "", "code": "echo Hello, world!"}' http://localhost:8082
    """)
    assert "Hello, world!" in out
  '';
}
