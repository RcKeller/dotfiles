# Define any custom environment scripts here.
# This file is loaded after everything else, but before Antigen is applied and ~/extra.zsh sourced.
# Put anything here that you want to exist on all your environment, and to have the highest priority
# over any other customization.

# replace --force with --force-with-lease (safe force push)
# https://dev.to/jody/default-to-safe-force-pushing-in-git-without-aliases-oi3 
function git {
  # Only touch git if it's the push subcommand
  if [[ "$1" == "push" ]]; then
    force=false
    override=false

    for param in "$@"; do
      if [[ $param == "--force" ]]; then force=true; fi
      if [[ $param == "--seriously" ]]; then override=true; fi
    done

    # If we're using --force but not --seriously, change it to --force-with-lease
    if [[ "$force" = true && "$override" = false ]]; then
      echo -e "\033[0;33mDetected use of --force! Using --force-with-lease instead. If you're absolutely sure you can override with --force --seriously.\033[0m"

      # Unset --force
      for param; do
        [[ "$param" = --force ]] || set -- "$@" "$param"; shift
      done

      # Replace it with --force-with-lease
      set -- "push" "$@" "--force-with-lease"; shift
    else
      if [[ "$override" = true ]]; then
        echo -e "\033[0;33mHeads up! Using --force and not --force-with-lease.\033[0m"
      fi

      # Unset --seriously or git will yell at us
      for param; do
        [[ "$param" = --seriously ]] || set -- "$@" "$param"; shift
      done
    fi
  fi

  command git "$@"
}
