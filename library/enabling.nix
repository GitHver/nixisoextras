{ ...
}:

{
  enabled = { enable = true; };
  disabled = { enable = false; };
  enableBash = { enable = true; enableBashIntegration = true; };
  enableZsh = { enable = true; enableZshIntegration = true; };
  enableFish = { enable = true; enableFishIntegration = true; };
  enableNushell = { enable = true; enableNushellIntegration = true; };
  enableAllShells = {
    enable = true;
    enableBashIntegration = true;
    enableZshIntegration = true;
    enableFishIntegration = true;
    enableNushellIntegration = true;    
  };
}
