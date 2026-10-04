function fish_title
  echo $_ ' '
  echo -n (pwd | sed "s!^$HOME!~!")
end
