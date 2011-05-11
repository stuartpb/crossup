local list={}

--append step
local function as(s)
  list[#list+1]=s
end

as{d = "Resources";
  package "words", --"wamerican" and "wbritish" in Ubuntu
  package "ttf-ms-fonts", --also consolas
  package "ttf-droid",
  --{d = "Templates";
    --iuplua .wlua file
    --coding cookie/shbang'd .lua
    --shbang'd sh
  --},
  --{d = "Information";
    --{d = "Readers";
      -- wikipediadumpreader
      -- goldendict
    --},
    -- Devil's Dictionary (dict-devil)
    -- dict-foldoc
    -- dict-gcide
    -- Jargon file (dict-jargon)
    -- dict-moby-thesaurus
    -- dictionaries-common
    -- miscfiles (http://www.gnu.org/software/miscfiles/)

    --Wikipedia dump
    --rsync -avz ftp.rfc-editor.org::rfcs-text-only ~/Documents/RFCs
  --}
}

as{d = "Window managers";
  package "xfce4",
  package "awesome", --Xephyr (xserver-xephyr) is kind of necessary
                     --for development
  package "metisse", --AUR on Arch
}

as{d = "Media player";
  package "muine",
}

as{d = "Text editor";
  package "scribes",
}

as{d = "Web browser";
  package "google-chrome-dev",
}

as{d = "Locale";
  depend="chain"; --each step requires the last
  {d = "Install locale";
    cpresource("en_US@stuart", "/usr/share/i18n/locales"),
  },
  {d = "Compile the locale";
    sudo "localedef -f UTF-8 -i en_US@stuart en_US.UTF-8@stuart",
  }
  {d="set up the environment to use this locale";
    envsetup("LANG", "en_US.UTF-8@stuart"),
    --(or LC_TIME instead of LANG to not clobber the other en_US stuff)
  },
  {d = "set up GNOME's clock";
    --gconfset("/apps/clock_applet/prefs/custom_format", "%p%I:%M")
    --on my machine it looked more like this
    gconfset("/apps/panel/applets/clock_screen0/prefs/custom_format", "%p%I:%M"),
    gconfset("/apps/panel/applets/clock_screen0/prefs/format","custom")
  },
}

local schemename="stubuntu"
as{d = "Sounds";
  cpresource(schemename,"/usr/share/sounds"),
  --contains system-ready
  --desktop-login

  {d = "Set up on GNOME";
    gconfset("/desktop/gnome/sound/theme_name",schemename),
  },
  {d = "Set up for GDM";
    asuser("gdm",gconfset("/desktop/gnome/sound/theme_name",schemename))
  }
}

as{d = "Tools 'n' toys";
  {d = "Git";
    package "git",
    package "git-gui",
    package "giggle",
    package "gitg",
  },
  package "squeak",
  package "love",
  package "blender",
  package "inkscape",
  package "audacity",
  package "espeak",
  package "fontforge",
  {d = "Interfaces";
    package "eaglemode",
    package "dasher",
    package "fsv", --File System Visualizer
    package "3dwm",
  },
  {d = "Lisp";
    package "lisp",
    package "arc", --http://ycombinator.com/arc/tut.txt
  },
  {d = "Graphviz";
    package "graphviz",
    package "graphviz-cairo",
  },
  {d = "Python";
    on=false;
    package "python",
    package "idle",
  },
  {d = "Ruby";
    on=false;
    package "ruby",
    package "irb",
  },
  {d = "C IDE";
    package "anjuta",
  },
  package "erlang",
  package "m4", --this is in base-devel on arch
  package "redis",
}

as{d = "Games";
  package "beneath-a-steel-sky",
  package "dopewars",
  package "flight-of-the-amazon-queen",
  package "freeciv",
  package "freedoom",
  package "freedm",
  package "golly",
  package "lbreakout2",
  package "nethack-qt",
  package "oneisenough",
  package "singularity",
  package "bsd-games",
  {d = "Emulators";
    {d = "NES";
      package "gfceux",
    },
    {d = "Arcade";
      package "gmameui",
      --configure directories and get cheats file
    },
    {d = "Atari";
      package "stella",
    },
  },
  --ROMs
  --World of Goo
}

as{d = "Hax";
  package "nmap",
  package "aircrack-ng",
  package "john",
  package "whois"
}

--Hulu Desktop and Livestation

as{d = "Lua stuff";
  package "luarocks",
  --{d = "Tecgraf libs";
    --get the Tecgraf libs, make sure they're on Lua's path (lib?51.so)
    --run ldconfig
  --},
  --{d = "File associations";
    --add *.wlua to /usr/share/mime/packages/freedesktop.org.xml's globs for lua
    --sudo update-mime-database /usr/share/mime
  --},
}

as{d = "Pointless wastes of time";
  package "electricsheep"
}

as{d = "Server stuff";
  package "daemonize",
  package "dtach", --failing that, screen will do
  {d = "DNS";
    package "dnsmasq",
    package "dnsutils",
  },
  {d = "HTTP";
    package "apache2",
  },
  --{d = "Steam";
    --wget http://storefront.steampowered.com/download/hldsupdatetool.bin /home/hlds/
  --},
}

as{d = "Windows connectivity",
  package "synergy",
  package "quicksynergy",
  package "rdesktop", --RDP client
  package "xrdp", --RDP server
}

