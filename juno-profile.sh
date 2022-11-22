# Enable Wayland for Firefox
if [ "$XDG_SESSION_TYPE" == "wayland" ]; then
    export MOZ_ENABLE_WAYLAND=1
fi

# Enable Wayland on Kotatogram
if [[ $(loginctl show-session "$XDG_SESSION_ID" -p Type --value) = 'wayland' ]]; then
    export QT_QPA_PLATFORM=wayland
fi

