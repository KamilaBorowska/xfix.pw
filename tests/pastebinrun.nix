(import <nixpkgs/nixos/tests/make-test.nix> {
    machine = {
        imports = [../services/pastebinrun.nix];
        systemd.services.postgresql.serviceConfig.TimeoutStartSec = 600;
    };

    testScript = ''
        $machine->waitForOpenPort(8080);
        my $id = $machine->succeed("curl -X POST 127.0.0.1:8080/api/v1/pastes --data 'code=Hello, world!'");
        $machine->succeed("curl 127.0.0.1:8080/$id.txt") =~ /Hello, world!/ or die;
    '';
} {}).overrideAttrs(old: {
    requiredSystemFeatures = ["nixos-test"];
})
