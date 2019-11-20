(import ./nodejs {})."github-bot-github:smogon/GitHub-Bot".override {
  postInstall = ''
    npm run build
    # Not sure why the JSON file is not getting copied
    mv src/usernames.json built
  '';
}
