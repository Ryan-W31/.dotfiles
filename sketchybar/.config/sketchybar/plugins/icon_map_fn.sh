function icon_map() {
  case "$1" in
  "Keynote")
    icon_result=":keynote:"
    ;;
  "Ghostty" | "iTerm2" | "kitty" | "Terminal" | "WezTerm")
    icon_result=":terminal:"
    ;;
  "App Store")
    icon_result=":app_store:"
    ;;
  "Home")
    icon_result=":desktop:"
    ;;
  "Other")
    icon_result=":default:"
    ;;
  "Finder")
    icon_result=":finder:"
    ;;
  "Notes")
    icon_result=":notes:"
    ;;
  "Slack")
    icon_result=":slack:"
    ;;
  "Neovim" | "Vim")
    icon_result=":vim:"
    ;;
  "Default")
    icon_result=":default:"
    ;;
  "Pages")
    icon_result=":pages:"
    ;;
  "Mail")
    icon_result=":mail:"
    ;;
  "Music")
    icon_result=":music:"
    ;;
  "Calendar")
    icon_result=":calendar:"
    ;;
  "Safari")
    icon_result=":safari:"
    ;;
  "Arc" )
    icon_result=":arc:"
    ;;
  "VSCode" | "Xcode")
    icon_result=":code:"
    ;;
  "Numbers")
    icon_result=":numbers:"
    ;;
  "Preview")
    icon_result=":pdf:"
    ;;
  "Podcasts")
    icon_result=":podcasts:"
    ;;
  "Docker" | "Docker Desktop")
    icon_result=":docker:"
    ;;
  "Messages")
    icon_result=":messages:"
    ;;
  "IntelliJ IDEA")
    icon_result=":idea:"
    ;;
  "FaceTime")
    icon_result=":face_time:"
    ;;
  "System Preferences" | "System Settings")
    icon_result=":gear:"
    ;;
  *)
    icon_result=":default:"
    ;;
  esac
}

icon_map "$1"

echo "$icon_result"
