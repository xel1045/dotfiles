# Initialize fnm (Fast Node Manager)
if [ -x "$(command -v fnm)" ]; then
  FNM_COREPACK_ENABLED=true
  eval "`fnm env --shell zsh`"
fi