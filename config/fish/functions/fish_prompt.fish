function fish_prompt
  set -l path (pwd | sed "s!^$HOME!~!")
  set -l git_submodule
  set -l git_branch
  set -l git_dirty
  set -l ruby_version

  # Check if we're in a git repository
  if [ -e .git ]
    # Check for submodule
    if [ -f .git ]
      set git_submodule "(submodule)"
    end

    # Get current branch
    set git_branch (git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/[\1]/")

    # Get working directory status
    if [ (git status 2> /dev/null | tail -n1) != 'nothing to commit, working tree clean' ]
      set git_dirty "☠️"
    end
  end

  # Check for current ruby version
  if [ -e .ruby-version ]
    set ruby_version (rbenv versions 2> /dev/null | awk '/^\* / { print "(ruby: " $2 ")" }')
  end

  set_color green
  echo -n "$path"

  set_color cyan
  echo -n " $ruby_version $git_submodule $git_branch $git_dirty" | tr -s ' '

  set_color white
  echo
  echo -n '→ '

  set_color normal
end
