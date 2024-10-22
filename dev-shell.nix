{
  mkShell,
  writeTextFile,
  zsh,
  zsh-wez-man,
}:

let
  zDotDir = writeTextFile {
    name = "zshrc";
    text = ''
      . "${zsh-wez-man}/wez-man.plugin.zsh"
    '';
    destination = "/.zshrc";
  };
in
mkShell {
  buildInputs = [ zsh ];

  shellHook = ''
    ZDOTDIR=${zDotDir} exec zsh -i
  '';
}
