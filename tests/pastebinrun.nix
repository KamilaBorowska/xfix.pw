import <nixpkgs/nixos/tests/make-test-python.nix> {
  nodes.machine = ../services/pastebinrun.nix;

  testScript = ''
    machine.wait_for_open_port(8080)
    id = machine.succeed(
        "curl -X POST 127.0.0.1:8080/api/v1/pastes --data 'code=Hello, world!'"
    )
    assert "Hello, world!" in machine.succeed("curl 127.0.0.1:8080/{}.txt".format(id))
  '';
}
