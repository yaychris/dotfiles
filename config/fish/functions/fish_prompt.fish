function fish_prompt
  set_color green
  echo -n (pwd | sed "s!^$HOME!~!")

  set_color cyan

  if test -d .git
    echo -n '' (git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/[\1]/")

    if [ (git status 2> /dev/null | tail -n1) != 'nothing to commit, working tree clean' ]
      echo -n " ☠️ "
    end
  end

  if test -e .ruby-version
    echo -n (rbenv versions 2> /dev/null | awk '/^\* / { print " (" $2 ")" }')
  end

  set_color white
  echo
  echo -n '→ '

  set_color normal
end
