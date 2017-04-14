function fish_mode_prompt --description 'Displays the current mode'
  switch $fish_bind_mode
  case default
    set_color --bold --background yellow black
    echo ' N '
    set_color --bold --background normal yellow
    echo ''

  case insert
    set_color --bold --background green black
    echo ' I '
    set_color --bold --background normal green
    echo ''

  case visual
    set_color --bold --background red black
    echo ' V '
    set_color --bold --background normal red
    echo ''
  end

  set_color normal
  echo -n ' '
end
