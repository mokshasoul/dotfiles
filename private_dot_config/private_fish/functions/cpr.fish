function cpr -d "copy using rsync with sane defaults"
	# taken from https://wiki.archlinux.org/title/rsync#As_cp/mv_alternative
  rsync --archive -hh --partial --info=stats1,progress2 --modify-window=1 $argv
end
